package com.kh.DeVenue.member.controller;

import static com.kh.DeVenue.common.PaginationClient.getPageInfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.DeVenue.member.model.exception.MemberException;
import com.kh.DeVenue.member.model.service.MemberService;
import com.kh.DeVenue.member.model.vo.CPeval;
import com.kh.DeVenue.member.model.vo.EPid;
import com.kh.DeVenue.member.model.vo.EvalProjectList;
import com.kh.DeVenue.member.model.vo.FCeval;
import com.kh.DeVenue.member.model.vo.FCprojectHistory;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.FindClientDetail;
import com.kh.DeVenue.member.model.vo.MatchingPartnersList;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.PageInfo;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.model.service.MemberService2;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
import com.kh.DeVenue.util.model.service.ChatService;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;
import com.kh.DeVenue.util.model.vo.MemChatSet;

@Controller
public class MemberController {

	// 회원가입페이지으로 이동
	@RequestMapping("signpage.do")
	public String signview() {
		return "member/sign";
	}

	// 로그인으로 이동
	@RequestMapping("loginpage.do")
	public String loginview() {
		return "member/login";
	}

	// 비밀번호 찾기로 이동
	@RequestMapping("forgetPwd.do")
	public String forgetPwd() {
		return "member/forgetPwd";
	}

	// 메인페이지로 돌아가기

	@Autowired
	private MemberService mService;
	@Autowired
	private MemberService2 mmService;
	@Autowired
	private ChatService cService;

	// 로그인하기전에 체크해본다.
	@RequestMapping(value="loginChk.do")
	public void loginCheck(@RequestParam("email") String email, @RequestParam("pwd") String pwd, HttpServletResponse response
			, RedirectAttributes redirectAttributes) throws IOException {
		System.out.println(email);
		System.out.println(pwd);
		PrintWriter out = response.getWriter();
		
		Member member = mService.selectMmber(email,pwd);
		System.out.println(member);
		
		if(member != null) {
			out.append("true");
		}else {
			out.append("false");
		}
		out.flush();
		out.close();
		
	}
	
	// 할일 로그인 유지/ 브라우저 종료시 reload
	// 로그인 유지할때 request와 session으로 넘겨버리면???
	// 로그인 값 받아오기
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String memberLogin(HttpSession session, HttpServletRequest request, Model model, ModelAndView mv) {

		
//		// 자동로그인 checkbox 선택했는지
//		String logincheck = request.getParameter("logincheck");
//		System.out.println(logincheck); // true or null(value를 true로 설정했기때문에)

		String memEmail = request.getParameter("email");
		String memPwd = request.getParameter("pwd");
		Member m = new Member(memEmail, memPwd);
//		System.out.println(m);
		Member loginUser = mService.loginUserMember(m);
		System.out.println(loginUser);
//		System.out.println(loginUser.getMemId());
		
		
		// 원래는 로그인단이 아닌 상시 돌아가야하는것(접속자도 session invalidate 시켜줘야함)
		// 로그인 유저 담기 전, 먼저 제재대상 회원인지 확인(DEATH -> DEC_COUNT 순)
		// 죽일 회원이면(DEATH 수치 3회) 탈퇴처리 후(원랜 즉시 반영되어야겠지만 이렇게해도 상관없음) 제재회원 페이지로
		// 일반제재대상 회원이면 제재일로부터 7일이 지났는지 확인 후 7일 이전이면 제재유저페이지로 이동
		// 7일이 지나면 MODIFYDATE를 NULL로 만들고 DEC_COUNT도 0으로 만들고 DEATH컬럼을 1회 증가 시킨 후
		// '로그인유저객체를 담고' 제재회원 안내페이지로 넘어간다
		Map map = mService.isDeathOrSanctions(memEmail);

		if (map.get("DEC_COUNT") != null && Integer.valueOf(String.valueOf(map.get("DEC_COUNT"))) != 0) {
			if (Integer.valueOf(String.valueOf(map.get("DEATH"))) >= 2
					&& Integer.valueOf(String.valueOf(map.get("DEC_COUNT"))) >= 3) {
				System.out.println("죽음이 찾아온 회원");
				// 죽음이 찾아오게 해주자(status N으로 바꾸고, Death를 3으로 바꾸자)
				int result = mService.toDeath(memEmail);
				if (result > 0) {
					System.out.println("강탈된 회원");
					request.setAttribute("goodByeMsg", "누적 신고수 9회 이상,<br>제재 수 3회차가 되어<br>탈퇴처리된 계정입니다.");
					return "common/errorPageGhost";

				} else {
					System.out.println("강탈된 회원이지만 강탈시키는데 실패");
					request.setAttribute("msg", "강제탈퇴대상 회원이나 아직 처리되지 않았습니다.");
					return "common/errorPageGhost";
				}
			} else {
				System.out.println("죽진 않은 회원");

				if (Integer.valueOf(String.valueOf(map.get("DEC_COUNT"))) >= 3) {
					System.out.println("제재중인 회원");

					// 날짜 비교
					Date date = new Date();
					Date getDate = new Date(((java.sql.Timestamp) map.get("MEM_MODIFY_DATE")).getTime());

					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					SimpleDateFormat sdfShow = new SimpleDateFormat("yyyy.MM.dd");
					// Date getDate = null;
					// try {
					// getDate = sdf.parse(String.valueOf());
					// } catch (ParseException e) {
					// e.printStackTrace();
					// }
					String showDate = sdfShow.format(getDate);
					System.out.println("date : " + date);
					System.out.println("getDate : " + getDate);

					long dateGap = (date.getTime() - getDate.getTime()) / (24 * 60 * 60 * 1000);
					long finalDateGap = (Math.abs(dateGap));
					System.out.println("몇일 차 ? " + finalDateGap);

					if (finalDateGap >= 7) {// 제재해제후 데스 카운트 증가
						int result = mService.updateDecAndDeath(memEmail);
						if (result > 0) {
							System.out.println("축하해요 님 제재 풀렸어요");

						} else {
							System.out.println("재제푸는데 실패");
							request.setAttribute("msg", "제재기간이 종료되었으나 자동해제되지 않았습니다. 고객센터로 문제주십시오");
							return "common/errorPageGhost";
						}
					} else {// 바로 제재회원안내페이지로 이동
						System.out.println("아직 제재상태");
						request.setAttribute("msg",
								"3회 이상의 신고 누적으로<br>7일간 이용이 정지됩니다.<br>이용정지 2회가 초과될 경우<br>사이트 이용이 영구 불가합니다.");
						request.setAttribute("showDate", showDate);
						request.setAttribute("finalDateGap", 7 - finalDateGap);
						return "common/errorPageGhost";
					}
				} else {
					System.out.println("정상상태 회원");
				}
			}
		}

		if (loginUser != null) { // 로그인 할 멤버 객체가 조회 되었을 시

			// 로그인 한 후에 화면에 profile을 뿌려줌
			Profile memId = new Profile(loginUser.getMemId());
			Profile profile = mService.profile(memId);

			session.setAttribute("profile", profile);
			session.setAttribute("loginUser", loginUser);
//			mv.setViewName("common/mainPage");
//			mv.addObject("loginUser", loginUser);

//			return mv;

			// 배혜린 추가 ----------------------------------------------------------------------
			if (loginUser.getUserType().equals("UT1") || loginUser.getUserType().equals("UT2")) {
				System.out.println("관리자 로그인");

				// 관리자 메인페이지가 없기때문에 일단 채팅 목록관리로 이동
				return "redirect:goChatListManage.do";
			} else {
				System.out.println("회원 로그인");

				// 채팅을 위해 관리자 정보를 죄다 불러옴(주관리자 여부는 웹단에서 구분하여 쓰자)
				ArrayList<ChatUserInfo> admins = mmService.allAdmin();
				session.setAttribute("admins", admins);
				// 로그인유저 추가(재환)
				session.setAttribute("loginUser", loginUser);

				// 채팅평시상태를 위해 안읽은 메시지를 모두 카운트해서 불러옴
				int allUnReadCount = cService.selectAllUnReadCount(loginUser.getMemId());
				if (allUnReadCount >= 0) {
					request.setAttribute("allUnReadCount", allUnReadCount);
				}

				return "redirect:home.do";
			}
			// ------------------------------------------------------------------------------

		} else { // 로그인 실패시
			System.out.println("로그인 실패");
			// 아이디랑 비밀번호 잘못 입력했다는 창
//			if(memEmail.equals(loginUser.getMemEmail())) {
//				
//			}else if(memPwd.equals(loginUser.getMemPwd())){
//				
//			}
//			return mv;
			/* throw new MemberException("로그인 실패!"); */
			return "member/login";
		}

	}

	// 회원 가입
	@RequestMapping("meminsert.do")
	public String memberInsert(HttpSession session, HttpServletRequest request, ModelAndView mv) {

		String userType = request.getParameter("purpose"); // 사용자 분류(클라이언트/파트너스)
		String memType = request.getParameter("memtype"); // 사용자 형태(개인,팀,기업,개인사업자,법인사업자..)
		String memName = request.getParameter("name"); // 사용자 이름
//			String cellPhone = request.getParameter("phone");	// 사용자 핸드폰 번호
		String cellPhone0 = request.getParameter("cellPhone0");
		String cellPhone1 = request.getParameter("cellPhone1");
		String cellPhone2 = request.getParameter("cellPhone2");
		String cellPhone3 = request.getParameter("cellPhone3");

		// 4가지를 합치기
		String cellPhone = cellPhone0 + "," + cellPhone1 + "," + cellPhone2 + "," + cellPhone3;
		System.out.println(cellPhone);
		String memNick = request.getParameter("nickname"); // 사용자 닉네임
		String memEmail = request.getParameter("email"); // 사용자 이메일
		String memPwd = request.getParameter("pwd"); // 사용자 비밀번호
		String address1 = request.getParameter("address1"); // 사용자 우편번호
		String address2 = request.getParameter("address2"); // 사용자 주소
		String address3 = request.getParameter("address3"); // 사용자 상세 주소

		Member m = new Member(userType, memType, memEmail, memNick, memName, memPwd, address1, address2, address3,
				cellPhone);
		System.out.println(m);
		int result = mService.insertMember(m);
		if (result > 0) {
			System.out.println("회원가입 성공");
			Member mEmail = new Member(m.getMemEmail());
//				System.out.println(mEmail);
			Member memberId = mService.selectMember(mEmail);
			System.out.println(memberId);

			// 회원별 채팅설정 id 생성
			MemChatSet mc = new MemChatSet(memberId.getMemId());
//				System.out.println(mc);
			int insertMc = mService.insertChatSet(mc);

			if (insertMc > 0) {
				System.out.println("회원채팅설정 기본생성 성공");
				System.out.println(memberId.getUserType());

				// 신원인증 기본 테이블 생성
				int insertIden = mService.insertIden(memberId.getMemId());
				if (insertIden > 0) {
					System.out.println("신원인증 생성 성공");

					// 만약 파트너스 일경우 (파트너스 기본정보와 포트폴리오id 생성하고)
					String UT4 = "UT4";
					if (memberId.getUserType().equals("UT4")) {
						int proId = mService.profileInsert(memberId.getMemId());

						if (proId > 0) {
							System.out.println("프로필 정보 생성 ");

							Profile memId = new Profile(memberId.getMemId());
							Profile profile = mService.profile(memId);
							System.out.println(profile);
							PartInfo partInfo = new PartInfo(profile.getProfileId());
							int portId = mService.insertPartInfo(partInfo);

							if (portId > 0) {
								System.out.println("파트너스 정보 생성 ");
							} else {
								throw new MemberException("파트너스 정보 생성 실패!");
							}

						} else {
							throw new MemberException("프로필 생성 실패!");
						}
					}

				} else {
					System.out.println("신원인증 생성 실패");
				}

			} else {
				throw new MemberException("회원태칭설정 기본생성 실패!");
			}

			return "member/login";
		} else {
			throw new MemberException("회원가입실패!");
		}

	}

	// 로그 아웃
	@RequestMapping(value = "logout.do")

	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:home.do";
	}

	// 클라이언트 찾기
	@RequestMapping(value = "clientList.do")
	public ModelAndView clientList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getListCount();
		System.out.println("listcount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);

		ArrayList<FindClient> list = mService.selectList(pi);
		System.out.println("list : " + list);
		System.out.println("pi" + pi);

		String msg = null;

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("msg", msg);
			mv.setViewName("findMember/findClient");
		} else {
			throw new MemberException("게시글 전체 조회 실패!");
		}

		return mv;
	}

	@RequestMapping("recentList.do")
	public void getRecentList(HttpServletResponse response, int status,
			@RequestParam(value = "page", required = false) Integer page) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		System.out.println(status);

//		if(status == 1) {
//			int listCount=mService.getRecentListCount();
//		}else if(status == 2) {
//			int listCount=mService.getHighPointListCount();
//		}else if(status == 3) {
//			int listCount=mService.getManyPointListCount();
//		}else if(status == 4) {
//			int listCount=mService.getManyProjectListCount();
//		}

		int listCount = mService.getListCount();
		System.out.println("listCount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);

		ArrayList<FindClient> list = mService.selectList(pi, status);
		System.out.println("list : " + list);
		System.out.println("pi : " + pi);

		String msg = null;

		HashMap map = new HashMap();
		map.put("msg", msg);
		map.put("list", list);
		map.put("pi", pi);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(map, response.getWriter());
		System.out.println("gson : " + gson);

	}
	
	@RequestMapping("addressFilter.do")
	public void getaddressFilter(HttpServletResponse response, String address,
			@RequestParam(value = "page", required = false) Integer page) throws JsonIOException, IOException {
		response.setContentType("application/json;charset=utf-8");

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		System.out.println(address);

		HashMap addressMap = new HashMap();
		addressMap.put("address",address);

		int listCount = mService.getAddressListCount(addressMap);
		System.out.println("listCount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);

		ArrayList<FindClient> list = mService.addressList(pi, addressMap);
		System.out.println("list : " + list);
		System.out.println("pi : " + pi);

		String msg = null;

		HashMap map = new HashMap();
		map.put("msg", msg);
		map.put("list", list);
		map.put("pi", pi);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(map, response.getWriter());
		System.out.println("gson : " + gson);

	}

	@RequestMapping(value = "cDetail.do")
	public ModelAndView clientDetail(ModelAndView mv, Integer cId, String check) {
		System.out.println("cId : " + cId);
		ArrayList<FindClientDetail> fc = mService.selectClientDetail(cId);
		System.out.println("fc : " + fc);

		if (fc != null) {
			mv.addObject("fc", fc).addObject("check", check).setViewName("findMember/findClientDetail");
		} else {
			throw new MemberException("게시글 조회 실패!");
		}

		return mv;
	}

	@RequestMapping(value = "cProjectHistory.do")
	public ModelAndView projectHistory(ModelAndView mv, Integer cId) {
		FCprojectHistory projectHistory = mService.selectProjectHistory(cId);
		System.out.println("projectHistory : " + projectHistory);

		if (projectHistory != null) {
			mv.addObject("ph", projectHistory).setViewName("findMember/clientProjectHistory");
		} else {
			throw new MemberException("프로젝트 히스토리 조회 실패!");
		}

		return mv;
	}

	@RequestMapping(value = "cEvalSelect.do")
	public ModelAndView evalSelect(ModelAndView mv, Integer cId, int msg,
			@RequestParam(value = "page", required = false) Integer page) {

		// 페이지네이션 필요
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int cpEvalCount = mService.getCPevalCount(cId);
		System.out.println("평가 총 개수 : " + cpEvalCount);

		PageInfo pi = getPageInfo(currentPage, cpEvalCount);

		ArrayList<CPeval> cpEval = mService.selectCPeval(cId, pi); // 파트너스 평가 리스트
		System.out.println("cpEval : " + cpEval);

		FCeval fcEval = mService.getFCeval(cId); // 클라이언트 정보

		if (!cpEval.isEmpty()) {
			mv.addObject("cp", cpEval) // 파트너스 평가 리스트
					.addObject("fc", fcEval) // 클라이언트 정보
					.addObject("msg", msg).addObject("pi", pi).setViewName("findMember/clientComment");
		}

		return mv;
	}

	// 클라이언트 평가등록 페이지
	@RequestMapping(value = "cEvalInsert.do")
	public ModelAndView evalInsert(ModelAndView mv, Integer cId, Integer pId) {

		ArrayList<EvalProjectList> epList = mService.getClientInfo(cId);
		System.out.println("epList" + epList);

		// 로그인한 유저의 memId가 partnersId와 일치하지 않는다면 에러처리
		HashMap id = new HashMap();
		id.put("pId", pId);
		id.put("cId", cId);

		ArrayList<MatchingPartnersList> mpList = mService.getMatchingPartners(id);
		System.out.println("매칭파트너 리스트 : " + mpList);

		if (!mpList.isEmpty()) {
//			int result = mService.insertEval(id);
			
			int result = mService.checkReEval(id);
			
			if(result >0) {
				int msg=3;
				mv.addObject("msg", msg).addObject("cId", cId).setViewName("redirect:cEvalSelect.do");
			}else {
				mv.addObject("epList", epList).addObject("cId", cId).setViewName("findMember/clientInsertComment");
				
			}

		} else {
			int msg = 0;
			mv.addObject("msg", msg).addObject("cId", cId).setViewName("redirect:cEvalSelect.do");
		}

		return mv;
	}

	@RequestMapping(value = "cEvalInsert2.do")
	public ModelAndView evalInsert(ModelAndView mv, HttpServletRequest request) {

		// cId, pId 추가해야함
		int cId = Integer.valueOf(request.getParameter("cId"));
		int pId = Integer.valueOf(request.getParameter("pId"));

		int proId = Integer.valueOf(request.getParameter("proId"));
		String eContent = request.getParameter("eContent");

		int total = Integer.valueOf(request.getParameter("total"));
		int star1 = Integer.valueOf(request.getParameter("professional")); // 전문성
		int star2 = Integer.valueOf(request.getParameter("active")); // 적극성
		int star3 = Integer.valueOf(request.getParameter("schedule")); // 의사소통
		int star4 = Integer.valueOf(request.getParameter("communication")); // 일정준수
		int star5 = Integer.valueOf(request.getParameter("satisfaction")); // 만족도

		System.out.println("cId : " + cId);
		System.out.println("pId : " + pId);
		System.out.println("proId : " + proId);
		System.out.println("eContent : " + eContent);
		System.out.println("total : " + total);
		System.out.println("star1 : " + star1);
		System.out.println("star2 : " + star2);
		System.out.println("star3 : " + star3);
		System.out.println("star4 : " + star4);
		System.out.println("star5 : " + star5);

		HashMap id = new HashMap();
		id.put("cId", cId);
		id.put("pId", pId);
		id.put("proId", proId);

		EPid epId = mService.getEPid(id);
		System.out.println("EPid : " + epId);

		HashMap map = new HashMap();
		map.put("cId", cId);
		map.put("pId", pId);
		map.put("proId", epId.getProId());
		map.put("eContent", eContent);
		map.put("total", total);
		map.put("star1", star1);
		map.put("star2", star2);
		map.put("star3", star3);
		map.put("star4", star4);
		map.put("star5", star5);

		int result = mService.insertEval(map);

		if (result > 0) {
			System.out.println("평가 등록됨");
			mv.addObject("msg", 1).addObject("cId", cId).setViewName("redirect:cEvalSelect.do");
		} else {
			System.out.println("평가 등록 실패");
		}

		return mv;
	}

	// 닉네임 중복 확인
	@RequestMapping(value = "nickCheck.do", method = RequestMethod.GET)
	public void nickCheck(@RequestParam("nick") String nick, HttpServletResponse response) throws IOException {

		// 1. 그냥 오류 두던가 예외처리로 없애버리던가 근데 sql에러 인데 가능한가?
		// 2. 전체 member 뽑아오고 컨트롤러에서 비교
		System.out.println("내가 입력하고자 하는 닉네임" + nick);
		PrintWriter out = response.getWriter();

		int member = mService.membernick(nick);
		// 0 or 1 이 반환됨
//		System.out.println(member);
		// 중복된 값이 없으면 0이 반환
		if (member == 0) {
			System.out.println("닉네임 사용 가능");
			out.append("ok");
			out.flush();
			// 중복된 값이 있으면 1이 반환
		} else {
			System.out.println("닉네임 사용 불가능");
			out.append("fail");
			out.flush();
		}
		out.close();
	}

	@RequestMapping(value = "memNickSearch.do")
	public ModelAndView memNickSearch(ModelAndView mv, String memNick,
			@RequestParam(value = "page", required = false) Integer page) {

		System.out.println("닉네임 : " + memNick);

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getListCount(memNick);
		System.out.println("listcount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);

		ArrayList<FindClient> list = mService.selectList(pi, memNick);
		System.out.println("list : " + list);
		System.out.println("pi" + pi);

		String msg = null;

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("msg", msg);
			mv.setViewName("findMember/findClient");
		} else {
			msg = "검색 결과가 존재하지 않습니다.";

			mv.addObject("msg", msg).setViewName("findMember/findClient");
		}

		return mv;
	}

	@RequestMapping(value = "introductionSearch.do")
	public ModelAndView introductionSearch(ModelAndView mv, String introduction,
			@RequestParam(value = "page", required = false) Integer page) {
		System.out.println("내용 : " + introduction);

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getListCount2(introduction);
		System.out.println("listcount : " + listCount);

		PageInfo pi = getPageInfo(currentPage, listCount);

		ArrayList<FindClient> list = mService.selectList2(pi, introduction);
		System.out.println("list : " + list);
		System.out.println("pi" + pi);

		String msg = null;

		if (!list.isEmpty()) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("msg", msg);
			mv.setViewName("findMember/findClient");
		} else {
			msg = "검색 결과가 존재하지 않습니다.";

			mv.addObject("msg", msg).setViewName("findMember/findClient");
		}

		return mv;
	}

	// 클라이언트 신고
	@RequestMapping(value = "clientReport.do")
	public ModelAndView clientReport(ModelAndView mv, HttpServletRequest request) {
		int reportCid = Integer.valueOf(request.getParameter("reportCid"));
		int pId = Integer.valueOf(request.getParameter("pId"));
		String reportContent = request.getParameter("reportContent");

		System.out.println("reportCid : " + reportCid);
		System.out.println("pId : " + pId);
		System.out.println("reportContent : " + reportContent);

		HashMap report = new HashMap();
		report.put("reportCid", reportCid);
		report.put("pId", pId);
		report.put("reportContent", reportContent);

		int reportCheck = mService.reportCheck(report);
		System.out.println("reportCheck : " + reportCheck);

		String check = "";

		if (reportCheck > 0) {
			check = "Y";
			mv.addObject("cId", reportCid).addObject("check", check).setViewName("redirect:cDetail.do");
		} else {
			int result = mService.insertClientReport(report);

			if (result > 0) {
				System.out.println("신고 성공!!");
				int countUpReport = mService.countUpReport(reportCid);
				check = "N";

				mv.addObject("cId", reportCid).addObject("check", check).setViewName("redirect:cDetail.do");
			} else {
				throw new MemberException("신고 실패!");
			}
		}

		return mv;

	}

}
package com.kh.DeVenue.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

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

import com.kh.DeVenue.member.model.exception.MemberException;
import com.kh.DeVenue.member.model.service.MemberService;
import com.kh.DeVenue.member.model.vo.CPeval;
import com.kh.DeVenue.member.model.vo.EvalProjectList;
import com.kh.DeVenue.member.model.vo.FCeval;
import com.kh.DeVenue.member.model.vo.FCprojectHistory;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.FindClientDetail;
import com.kh.DeVenue.member.model.vo.MatchingPartnersList;
import com.kh.DeVenue.member.model.vo.Member;
import static com.kh.DeVenue.common.PaginationClient.getPageInfo;
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
	// 할일 로그인 유지/ 브라우저 종료시 reload
	// 로그인 유지할때 request와 session으로 넘겨버리면???
	// 로그인 값 받아오기
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(HttpSession session, HttpServletRequest request, Model model, ModelAndView mv){

//		// 자동로그인 checkbox 선택했는지
//		String logincheck = request.getParameter("logincheck");
//		System.out.println(logincheck); // true or null(value를 true로 설정했기때문에)
		
		String memEmail = request.getParameter("email");
		String memPwd = request.getParameter("pwd");


		Member m = new Member(memEmail,memPwd);
//		System.out.println(m);
		Member loginUser = mService.loginUserMember(m);
		System.out.println(loginUser);
//		System.out.println(loginUser.getMemId());
		
		
		if(loginUser != null) { // 로그인 할 멤버 객체가 조회 되었을 시
			
			// 로그인 한 후에 화면에 profile을 뿌려줌
			Profile memId = new Profile(loginUser.getMemId());
			Profile profile = mService.profile(memId);
			
//			if(logincheck != null) { // true이냐(로그인 유지 선택시)
//			}else { // 로그인 유지 체크 안할시
			
//				
//			}
			
			session.setAttribute("profile", profile);
			session.setAttribute("loginUser", loginUser);
//			mv.setViewName("common/mainPage");
//			mv.addObject("loginUser", loginUser);
			
			
//			return mv;
			
			// 배혜린 추가 ----------------------------------------------------------------------
			if(loginUser.getUserType().equals("UT1")||loginUser.getUserType().equals("UT2")) {
				System.out.println("관리자 로그인");
				
				// 관리자 메인페이지가 없기때문에 일단 채팅 목록관리로 이동
				return "redirect:goChatListManage.do";
			}else {
				System.out.println("회원 로그인");
				
				// 채팅을 위해 관리자 정보를 죄다 불러옴(주관리자 여부는 웹단에서 구분하여 쓰자)
				ArrayList<ChatUserInfo> admins = mmService.allAdmin();
				session.setAttribute("admins", admins);
				
				// 채팅평시상태를 위해 안읽은 메시지를 모두 카운트해서 불러옴
				int allUnReadCount = cService.selectAllUnReadCount(loginUser.getMemId());
				if(allUnReadCount >= 0) {
					request.setAttribute("allUnReadCount", allUnReadCount);
				}
				
				return "common/mainPage";
			}
			//------------------------------------------------------------------------------
			
			
		}else { // 로그인 실패시

			// 아이디랑 비밀번호 잘못 입력했다는 창
//			if(memEmail.equals(loginUser.getMemEmail())) {
//				
//			}else if(memPwd.equals(loginUser.getMemPwd())){
//				
//			}
//			return mv;
		}
		return "common/mainPage";
		
	}
	
	// 회원 가입
		@RequestMapping("meminsert.do")
		public String memberInsert(HttpSession session, HttpServletRequest request, ModelAndView mv) {
	
			String userType = request.getParameter("purpose");	// 사용자 분류(클라이언트/파트너스)
			String memType = request.getParameter("memtype");	// 사용자 형태(개인,팀,기업,개인사업자,법인사업자..)
			String memName = request.getParameter("name");		// 사용자 이름
			String phonechange = request.getParameter("phone");	// 사용자 핸드폰 번호
			int phone = Integer.parseInt(phonechange);
			String memNick =request.getParameter("nickname");	// 사용자 닉네임
			String memEmail = request.getParameter("email");	// 사용자 이메일
			String memPwd = request.getParameter("pwd");		// 사용자 비밀번호
			String address1 = request.getParameter("address1");	// 사용자 우편번호
			String address2 = request.getParameter("address2");	// 사용자 주소
			String address3 = request.getParameter("address3");	// 사용자 상세 주소
			
			Member m = new Member(userType,memType,memEmail,memNick,memName,memPwd,address1,address2,address3,phone);
			System.out.println(m);
			int result = mService.insertMember(m);
			if(result > 0) {
				System.out.println("회원가입 성공");
				Member mEmail = new Member(m.getMemEmail());
//				System.out.println(mEmail);
				Member memberId = mService.selectMember(mEmail);
				System.out.println(memberId);
				
				// 회원별 채팅설정 id 생성
				MemChatSet mc = new MemChatSet(memberId.getMemId());
//				System.out.println(mc);
				int insertMc = mService.insertChatSet(mc);
				
				if(insertMc > 0) {
					System.out.println("회원채팅설정 기본생성");
					System.out.println(memberId.getUserType());
					// 만약 파트너스 일경우 (파트너스 기본정보와 포트폴리오id 생성하고)
					String UT4 = "UT4";
					if(memberId.getUserType().equals("UT4")) {
						int proId = mService.profileInsert(memberId.getMemId());
						
						if(proId > 0) {
							System.out.println("프로필 정보 생성 ");
							
							Profile memId = new Profile(memberId.getMemId());
							Profile profile = mService.profile(memId);
							System.out.println(profile);
							PartInfo partInfo = new PartInfo(profile.getProfileId());
							int portId = mService.insertPartInfo(partInfo);
							
							if(portId > 0) {
								System.out.println("파트너스 정보 생성 ");
							}else {
								throw new MemberException("파트너스 정보 생성 실패!");
							}
							
						}else {
							throw new MemberException("프로필 생성 실패!");
						}
					}
				}else {
					throw new MemberException("회원태칭설정 기본생성 실패!");
				}
				
				return "member/login";
			}else {
				throw new MemberException("회원가입실패!");
			}
			
		}
	
	// 로그 아웃
	@RequestMapping(value="logout.do")

	public String logout(HttpSession session) {
		
		session.invalidate();

		return "common/mainPage";
	}
	

	// 클라이언트 찾기
	@RequestMapping(value="clientList.do")
	public ModelAndView clientList(ModelAndView mv,
			@RequestParam(value="page",required=false) Integer page) {
		
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		int listCount=mService.getListCount();
		System.out.println("listcount : " + listCount);
				
		PageInfo pi= getPageInfo(currentPage, listCount);
		
		ArrayList<FindClient> list=mService.selectList(pi);
		System.out.println("list : " + list);
		System.out.println("pi" + pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("findMember/findClient");
		}else {
			throw new MemberException("게시글 전체 조회 실패!");
		}
		
		return mv;
	}
	
	@RequestMapping(value="cDetail.do")
	public ModelAndView clientDetail(ModelAndView mv, Integer cId) {
		FindClientDetail fc=mService.selectClientDetail(cId);
		System.out.println("fc : " + fc);
		
		if(fc!=null) {
			mv.addObject("fc", fc)
			.setViewName("findMember/findClientDetail");
		}else {
			throw new MemberException("게시글 조회 실패!");
		}
		
		return mv;
	}
	
	@RequestMapping(value="cProjectHistory.do")
	public ModelAndView projectHistory(ModelAndView mv, Integer cId) {
		FCprojectHistory projectHistory = mService.selectProjectHistory(cId);
		System.out.println("projectHistory : " + projectHistory);
		
		if(projectHistory!=null) {
			mv.addObject("ph", projectHistory)
			.setViewName("findMember/clientProjectHistory");
		}else {
			throw new MemberException("프로젝트 히스토리 조회 실패!");
		}
		
		return mv;
	}
	
	@RequestMapping(value="cEvalSelect.do")
	public ModelAndView evalSelect(ModelAndView mv, Integer cId, int msg,
			@RequestParam(value="page",required=false) Integer page) {
		
		// 페이지네이션 필요
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		int cpEvalCount = mService.getCPevalCount(cId);
		System.out.println("평가 총 개수 : " + cpEvalCount);
		
		PageInfo pi=getPageInfo(currentPage, cpEvalCount);
		
		ArrayList<CPeval> cpEval = mService.selectCPeval(cId, pi);	// 파트너스 평가 리스트
		System.out.println("cpEval : " + cpEval);
		
		FCeval fcEval = mService.getFCeval(cId);	// 클라이언트 정보
		
		if(!cpEval.isEmpty()) {
			mv.addObject("cp", cpEval)	// 파트너스 평가 리스트
			.addObject("fc", fcEval)	// 클라이언트 정보
			.addObject("msg", msg)
			.addObject("pi", pi)
			.setViewName("findMember/clientComment");
		}
		
		return mv;
	}
	
	// 클라이언트 평가등록 페이지
	@RequestMapping(value="cEvalInsert.do")
	public ModelAndView evalInsert(ModelAndView mv, Integer cId, Integer pId) {
		
		ArrayList<EvalProjectList> epList = mService.getClientInfo(cId);
		System.out.println("epList" + epList);
		
		// 로그인한 유저의 memId가 partnersId와 일치하지 않는다면 에러처리
		HashMap id=new HashMap();
		id.put("pId", pId);
		id.put("cId", cId);
		
		ArrayList<MatchingPartnersList> mpList = mService.getMatchingPartners(id);
		System.out.println("매칭파트너 리스트 : "+ mpList);
		
		if(!mpList.isEmpty()) {
//			int result = mService.insertEval(id);
			
			mv.addObject("epList", epList).addObject("cId", cId)
			.setViewName("findMember/clientInsertComment");
		}else {
			int msg=0;
			mv.addObject("msg", msg).addObject("cId", cId)
			.setViewName("redirect:cEvalSelect.do");
		}
		
		return mv;
	}
	
	@RequestMapping(value="cEvalInsert2.do")
	public ModelAndView evalInsert(ModelAndView mv, HttpServletRequest request) {
		
		// cId, pId 추가해야함
		String proId= request.getParameter("proId");
		String content=request.getParameter("eContent");
		int eAgv=Integer.valueOf(request.getParameter("eAgv"));
		int star1=Integer.valueOf(request.getParameter("star1"));	// 전문성
		int star2=Integer.valueOf(request.getParameter("star2"));	// 적극성
		int star3=Integer.valueOf(request.getParameter("star3"));	// 의사소통
		int star4=Integer.valueOf(request.getParameter("star4"));	// 일정준수
		int star5=Integer.valueOf(request.getParameter("star5"));	// 만족도
		
		return mv;
	}
	
	
	// 닉네임 중복 확인
	@RequestMapping(value="nickCheck.do", method=RequestMethod.GET)
	public void nickCheck(@RequestParam("nick") String nick, HttpServletResponse response) throws IOException {
		
		// 1. 그냥 오류 두던가 예외처리로 없애버리던가 근데 sql에러 인데 가능한가?
		// 2. 전체 member 뽑아오고 컨트롤러에서 비교
		System.out.println("내가 입력하고자 하는 닉네임"+nick);
		PrintWriter out = response.getWriter();
		
		int member = mService.membernick(nick);
		// 0 or 1 이 반환됨
//		System.out.println(member);
		// 중복된 값이 없으면 0이 반환
		if(member == 0) {
			System.out.println("닉네임 사용 가능");
			out.append("ok");
			out.flush();
		// 중복된 값이 있으면 1이 반환
		}else {
			System.out.println("닉네임 사용 불가능");
			out.append("fail");
			out.flush();
		}		
		out.close();
	}
}

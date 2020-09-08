package com.kh.DeVenue.myPage.controller;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.DeVenue.member.model.exception.MemberException;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.exception.MyPageException;
import com.kh.DeVenue.myPage.model.service.MyPageService;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.CmypageClientInfo;
import com.kh.DeVenue.myPage.model.vo.CmypageProcess;
import com.kh.DeVenue.myPage.model.vo.CmypageProjectHistory;
import com.kh.DeVenue.myPage.model.vo.CmypageSuggest;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.myPage.model.vo.PortImg;
import com.kh.DeVenue.myPage.model.vo.PortTec;
import com.kh.DeVenue.myPage.model.vo.SCCareer;
import com.kh.DeVenue.myPage.model.vo.Skill;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	// 마이페이지로 이동
	@RequestMapping(value = "profile.do")
	public String profileView() {
		return "myPage/myPageDetail";
	}

	// 파트너스 정보 이동(파트너스 정보 출력)
	@RequestMapping(value = "partInfo.do")
	public ModelAndView partInfoView(HttpServletRequest request, ModelAndView mv) {

		String pfId = request.getParameter("profileId");
		int profile = Integer.parseInt(pfId);

		// 모든곳에서 다써야할텐데 간단한 방법은 없나??
		PartInfo profileId = new PartInfo(profile);
		PartInfo partInfo = myPageService.selectPartInfo(profileId);
		mv.addObject("partInfo", partInfo);
		mv.setViewName("myPage/partInfo");

		return mv;
	}

	// 자기소개 이동
	@RequestMapping(value = "PR.do")
	public String PRView() {
		return "myPage/introduction";
	}

	// 전체 포트폴리오 이동(포트폴리오 전체 출력)
	@RequestMapping(value = "portfolioAll.do")
	public ModelAndView protfolioView(@RequestParam("profileId") int profileId, HttpServletRequest request, ModelAndView mv) {
		
		ArrayList<PortFolio> portList = myPageService.selectPortInfo(profileId);
		System.out.println("포트폴리오에 뿌려줄 "+portList);

		mv.addObject("portList", portList);
		mv.addObject("profileId", profileId);
		mv.setViewName("myPage/portfolioAll");

		return mv;

	}

	// 보유 기술 이동(보유 기술 전체 출력)
	@RequestMapping(value = "skill.do")
	public ModelAndView skillView(@RequestParam("profileId") int profileId ,HttpServletRequest request, ModelAndView mv){

			ArrayList<Skill> skilllist = myPageService.selectSkillInfo(profileId);
			System.out.println(skilllist);

			mv.addObject("skilllist", skilllist);
			mv.setViewName("myPage/skill");


		return mv;
	}

	// 경력 이동(경력 전체 출력)
	@RequestMapping(value = "career.do")
	public ModelAndView careerView(@RequestParam("profileId") int profileId, HttpServletRequest request, ModelAndView mv) {

		ArrayList<Career> careerlist = myPageService.selectCareerInfo(profileId);
		System.out.println(careerlist);

		// 입사일가 퇴사일 비교해서 개월로 표시
		for (int i = 0; i < careerlist.size(); i++) {
//			System.out.println(careerlist.get(i).getcStartDate());
//			System.out.println(careerlist.get(i).getcEndDate());
			int comepare = careerlist.get(0).getcEndDate().compareTo(careerlist.get(0).getcStartDate());
//			System.out.println(comepare);
		}

		mv.addObject("careerlist", careerlist);
		mv.setViewName("myPage/career");

		return mv;
	}

	// 학력 이동(학력 전체 출력)
	@RequestMapping(value = "academic.do")
	public ModelAndView academicView(@RequestParam("profileId") int profileId, HttpServletRequest request, ModelAndView mv) {

		ArrayList<SCCareer> sccareerlist = myPageService.selectSCCareerInfo(profileId);
		System.out.println(sccareerlist);

		mv.addObject("sccareerlist", sccareerlist);
		mv.setViewName("myPage/academic");

		return mv;
	}

	// 자격증 이동
	@RequestMapping(value = "certificate.do")
	public ModelAndView certificateView(@RequestParam("profileId") int profileId, HttpServletRequest request, ModelAndView mv) {

		ArrayList<Certificate> certilist = myPageService.selectCertificateInfo(profileId);
		System.out.println(certilist);

		mv.addObject("certilist", certilist);
		mv.setViewName("myPage/certificate");

		return mv;
	}

	// 프로젝트 히스토리 이동
	@RequestMapping(value = "PH.do")
	public String PHView() {
		return "myPage/projectHistory";
	}

	// ----------------------------------------------//

	// 파트너스 정보 수정 페이지 이동
	@RequestMapping(value = "partInfoUpdate.do")
	public String PIview() {
		return "myPage/partInfoUpdate";
	}

	// 자기소개 수정 페이지 이동
	@RequestMapping(value = "introductionUpdate.do")
	public String IDview() {
		return "myPage/introductionUpdate";
	}

	// 포트폴리오 추가 페이지 이동
	@RequestMapping(value = "portfolioInsert.do")
	public String PFInsertview() {
		return "myPage/portfolioUpdate";
	}
	// 포트폴리오 수정 페이지 이동

	// 보유 기술 수정 이동
	@RequestMapping(value = "skillUpdate.do")
	public String skillUpdateView() {
		return "myPage/skillUpdate";
	}

	// 경력 수정 이동
	@RequestMapping(value = "careerUpdate.do")
	public String careerInsertView() {
		return "myPage/careerUpdate";
	}

	// 자격증 수정 이동
	@RequestMapping(value = "cerificateUpdate.do")
	public String cerificateInsertView() {
		return "myPage/certificateUpdate";
	}

	// 학력 수정 페이지 이동
	@RequestMapping(value = "academicUpdate.do")
	public String SSCareerInsertView() {
		return "myPage/academicUpdate";
	}

	// ---------------------------------------------//

	// 파트너스 정보 수정
	@RequestMapping(value = "partInfoUp.do")
	public ModelAndView partInfoUp(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		String MC = request.getParameter("Mcate");
		String WT = request.getParameter("workType");
		String num1 = request.getParameter("jobtype");
		String num2 = request.getParameter("profileId");
		// db값이 숫자이기 때문에
		int JT = Integer.parseInt(num1);
		int profileId = Integer.parseInt(num2);
		// 프로필번호도 같이 넘거야함
		// 프로필번호와 맴버 번호는 같아도 되지않을까??
		PartInfo partInfo = new PartInfo(WT, MC, JT, profileId);
		System.out.println("수정한 파트너스 정보" + partInfo);
		int result1 = myPageService.partInfoUpdate(partInfo);
		if (result1 > 0) {
			System.out.println("프로필을 수정합니다.");
			mv.addObject("partInfo", partInfo);
			mv.setViewName("myPage/partInfo");
		} else {
			throw new MyPageException("프로필 수정 실패!");
		}

		return mv;

	}

	// 자기소개 수정하기
	@RequestMapping(value = "introductionUp.do")
	public ModelAndView introductionUpdate(ModelAndView mv, HttpServletRequest request, Model m) {

		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);
		String introduction = request.getParameter("PR");

		Profile profile = new Profile(profileId, introduction);
		int result2 = myPageService.profileUpdate(profile);
		if (result2 > 0) {
			System.out.println("자기소개를 수정합니다.");

			mv.addObject("profile", profile);
			mv.setViewName("myPage/introduction");
		} else {
			throw new MyPageException("자기소개 수정 실패!");
		}

		return mv;

	}

	// 포트폴리오 추가
	@RequestMapping(value = "piInsert.do")
	public String portfolioInsertView(HttpServletRequest request, MultipartHttpServletRequest mtf,
			@RequestParam("img1") MultipartFile img1
//			,@RequestParam("img2") MultipartFile img2
//			,@RequestParam("img3") MultipartFile img3
			, RedirectAttributes redirectAttributes
	) throws ParseException {

		System.out.println("실행?");
		
		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);

		String portName = request.getParameter("title");
		String mcId = request.getParameter("jobtype");
		String dcId = request.getParameter("jobaction");
		String content = request.getParameter("portfolio-content");
		// 화면에서 String으로 받고 DB에서 date오 TO_DATE로 변경함
		String sYear = request.getParameter("start-year");
		String sMonth = request.getParameter("start-month");
//		System.out.println(profileId);
		String portStartDate = sYear + "-" + sMonth;
//		System.out.println(start);
		String eYear = request.getParameter("end-year");
		String eMonth = request.getParameter("end-month");
		String portEndDate = eYear + "-" + eMonth;
//		System.out.println(end);
		String participation = request.getParameter("participation");
		System.out.println(participation);
		int portJoin = Integer.parseInt(participation);
//		System.out.println(portJoin);
		// 포트폴리오 테이블
		PortFolio pf = new PortFolio(profileId, mcId, dcId, portName, portJoin, content, portStartDate, portEndDate);
		System.out.println(pf);
		int portfoio = myPageService.insertPortfolio(pf);
		if (portfoio > 0) {
			System.out.println("포트폴리오 생성");
		} else {
			throw new MyPageException("포트폴리오 생성 실패!");
		}
		
		// 포트폴리오 이름으로 portId 추출
		int portId = myPageService.selectPortId(portName);
		
		String imgContent1 = request.getParameter("img-content1");
//		String imgContent2 = request.getParameter("img-content2");
//		String imgContent3 = request.getParameter("img-content3");

		String root = request.getSession().getServletContext().getRealPath("resources");

		// 파일 태그
		String fileTag = "img1";
		System.out.println(fileTag);
		System.out.println(img1);
		// 업로드 파일이 저장될 경로
		String savPath = root + "\\portfolioImg";

		File folder = new File(savPath);

		// 파일이 없으면 파일을 생성
		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 파일 이름
		MultipartFile file = mtf.getFile(fileTag);
		System.out.println(file);
		String fileName = file.getOriginalFilename();
		String filePath = folder + "//" + fileName;
		// 파일 전송
		try {
			file.transferTo(new File(filePath));
		} catch (Exception e) {
			System.out.println("업로드 오류");
		}

		// 포트폴리오번호, 포트폴리오이미지 설명, 경로
		PortImg pi = new PortImg(portId, imgContent1, filePath);
		System.out.println(pi);
		int portimg = myPageService.insertPortImg(pi);
		if (portimg > 0) {
			System.out.println("포트폴리오 이미지 생성");
		} else {
			throw new MyPageException("포트폴리오 이미지 생성 실패!");
		}
		// 포트폴리오 이미지 테이블
//		if(imgContent1 == null) {
//			System.out.println("파일이 비어있습니다.");
//		}else if(imgContent2 == null){
//			PortImg pi1 = new PortImg();
//			System.out.println(img1);
//			System.out.println(imgContent1);
//		}else if(imgContent3 == null){
//			PortImg pi1 = new PortImg();
//			System.out.println(img1);
//			System.out.println(imgContent1);
//			System.out.println(img2);
//			System.out.println(imgContent2);
//		}else {
//			System.out.println(img1);
//			System.out.println(imgContent1);
//			System.out.println(img2);
//			System.out.println(imgContent2);
//			System.out.println(img3);
//			System.out.println(imgContent3);
//		}
		// 이미지를 1~3까지 넣을건데 그건 어캐하냐...

		String[] tech = request.getParameterValues("subject");
		for (int i = 0; i < tech.length; i++) {
			// 포트폴리오 기술 테이블
			PortTec pt = new PortTec(portId, tech[i]);
			int porttec = myPageService.insertPortTect(pt);
			if (porttec > 0) {
				System.out.println("포트폴리오 기술 생성");
			} else {
				throw new MyPageException("포트폴리오 기술 생성 실패!");
			}
		}
		redirectAttributes.addAttribute("profileId", profileId);
		return "redirect:portfolioAll.do";

	}

	// 보유기술 추가
	@RequestMapping(value = "skillInsert.do")
	public String skillInsert(HttpServletRequest request, ModelAndView mv, RedirectAttributes redirectAttributes) {

		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);

		String skillKind = request.getParameter("skillName");
		String Level = request.getParameter("level");
		int skillLevel = Integer.parseInt(Level);
		String skillYear = request.getParameter("skillYear");

		Skill s = new Skill(profileId, skillKind, skillLevel, skillYear);
		int skill = myPageService.insertSkill(s);
		if(skill > 0) {
			System.out.println("보유 스킬 생성 성공");
			redirectAttributes.addAttribute("profileId", profileId);
		}else {
			System.out.println("보유 스킬 생성 실패");
		}

		return "redirect:skill.do";
	}

	// 경력 추가
	@RequestMapping(value = "careerInsert.do")
	public String careerInsert(HttpServletRequest request, RedirectAttributes redirectAttributes) {

		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);

		String cName = request.getParameter("company-name");
		String cDept = request.getParameter("company-department");
		String cPosition = request.getParameter("company-position");

		String sYear = request.getParameter("start-year");
		String sMonth = request.getParameter("end-month");
		String start = sYear + "-" + sMonth;

		String eYear = request.getParameter("end-year");
		String eEnd = request.getParameter("end-month");
		String end = eYear + "-" + eEnd;

		String content = request.getParameter("content");

		// 퇴사일이 null이냐에따라 다르게 길을 간다.
		Career c = new Career(cName, cDept, cPosition, start, end, content, profileId);
		System.out.println(c);
		int careerInfo = myPageService.insertCareer(c);
		if(careerInfo > 0) {
			System.out.println("경력 추가 성공");
			redirectAttributes.addAttribute("profileId", profileId);
		}else {
			System.out.println("경력 추가 실패");
		}		
		
		return "redirect:career.do";
	}

	// 자격증 추가
	@RequestMapping(value = "cerificateInsert.do")
	public String cerificateInsert(HttpServletRequest request, RedirectAttributes redirectAttributes) {

		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);

		String ccName = request.getParameter("certificate-title");
		String ccPlace = request.getParameter("certificate-company");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String ccCreateDate = year + "-" + month + "-" + day;
		String ccNumber = request.getParameter("certificate-number");

		Certificate certi = new Certificate(profileId, ccName, ccPlace, ccCreateDate, ccNumber);
		System.out.println(certi);
		int certificate = myPageService.insertCertificate(certi);

		redirectAttributes.addAttribute("profileId", profileId);
		
		return "redirect:certificate.do";
	}

	// 학력 추가
	@RequestMapping(value = "SSCareerUpdate.do")
	public String SScareerInsert(HttpServletRequest request, RedirectAttributes redirectAttributes) {

		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);

		String sgId = request.getParameter("schoolgrade");
		String ssId = request.getParameter("schoolstate");
		String scName = request.getParameter("school-name");
		String scMarjor = request.getParameter("major");
		String sYear = request.getParameter("start-year");
		String sMonth = request.getParameter("start-month");
		String scStartDate = sYear + "-" + sMonth;
		String eYear = request.getParameter("end-year");
		String eMonth = request.getParameter("end-month");
		String scEndDate = eYear + "-" + eMonth;

		SCCareer sc = new SCCareer(sgId, ssId, scName, scMarjor, scStartDate, scEndDate, profileId);
		System.out.println(sc);
		int SCCareerInfo = myPageService.insertSCCareer(sc);
		if(SCCareerInfo > 0) {
			System.out.println("학력 생성 성공");
			redirectAttributes.addAttribute("profileId", profileId);
		}else {
			System.out.println("학력 생성 실패");
		}
		
		return "redirect:academic.do";
	}
	
	// 보유기술 삭제
		@RequestMapping(value="delSkill.do")
		public String DelSKill(ModelAndView mv,HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
			
//			System.out.println("컨트롤러 실행");
			
			String pfId = request.getParameter("profileId");
			int profileId = Integer.valueOf(pfId);
			String id = request.getParameter("skillId");
			int skillId = Integer.parseInt(id);
			System.out.println("선택한 스킬 번호"+skillId);			
			
			// skillId를 활용해 제거
			int delSkill = myPageService.delSkill(skillId);			
			if(delSkill > 0) {
				System.out.println("보유 기술 삭제 성공");
				redirectAttributes.addAttribute("profileId", profileId);
			}else {
				System.out.println("보유 기술 삭제 실패");
			}
			return "redirect:skill.do";
		}
		
	// 경력 삭제
		@RequestMapping(value = "delCareer.do")
		public String DelCareer(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
			
			String pfId = request.getParameter("profileId");
			int profileId = Integer.valueOf(pfId);
			String id = request.getParameter("cId");
			int cId = Integer.parseInt(id);
			
			int delCareer = myPageService.delCareer(cId);
			if(delCareer > 0) {
				System.out.println("경력 삭제 성공");
				redirectAttributes.addAttribute("profileId", profileId);
			}else {
				System.out.println("경력 삭제 실패");
			}
			
			return "redirect:career.do";
		}
		
	// 학력 삭제
		@RequestMapping(value="delacademic.do")
		public String DelAcademic(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
			
			String pfId = request.getParameter("profileId");
			int profileId = Integer.valueOf(pfId);
			String id = request.getParameter("scId");
			int scId = Integer.parseInt(id);
			
			int delAca = myPageService.delAca(scId);
			if(delAca > 0) {
				System.out.println("학력 삭제 성공");
				redirectAttributes.addAttribute("profileId", profileId);
			}else {
				System.out.println("학력 삭제 실패");
			}
			
			
			return "redirect:academic.do";
		}
		
	// 자격증 삭제
		@RequestMapping(value="delCerti.do")
		public String DelCerti(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
			
			String pfId = request.getParameter("profileId");
			int profileId = Integer.valueOf(pfId);
			String id = request.getParameter("ccId");
			int ccId = Integer.parseInt(id);
			
			int delCerti = myPageService.delCerti(ccId);
			if(delCerti > 0) {
				System.out.println("자격증 삭제 성공");

				redirectAttributes.addAttribute("profileId", profileId);
			}else {
				System.out.println("자격증 삭제 실패");
			}
			
			return "redirect:certificate.do";
		}
		
	// 포트폴리오 삭제
		@RequestMapping(value="delPort.do")
		public String DelPort(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
			
			String pfId = request.getParameter("profileId");
			int profileId = Integer.valueOf(pfId);
			String id = request.getParameter("portId");
			int portId = Integer.parseInt(id);
			
			// 포트폴리오 이미지 삭제 -> 포트폴리오 기술 삭제 -> 포트폴리오 삭제
			int delPortImg = myPageService.delPortImg(portId);
			if(delPortImg > 0) {
				System.out.println("포트폴리오 이미지 삭제 성공");
				
				int delPortTec = myPageService.delPortTec(portId);
				
				if(delPortTec > 0) {
					System.out.println("포트폴리오 기술 삭제 성공");
					
					int delPortFolio = myPageService.delPortFolio(portId);
					
					if(delPortFolio > 0) {
						System.out.println("포트폴리오 삭제 성공");
						redirectAttributes.addAttribute("profileId", profileId);
					}else {
						System.out.println("포트폴리오 삭제 실패");
					}
					
				}else {
					System.out.println("포트폴리오 기술 삭제 실패");
				}
				
			}else {
				System.out.println("포트폴리오 이미지 삭제 실패");
			}
			
			return "redirect:portfolioAll.do";
//			return "myPage/portfolioAll";
		}

		// 클라이언트 마이페이지 메인 이동
		@RequestMapping(value="clientProfile.do")
		public ModelAndView clientMypage(ModelAndView mv, Integer cId) {
			System.out.println("클라이언트 아이디 : "+cId);
			
			// 기본정보 및 프로젝트 횟수
			CmypageProjectHistory projectHistory = myPageService.selectProjectHistory(cId);
			System.out.println("projectHistory : " + projectHistory);
			
			// 내게온 제안 조회
			ArrayList<CmypageSuggest> suggest = myPageService.selectSuggest(cId);
			System.out.println("내게 온 제안 : "+suggest);
			
			// 진행중인 프로젝트 조회
			ArrayList<CmypageProcess> process = myPageService.selectProcess(cId);
			System.out.println("진행중인 프로젝트 : "+process);
				
			if(projectHistory!=null) {
				mv.addObject("ph", projectHistory)
				.addObject("suggest", suggest)
				.addObject("process", process)
				.setViewName("member/clientMyPage");
			}else {
				throw new MemberException("프로젝트 히스토리 조회 실패!");
			}
			
			return mv;
		}
		
		// 파트너스 내 프로필
		@RequestMapping(value="partnersProfile.do")
		public ModelAndView partnersMypage(ModelAndView mv, Integer pId) {
			System.out.println("파트너스 아이디 : "+pId);
			
			// 기본정보 및 프로젝트 횟수
			CmypageProjectHistory projectHistory = myPageService.selectProjectHistory(pId);
			System.out.println("projectHistory : " + projectHistory);
			
			// 내게온 제안 조회
			ArrayList<CmypageSuggest> suggest = myPageService.selectSuggest(pId);
			System.out.println("내게 온 제안 : "+suggest);
			
			// 진행중인 프로젝트 조회
			ArrayList<CmypageProcess> process = myPageService.selectProcess(pId);
			System.out.println("진행중인 프로젝트 : "+process);
				
			if(projectHistory!=null) {
				mv.addObject("ph", projectHistory)
				.addObject("suggest", suggest)
				.addObject("process", process)
				.setViewName("member/partnersMyPage");
			}else {
				throw new MemberException("프로젝트 히스토리 조회 실패!");
			}
			
			return mv;
		}
		
		@RequestMapping(value="clientInfo.do")
		public ModelAndView cmClientInfo(ModelAndView mv, Integer cId) {
			System.out.println("클라이언트 아이디 : "+ cId);
			
			CmypageClientInfo clientInfo = myPageService.selectClientInfo(cId);
			System.out.println("clientInfo : " + clientInfo);
			
			if(clientInfo!=null) {
				mv.addObject("info", clientInfo)
				.setViewName("member/clientInfo");
			}else {
			}
			
			return mv;
		}
		
		
		@RequestMapping(value="cMyPageProjectHistory.do")
		public ModelAndView cmProjectHistory(ModelAndView mv, Integer cId) {
			System.out.println("클라이언트 아이디 : "+ cId);
			
			CmypageProjectHistory projectHistory = myPageService.selectProjectHistory(cId);
			System.out.println("projectHistory : " + projectHistory);
			
			if(projectHistory!=null) {
				mv.addObject("ph", projectHistory)
				.setViewName("member/cProjectHistory");
			}else {
			}
			
			return mv;
		}
}

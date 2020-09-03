package com.kh.DeVenue.myPage.controller;

import java.io.File;
import java.text.ParseException;

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

import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.exception.MyPageException;
import com.kh.DeVenue.myPage.model.service.MyPageService;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.PartInfo;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.myPage.model.vo.PortImg;
import com.kh.DeVenue.myPage.model.vo.PortTec;
import com.kh.DeVenue.myPage.model.vo.SSCareer;
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

	// 파트너스 정보 이동
	@RequestMapping(value = "partInfo.do")
	public ModelAndView partInfoView(HttpServletRequest request, ModelAndView mv) {
		System.out.println("시발 왜 실행안됨");
		String pfId = request.getParameter("profileId");
//		System.out.println(pfId);
		int profile = Integer.parseInt(pfId);
		
		// 모든곳에서 다써야할텐데 간단한 방법은 없나??
		PartInfo profileId = new PartInfo(profile);
		PartInfo partInfo = myPageService.selectPartInfo(profileId);
		System.out.println(partInfo);
		mv.addObject("partInfo", partInfo);
		mv.setViewName("myPage/partInfo");
		
		return mv;
	}

	// 자기소개 이동
	@RequestMapping(value = "PR.do")
	public String PRView() {
		return "myPage/introduction";
	}

	// 전체 포트폴리오 이동
	@RequestMapping(value = "portfolioAll.do")
	public String protfolioView() {
		return "myPage/portfolioAll";
	}

	// 보유 기술 이동
	@RequestMapping(value = "skill.do")
	public String skillView() {
		return "myPage/skill";
	}

	// 경력 이동
	@RequestMapping(value = "career.do")
	public String careerView() {
		return "myPage/career";
	}

	// 학력 이동
	@RequestMapping(value = "academic.do")
	public String academicView() {
		return "myPage/academic";
	}

	// 자격증 이동
	@RequestMapping(value = "certificate.do")
	public String certificateView() {
		return "myPage/certificate";
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
	@RequestMapping(value="introductionUpdate.do")
	public String IDview() {
		return "myPage/introductionUpdate";		
	}
	
	// 포트폴리오 추가 페이지 이동
	@RequestMapping(value="portfolioInsert.do")
	public String PFInsertview() {
		return "myPage/portfolioUpdate";
	}
	// 포트폴리오 수정 페이지 이동
	
	// 보유 기술 수정 이동
	@RequestMapping(value="skillUpdate.do")
	public String skillUpdateView() {
		return "myPage/skillUpdate";
	}
	
	// 경력 수정 이동
	@RequestMapping(value="careerUpdate.do")
	public String careerInsertView() {
		return "myPage/careerUpdate";
	}
	
	// 자격증 수정 이동
	@RequestMapping(value="cerificateUpdate.do")
	public String cerificateInsertView() {
		return "myPage/certificateUpdate";
	}
	
	// 학력 수정 페이지 이동
	@RequestMapping(value="academicUpdate.do")
	public String SSCareerInsertView() {
		return "myPage/academicUpdate";
	}

	// ---------------------------------------------//
	
	
	// 파트너스 정보 수정
	@RequestMapping(value = "partInfoUp.do")
	public ModelAndView partInfoUp(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {

			String MC = request.getParameter("Mcate");
			String WT = request.getParameter("workType");
			String num1 = request.getParameter("jobtype");
			String num2 = request.getParameter("profileId");
			// db값이 숫자이기 때문에
			int JT = Integer.parseInt(num1);
			int profileId = Integer.parseInt(num2);
			// 프로필번호도 같이 넘거야함
			// 프로필번호와 맴버 번호는 같아도 되지않을까??
			PartInfo partInfo = new PartInfo(WT,MC,JT,profileId);
			System.out.println("수정한 파트너스 정보" + partInfo);
			int result1 = myPageService.partInfoUpdate(partInfo);
			if(result1 > 0) {
				System.out.println("프로필을 수정합니다.");
				mv.addObject("partInfo", partInfo);
				mv.setViewName("myPage/partInfo");
			}else {
				throw new MyPageException("프로필 수정 실패!");
			}
	

		return mv;

	}
	
	// 자기소개 수정하기
	@RequestMapping(value="introductionUp.do")	
	public ModelAndView introductionUpdate(ModelAndView mv, HttpServletRequest request,Model m) {
		
		String pfId = request.getParameter("profileId");
		System.out.println(pfId);
		int profileId = Integer.parseInt(pfId);
		String introduction = request.getParameter("PR");
	
		System.out.println(introduction);
		Profile profile = new Profile(profileId,introduction);
		int result2 = myPageService.profileUpdate(profile);
		if(result2 > 0) {
			System.out.println("자기소개를 수정합니다.");
			// 전의값이잖아(로그아웃했다 하면 새로 바뀜)
			// 수정한 다음 값을 가져와야한다.
			
			mv.addObject("profile", profile);
//			mv.setViewName("myPage/introductionUpdate");
			mv.setViewName("myPage/introduction");
//			m.addAttribute("profile", profile);
		}else {
			throw new MyPageException("자기소개 수정 실패!");
		}
		
		return mv;
		
	}
	
	// 포트폴리오
	@RequestMapping(value="piInsert.do")
	public String portfolioInsertView(HttpServletRequest request
			, MultipartHttpServletRequest mtf
			,@RequestParam("img1") MultipartFile img1
//			,@RequestParam("img2") MultipartFile img2
//			,@RequestParam("img3") MultipartFile img3
			) throws ParseException {
		
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
		String portStartDate = sYear+"-"+sMonth;
//		System.out.println(start);
		String eYear = request.getParameter("end-year");
		String eMonth =request.getParameter("end-month");
		String portEndDate = eYear+"-"+eMonth;
//		System.out.println(end);
		String participation = request.getParameter("participation");
		int portJoin = Integer.parseInt(participation);
//		System.out.println(portJoin);
		// 포트폴리오 테이블
		PortFolio pf = new PortFolio(profileId,mcId,dcId,portName,portJoin,content,portStartDate,portEndDate);
		int portfoio = myPageService.insertPortfolio(pf);
		if(portfoio > 0) {
			System.out.println("포트폴리오 생성");
		}else {
			throw new MyPageException("포트폴리오 생성 실패!");
		}
		// 포트폴리오id 정보 조회
		PortFolio portId = new PortFolio(profileId);
		System.out.println(portId);
		PortFolio portfolioId = myPageService.selectPortfolio(portId);
		System.out.println(portfolioId);
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
		PortImg pi = new PortImg(portfolioId.getPortId(),imgContent1,filePath);
		System.out.println(pi);		
		int portimg = myPageService.insertPortImg(pi);
		if(portimg > 0) {
			System.out.println("포트폴리오 이미지 생성");
		}else {
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
		System.out.println(tech);
		for(int i=0;i<tech.length;i++) {
			System.out.println(tech[i]);
			// 포트폴리오 기술 테이블
			PortTec pt = new PortTec(portfolioId.getPortId(),tech[i]);
			int porttec = myPageService.insertPortTect(pt);
			if(porttec > 0) {
				System.out.println("포트폴리오 기술 생성");
			}else {
				throw new MyPageException("포트폴리오 기술 생성 실패!");
			}
		}
		
		return "myPage/portfolioAll";
		
	}

	// 보유기술 추가
	@RequestMapping(value="skillInsert.do")
	public String skillInsert(HttpServletRequest request, ModelAndView mv) {
		
		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);
		
		String skillKind = request.getParameter("skillName");
		String Level = request.getParameter("level");
		int skillLevel = Integer.parseInt(Level);
		String skillYear = request.getParameter("skillYear");
		
		Skill s = new Skill(profileId,skillKind,skillLevel,skillYear);
		int skill = myPageService.insertSkill(s);
		Skill skillInfo = myPageService.selectSkill(s);
		
//		mv.addObject("skillInfo", skillInfo);
//		mv.setViewName("myPage/skill");
		// 다시 보유기술추가 페이지로 이동 또 추가 할수 있으니까
		return "myPage/skillUpdate";
//		return mv;
	}
	
	// 경력 추가
	@RequestMapping(value="careerInsert.do")
	public String careerInsert(HttpServletRequest request) {
		
		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);
		
		String cName = request.getParameter("company-name");
		String cDept = request.getParameter("company-department");
		String cPosition = request.getParameter("company-position");
		
		String sYear = request.getParameter("start-year");
		String sMonth = request.getParameter("end-month");
		String start = sYear+"-"+sMonth;
		
		String eYear = request.getParameter("end-year");
		String eEnd = request.getParameter("end-month");
		String end = eYear+"-"+eEnd;
		
		String content = request.getParameter("content");
		
		Career c = new Career(cName,cDept,cPosition,start,end,content,profileId);
		System.out.println(c);
		int careerInfo = myPageService.insertCareer(c);
		
		return "myPage/career";
	}
	
	// 자격증 추가
	@RequestMapping(value="cerificateInsert.do")
	public String cerificateInsert(HttpServletRequest request) {
		
		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);
		
		String ccName = request.getParameter("certificate-title");
		String ccPlace = request.getParameter("certificate-company");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String ccCreateDate = year+"-"+month+"-"+day;
		String ccNumber = request.getParameter("certificate-number");
		
		Certificate certi = new Certificate(profileId,ccName,ccPlace,ccCreateDate,ccNumber);
		System.out.println(certi);
		int certificate = myPageService.insertCertificate(certi);
		
		return "myPage/cerificate";
	}
	
	// 학력 추가
	@RequestMapping(value="SSCareerUpdate.do")
	public String SScareerInsert(HttpServletRequest request) {
		
		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);
		
		String sgId = request.getParameter("schoolgrade");
		String ssId = request.getParameter("schoolstate");
		String scName = request.getParameter("school-name");
		String scMarjor = request.getParameter("major");
		String sYear =request.getParameter("start-year");
		String sMonth =request.getParameter("start-month");
		String scStartDate = sYear+"-"+sMonth;
		String eYear = request.getParameter("end-year");
		String eMonth =request.getParameter("end-month");
		String scEndDate = eYear+"-"+eMonth;
		
		SSCareer sc = new SSCareer(sgId,ssId,scName,scMarjor,scStartDate,scEndDate,profileId);
		System.out.println(sc);
		int SSCareerInfo = myPageService.insertSSCareer(sc);
		
		return "myPage/academic";
	}
}

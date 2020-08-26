package com.kh.DeVenue.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {

	// 마이페이지로 이동
		@RequestMapping(value="profile.do")
		public String profileView() {
			return "myPage/myPageDetail";
		}
		
	// 파트너스 정보 이동
		@RequestMapping(value="partInfo.do")
		public String partInfoView() {
			return "myPage/partInfo";
		}
		
	// 자기소개 이동
		@RequestMapping(value="PR.do")
		public String PRView() {
			return "myPage/selfIntroduction";
		}		

	// 포트폴리오 이동
		@RequestMapping(value="portfolio.do")
		public String protfolioView() {
			return "myPage/portfolio";
		}
	
	// 스킬 이동
		@RequestMapping(value="skill.do")
		public String skillView() {
			return "myPage/skill";
		}
		
	// 경력 이동
		@RequestMapping(value="career.do")
		public String careerView() {
			return "myPage/career";
		}
		
	// 학력 이동
		@RequestMapping(value="academic.do")
		public String academicView() {
			return "myPage/academic";
		}

		
	// 자격증 이동
		@RequestMapping(value="certificate.do")
		public String certificateView() {
			return "myPage/certificate";
		}
		
	// 프로젝트 히스토리 이동
		@RequestMapping(value="PH.do")
		public String PHView() {
			return "myPage/projectHistory";
		}
		
	
}

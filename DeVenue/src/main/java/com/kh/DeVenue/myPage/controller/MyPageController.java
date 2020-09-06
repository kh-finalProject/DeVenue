package com.kh.DeVenue.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.DeVenue.myPage.model.vo.Partinfo;

@Controller
public class MyPageController {

	// 마이페이지로 이동
	@RequestMapping(value = "profile.do")
	public String profileView() {
		return "myPage/myPageDetail";
	}

	// 파트너스 정보 이동
	@RequestMapping(value = "partInfo.do")
	public String partInfoView() {
		return "myPage/partInfo";
	}

	// 자기소개 이동
	@RequestMapping(value = "PR.do")
	public String PRView() {
		return "myPage/selfIntroduction";
	}

	// 포트폴리오 이동
	@RequestMapping(value = "portfolio.do")
	public String protfolioView() {
		return "myPage/portfolio";
	}

	// 스킬 이동
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

	// 파트너스 정보 수정 이동
	@RequestMapping(value = "partInfoUpdate.do")
	public String PIview() {
		return "myPage/partInfoUpdate";
//		return "myPage/test";
	}

	// ---------------------------------------------//
	@RequestMapping(value = "partInfoUp.do")
	public String partInfoUp(HttpServletRequest request,HttpServletResponse response) {

			String MC = request.getParameter("Mcate");
			String WT = request.getParameter("workType");
			String num = request.getParameter("jobtype");
			String memId = request.getParameter("memId");
			// db값이 숫자이기 때문에
			int JT = Integer.parseInt(num);

//			System.out.println(MC);
//			System.out.println(WT);
//			System.out.println(JT);
			System.out.println(memId);
			// 프로필번호도 같이 넘거야함
			// 프로필번호와 맴버 번호는 같아도 되지않을까??
			Partinfo pi = new Partinfo();
			
			
//			System.out.println(request.getParameterValues("ch1"));
//			
//			for (int i = 0; i < request.getParameterValues("ch" + String.valueOf(i)).length; i++) {
//
//				System.out.println(request.getParameterValues("ch" + String.valueOf(i)));
//
//			}


		return null;

	}

}

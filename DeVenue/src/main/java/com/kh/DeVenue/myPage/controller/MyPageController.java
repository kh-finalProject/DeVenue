package com.kh.DeVenue.myPage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.DeVenue.member.model.exception.MemberException;
import com.kh.DeVenue.member.model.service.MemberService;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.exception.MyPageException;
import com.kh.DeVenue.myPage.model.service.MyPageService;
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
		return "myPage/introduction";
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
	}
	
	// 자기소개 수정 이동
	@RequestMapping(value="introductionUpdate.do")
	public String IDview() {
		return "myPage/introductionUpdate";		
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

			System.out.println(MC);
			System.out.println(WT);
			System.out.println(JT);
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
	
	@Autowired
	private MyPageService myPageService;
	
	
	// 자기소개 불러오기
//	@RequestMapping(value="introduction.do")
//	public ModelAndView introduction(ModelAndView mv, HttpServletRequest request, Profile profile,@RequestParam int memId ) {
//		
//		System.out.println("자기소개 사용자 번호"+memId);
//		Profile profile1 = new Profile(memId);
//		Profile memId = myPageService.selectProfile(profile1);
//		System.out.println("자기소개에 뿌릴"+profileInfo);
//		return mv;
//		
//	}
//	public String abc(ModelAndView mv, HttpServletRequest request) {
//		
//		String memId1 = request.getParameter("memId");
//		int memIdNum = Integer.parseInt(memId1);
//		Profile memId = new Profile(memIdNum);
//		Profile profileInfo = myPageService.selectProfile(memId);
////		System.out.println(profile);
//		
//		return null;
//		
//	}

	
	
	// 자기소개 수정하기
	@RequestMapping(value="introductionUp.do")
//	public String introductionUpdate(ModelAndView mv, HttpServletRequest request) {
//		
//		String pfId = request.getParameter("profileId");
//		int profileId = Integer.parseInt(pfId);
//		String introduction = request.getParameter("PR");
//	
//		System.out.println(introduction);
//		Profile profile = new Profile(profileId,introduction);
//		int result = myPageService.profileUpdate(profile);
//		if(result > 0) {
//			System.out.println("수정합니다.");
//		}else {
//			throw new MyPageException("프로필 생성 실패!");
//		}
//		
//		return "myPage/introduction";
//		
//	}
	
	public ModelAndView introductionUpdate(ModelAndView mv, HttpServletRequest request,Model m) {
		
		String pfId = request.getParameter("profileId");
		int profileId = Integer.parseInt(pfId);
		String introduction = request.getParameter("PR");
	
		System.out.println(introduction);
		Profile profile = new Profile(profileId,introduction);
		int result = myPageService.profileUpdate(profile);
		if(result > 0) {
			System.out.println("수정합니다.");
			// 전의값이잖아(로그아웃했다 하면 새로 바뀜)
			// 수정한 다음 값을 가져와야한다.
			
			mv.addObject("profile", profile);
//			mv.setViewName("myPage/introductionUpdate");
			mv.setViewName("myPage/introduction");
//			m.addAttribute("profile", profile);
		}else {
			throw new MyPageException("프로필 생성 실패!");
		}
		
		return mv;
		
	}



}

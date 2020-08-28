package com.kh.DeVenue.member.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.biimport org.springframework.ui.Model;
nd.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

importimport org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
.kh.DeVenue.member.model.vo.Member;

@Controller
public class MemberController {
	
	// 회원가입페이지으로 이동
	@RequestMimport com.kh.DeVenue.member.model.exception.MemberException;
apping("signpage.do")
	public String signview() {
		return "member/sign";
	}
	
	// 로그인으로 이동
	@RequestMapping("loginpimport com.kh.DeVenue.member.model.vo.FindClient;
age.do")
	public String loginview() {
		return "member/login";
	}
	// 비밀번호 찾기로 이동
	@RequestMaimport com.kh.DeVenue.member.model.vo.PageInfo;
import com.kh.DeVenue.member.model.vo.Profile;

pping("forgetPwd.do")
	public String forgetPwd() {
		return "member/forgetPwd";
	}
	
	// 메인페이지로 돌아가기
	
	
	@Autowired
	private MemberService mService;
	
	// 할일 로그인 유지/ 브라우저 종료시 reload
	// 로그인 유지할때 request와 session으로 넘겨버리면???
	// 로그인 값 받아오기
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		// 자동로그인 checkbox 선택했는지
		String logincheck = request.getParameter("logincheck");
		System.out.println(logincheck); // true or null(value를 true로 설정했기때문에)
		String memEmail = request.getParameter("email");
		String memPwd = request.getParameter("pwd");
		Member m = new Member(mem	public String memberLogin(HttpSession session, HttpServletRequest request, Model model, ModelAndView mv) {
em//		// 자동로그인 checkbox 선택했는지
//		String logincheck = request.getParameter("logincheck");
//		System.out.println(logincheck); // true or null(value를 true로 설정했기때문에)
		
	}else { // 로그인 유지 체크 안할시
//				
//			}
			session.setAttribute("loginUser", loginUser);				
			return "common/mainPage";
		}else { // 로그인 실패시
			///		System.out.println(m);
		Member loginUser = mService.loginUserMember(m);
/ 아이디랑 비밀번호 잘못 입력했다는 창
			if(memEmail.equals(loginUser.getMemEmail())) {
				
//		System.out.println(loginUser);
//		System.out.println(loginUser.getMemId());
pping(value="logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		System.ou			
			// 로그인하면서 회원번호로 포트폴리오의 값을 확인한다.
			Profile memId = new Profile(loginUser.getMemId());
			Profile profile = mService.profile(memId);
			// 프로필이 있으면
			if(profile != null) {
				System.out.println(profile);
//				mv.setViewName("myPage/introduction");
//				mv.addObject("profile", profile);
//				model.addAttribute("profile", profile);
//				return "myPage/introduction";
			// 프로필이 없으면 프로필을 생성
			}else {
				System.out.println("프로필없음");
				int proId = mService.profileInsert(loginUser.getMemId());
				// 프로필 생성
				if(proId > 0) {
					System.out.println("프로필 생성 ");
//					Profile pf1 = mService.profile(memId);
//					System.out.println("pf1 : "+pf1);
				// 프로필 생성 실패
				}else {
					throw new MemberException("프로필 생성 실패!");
				}
			}
//			model.addAttribute("profile", profile);
			// session으로 보내는것이 맞는 것인가??
			session.setAttribute("profile", profile);
			session.setAttribute("loginUser", loginUser);
//			mv.setViewName("common/mainPage");
//			mv.addObject("loginUser", loginUser);
			
			
//			return mv;
			
uestMapping(value="clientList.do")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value="page",required=false) Integer page) {
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		int listCount=mService.getListCount();
		
		PageInfo pi=new PageInfo(currentPage, listCount);
		
		ArrayList<FindClient> list=mService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardListView");
		}else {
			throw new MemberException("게시글 전체 조회 실패!");
		}
		
		return mv;
	}
	

}

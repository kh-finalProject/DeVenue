package com.kh.DeVenue.member.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.DeVenue.member.model.exception.MemberException;
import com.kh.DeVenue.member.model.service.MemberService;
import com.kh.DeVenue.member.model.vo.FindClient;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.PageInfo;

import static com.kh.DeVenue.common.Pagination.*;

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
		Member m = new Member(memEmail,memPwd);

		Member loginUser = mService.loginUserMember(m);
		System.out.println(loginUser);
		System.out.println(loginUser.getUserType());
		
		

		if(loginUser != null) { // 로그인 할 멤버 객체가 조회 되었을 시
//			if(logincheck != null) { // true이냐(로그인 유지 선택시)
//			}else { // 로그인 유지 체크 안할시
//				
//			}
			session.setAttribute("loginUser", loginUser);				
			return "common/mainPage";
		}else { // 로그인 실패시
			// 아이디랑 비밀번호 잘못 입력했다는 창
			if(memEmail.equals(loginUser.getMemEmail())) {
				
			}else if(memPwd.equals(loginUser.getMemPwd())){
				
			}
			return "common/errorPage";
		}
		
	}
	
	// 로그 아웃
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		System.out.println("실행함까?");
		
		return "common/mainPage";
		
	}
	
	// 클라이언트 찾기
	@RequestMapping(value="clientList.do")
	public ModelAndView boardList(ModelAndView mv,
			@RequestParam(value="page",required=false) Integer page) {
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		int listCount=mService.getListCount();
		
		PageInfo pi=getPageInfo(currentPage, listCount);
		
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

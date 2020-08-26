package com.kh.DeVenue.member.controller;

import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.DeVenue.member.model.exception.MemberException;
import com.kh.DeVenue.member.model.service.MemberService;
import com.kh.DeVenue.member.model.vo.Member;

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
//		System.out.println(loginUser);
//		System.out.println(loginUser.getUserType());
		
		

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
		
		return "common/mainPage";
		
	}
	
	// 회원 가입
	@RequestMapping("meminsert.do")
	public String memberInsert(HttpServletRequest request) {
		
		
		
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
//		System.out.println(m);
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "common/mainPage";
		}else {
			throw new MemberException("회원가입실패!");
		}
		
	}
	
	@RequestMapping(value="usertype.do")
	public String userType(HttpServletRequest request, String userType){
		
		System.out.println("실행함까");
		System.out.println(userType);
		
		return null;
		
	}
	

}

package com.kh.DeVenue.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.DeVenue.member.model.exception.MemberException;
import com.kh.DeVenue.member.model.service.MemberService;
import com.kh.DeVenue.member.model.vo.Member;

@Controller
public class EmailController {
	// 이것이 오류 -  javax.servlet.servletexception: 서블릿 [appservlet]을(를) 위한 servlet.init() 호출이 예외를 발생시켰습니다.
 @Autowired private JavaMailSender mailSender;
 @Autowired private MemberService mService;
 
	
 	// 페이지로 이동
	@RequestMapping(value = "go.do")
	public ModelAndView emailCheck() {
		
		ModelAndView mv = new ModelAndView();
//		mv.addObject("randomCode", 1234);		
		mv.setViewName("member/emailSuccess");
		return mv;
	}
 
	// 이메일 인증
	@RequestMapping(value="email.do", method=RequestMethod.GET)
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelAndView mv, HttpSession session, Model m, HttpServletResponse response) throws Exception {
//		System.out.println("이메일인증 컨트롤러 실행");
		
		 	String USERNAME = (String) paramMap.get("name");
	        String EMAIL = (String) paramMap.get("email");
//	        String CODE = "1111111111";
	        int randomCode = new Random().nextInt(10000)+10000;
//	        System.out.println(randomCode);
	        // 난수로 바꿈
	             
	        try {
	            MimeMessage msg = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
	             
	            messageHelper.setSubject("[Devenu] 인증 메일: "+USERNAME+"님, 인증번호를 확인해주세요.");
	            messageHelper.setText("[Devenu] 회원가입 인증번호는 "+randomCode+" 입니다.");
	            messageHelper.setTo(EMAIL);
	            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(EMAIL));
	            mailSender.send(msg);
	            
	            // 문제점 : 전부 전에 보냈던걸 다시 보냄
	            
//	            mv.addObject("randomCode", randomCode);

//	            session.setAttribute("randomCode", randomCode);
	            
//	            m.addAttribute("randomCode", randomCode);
	            String ran = Integer.toString(randomCode);
	            PrintWriter out = response.getWriter();
	            out.append(ran);
	            out.flush();
	            out.close();
	             
	        }catch(MessagingException e) {
	            e.printStackTrace();
	        }
	        mv.setViewName("member/sign");
	        return mv;
	    }
	
	// 임시 패스워드 보내기
	@RequestMapping(value="findPwd.do")
    public ModelAndView pwdEmail (ModelAndView mv, HttpServletResponse response, Model m, HttpServletRequest request) throws Exception {
			
			String memEmail = request.getParameter("email");
			System.out.println(memEmail);

//	        String CODE = "1111111111";
	        int randomPwd = new Random().nextInt(1000000)+1000000;
//	        // 난수로 바꿈
        
	        try {
	            MimeMessage msg = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
	             
	            messageHelper.setSubject("[Devenu] 인증 메일: "+memEmail+"님, 임시비밀번호입니다.");
	            messageHelper.setText("[Devenu] 회원가입 임시비밀번호는 "+randomPwd+" 입니다.");
	            messageHelper.setTo(memEmail);
	            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(memEmail));
	            mailSender.send(msg);
	            String memPwd = Integer.toString(randomPwd);
	            Member pwdchange = new Member(memEmail,memPwd);

//	            System.out.println(pwdchange);
	            // 실행이 안된다?
	            int result = mService.pwdChangeMember(pwdchange);
//	            System.out.println(result);

	            if(result > 0) {
	            	System.out.println("비밀번호 DB바뀜");
	            	mv.setViewName("member/login");	
	            	
	            }else {
	            	throw new MemberException("회원가입실패!"); 
	            }
			 
	            
	        }catch(MessagingException e) {
	            e.printStackTrace();
	        }
        	
	        return mv;	            	
	    }
	
	// 이메일 중복확인
	@RequestMapping(value="emailcheck.do", method=RequestMethod.GET)
	public void EmailCheck(@RequestParam("email") String email, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();        
        
		int member = mService.memberemail(email);
		// 0 or 1 이 반환됨
//		System.out.println(member);
		// 중복된 값이 없으면 0이 반환
		if(member == 0) {
			System.out.println("이메일 사용 가능");
			out.append("ok");
			out.flush();
		// 중복된 값이 있으면 1이 반환
		}else {
			System.out.println("이메일 사용 불가능");
			out.append("fail");
			out.flush();
		}		
		out.close();	
		
	}

}
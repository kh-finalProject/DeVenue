package com.kh.DeVenue.email.controller;

import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

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

@Controller
public class EmailController {
	// 이것이 오류 -  javax.servlet.servletexception: 서블릿 [appservlet]을(를) 위한 servlet.init() 호출이 예외를 발생시켰습니다.
 @Autowired private JavaMailSender mailSender;

	
 	// 페이지로 이동
	@RequestMapping(value = "go.do")
	public ModelAndView emailCheck() {
		
		ModelAndView mv = new ModelAndView();
//		mv.addObject("randomCode", 1234);		
		mv.setViewName("member/emailSuccess");
		return mv;
	}
 
	@RequestMapping(value="email.do", method=RequestMethod.GET)
    public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelAndView mv,HttpServletResponse response, Model m) throws Exception {
//		System.out.println("이메일인증 컨트롤러 실행");
		
		 String USERNAME = (String) paramMap.get("name");
	        String EMAIL = (String) paramMap.get("email");
//	        String CODE = "1111111111";
	        int randomCode = new Random().nextInt(10000)+10000;
	        // 난수로 바꿈
	             
	        try {
	            MimeMessage msg = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
	             
	            messageHelper.setSubject("[Devenu] 인증 메일: "+USERNAME+"님, 인증번호를 확인해주세요.");
	            messageHelper.setText("[Devenu] 회원가입 인증번호는 "+randomCode+" 입니다.");
	            messageHelper.setTo(EMAIL);
	            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(EMAIL));
	            mailSender.send(msg);
//	            mv.addObject("randomCode", randomCode);

	             
	        }catch(MessagingException e) {
	            e.printStackTrace();
	        }
	        mv.setViewName("member/emailSuccess.jsp");
	        return mv;
	    }

}

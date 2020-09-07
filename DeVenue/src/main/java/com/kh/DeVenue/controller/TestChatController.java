package com.kh.DeVenue.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.DeVenue.model.service.MemberService2;
import com.kh.DeVenue.model.vo.Member;
import com.kh.DeVenue.util.model.service.ChatService;
import com.kh.DeVenue.util.model.vo.ChatUserInfo;

@Controller
public class TestChatController {
	
	@Autowired
	private MemberService2 mmService;
	@Autowired
	private ChatService cService;
	
	
//	@RequestMapping("login.do")
	public String memberLogin(Member m, HttpSession session, Model model) {
		System.out.println(m);
		Member loginUser = mmService.loginMember(m);
		System.out.println(loginUser);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			if(loginUser.getUserType().equals("UT1")||loginUser.getUserType().equals("UT2")) {
				System.out.println("관리자 로그인");
//				return "chat/adminChatRoom";
				return "redirect:goChatListManage.do";
			}else {
				
				// 채팅을 위해 관리자 정보를 죄다 불러옴(주관리자 여부는 웹단에서 구분하여 쓰자)
				ArrayList<ChatUserInfo> admins = mmService.allAdmin();
				// 채팅평시상태를 위해 안읽은 메시지를 모두 카운트해서 불러옴
				int allUnReadCount = cService.selectAllUnReadCount(loginUser.getmId());
				if(allUnReadCount >= 0) {
					session.setAttribute("allUnReadCount", allUnReadCount);
				}
				
				session.setAttribute("admins", admins);
				
				System.out.println("회원 로그인");
				return "chat/testIframe";
//				return "chat/clientChat";
			}
			
		}else {
			model.addAttribute("msg", "로그인 실패!!");
			System.out.println("흠..");
			return "home";
		}
	}
}

package com.kh.DeVenue.findMember.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.DeVenue.findMember.model.service.FindMemberService;
import com.kh.DeVenue.member.model.vo.Member;

@Controller
public class FindMemberController {

	@Autowired
	private FindMemberService fmService;
	
	
	// 파트너스 찾기 클릭시  파트너스 찾기 페이지로 이동
	@RequestMapping(value="partnersList.do")
	public ModelAndView FindPartners(ModelAndView mv) {
		
		// 전체 member를 조회
		ArrayList<Member> mList = fmService.memberAll();
		System.out.println(mList);
		for(int i=0; i < mList.size();i++) {
			System.out.println(mList.get(i).getMemId());
		}
		
		
		mv.addObject("mList", mList);
		mv.setViewName("findMember/findPartnersDetail");
		
		return mv;
	}
	
	
	// 닉네임 또는 포트폴리오로 검색
	@RequestMapping(value="searchInput.do")
	public ModelAndView searchView(ModelAndView mv,
			@RequestParam("type") String type,
			@RequestParam("text") String text) {
		
		
//		System.out.println(type);
//		System.out.println(text);
		
		if(type.equals("nickname")) {
			System.out.println("닉네임을 검색");
		}else if(type.equals("project")) {
			System.out.println("프로젝트 검색");
		}else {
			System.out.println("전체 검색");
		}
		
		
		return null;
	}
	
}

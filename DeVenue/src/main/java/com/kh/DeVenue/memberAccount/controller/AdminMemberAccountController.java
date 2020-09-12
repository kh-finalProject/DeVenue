package com.kh.DeVenue.memberAccount.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.memberAccount.model.service.MemberAccountService;
import com.kh.DeVenue.memberAccount.model.vo.DeclareDTO;
import com.kh.DeVenue.memberAccount.model.vo.IdenMember;

@Controller
public class AdminMemberAccountController {
	@Autowired
	MemberAccountService maService;
	
	// 신원인증 요청 관련 관리페이지로 가는 메소드
	@RequestMapping("gotoIdenManage.do")
	public String gotoAccountMypage(HttpSession session, HttpServletRequest request) {
		// 신원인증 요청이 온 회원들의 기본정보 몇가지와 신원인증정보를 같이 불러옴
		ArrayList<IdenMember> idenMembers = maService.selectIdenMember();
		System.out.println(idenMembers);
		
		if(idenMembers != null) {
			request.setAttribute("idenMembers", idenMembers);
			System.out.println("신원인증 신청 정보를 잘 가져옴");
			return "memberAccountManage/identityManage";
		}else {
			System.out.println("신원인증 신청 정보를 잘 못 가져옴");
			return "memberAccountManage/identityManage";
		}
	}
	
	// 신원 인증 수락 메소드
	@RequestMapping("acceptIden.do")
	public String acceptIden(String ideId) {
		int result = maService.acceptIden(ideId);
		
		if(result > 0) {
			System.out.println("신원인증 신청 수락 잘됨");
			return "redirect:gotoIdenManage.do";
		}else {
			System.out.println("신원인증 신청 수락 잘 안됨");
			return "redirect:gotoIdenManage.do";
		}
	}
	
	// 신원 인증 반려 메소드
	@RequestMapping("requestIden.do")
	public String requestIden(String ideId) {
		int result = maService.requestIden(ideId);
		
		if(result > 0) {
			System.out.println("신원인증 신청 반려 잘됨");
			return "redirect:gotoIdenManage.do";
		}else {
			System.out.println("신원인증 신청 반려 잘 안됨");
			return "redirect:gotoIdenManage.do";
		}
	}
	
	// 신고 관리페이지로 가는 메소드
	@RequestMapping("gotoDeclareManage.do")
	public String gotoDclareManage(HttpSession session, HttpServletRequest request) {
		// 신고 일정 횟수 이상이 된 회원들을 자동 제재시키는데(활동정지??), 
		// 신고먹어서 활중된애들의 정보를 먼저 가져온다.
		ArrayList<Member> declareMems = maService.selectDeclareMems();
		System.out.println(declareMems);
		
		if(declareMems != null) {
			request.setAttribute("declareMems", declareMems);
			System.out.println("신고관리 정보를 잘 가져옴");
			return "memberAccountManage/declareManage";
		}else {
			System.out.println("신고관리 정보를 잘 못 가져옴");
			return "memberAccountManage/declareManage";
		}
	}
	
	// 선택한 회원의 신고내역 디테일로
	@RequestMapping("gotoDeclareDetail.do")
	public String gotoDeclareDetail(HttpSession session, HttpServletRequest request, String memId) {
		// 신고내역 모두 가져오기
		ArrayList<DeclareDTO> declares = maService.selectDeclares(memId);
		System.out.println(declares);
		
		if(declares != null) {
			request.setAttribute("memId", memId);
			request.setAttribute("declares", declares);
			System.out.println("신고내역 정보를 잘 가져옴");
			return "memberAccountManage/declareManageDetail";
		}else {
			System.out.println("신고내역 정보를 잘 못 가져옴");
			return "memberAccountManage/declareManageDetail";
		}
	}
	
	// 제재상태 해제
	@RequestMapping("releaseSanctions.do")
	public String releaseSanctions(HttpSession session, HttpServletRequest request, String memId) {
		// 신고카운트 0으로 리셋
		// 부활절 카운트 1 추가
		int result = maService.releaseSanctions(memId);
		
		if(result > 0) {
			System.out.println("신고해제시켜줌 성공");
			return "redirect:gotoDeclareManage.do";
		}else {
			System.out.println("신고해제시켜줌 실패");
			return "redirect:gotoDeclareManage.do";
		}
	}
	
	// 7일 경과시 제재 자동으로 풀어주기(이건 로그인 단에서 구현)
	
	// 누적 제재수 3회 달성할 경우 강제 탈퇴처리(이건 로그인 단에서 구현)
	
}

package com.kh.DeVenue.memberAccount.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.memberAccount.model.service.MemberAccountService;
import com.kh.DeVenue.memberAccount.model.vo.Identify;

@Controller
public class MemberAccountController {

	@Autowired
	MemberAccountService maService;
	
	// 계정관리1 - 기본적인 개인정보 수정 및 생성 으로 가는 메소드
	@RequestMapping("gotoAccountMypage.do")
	public String gotoAccountMypage() {
		
		return "memberAccountManage/accountMain";
	}
	
	// 계정관리2 - 비밀번호 수정으로 가는 메소드
	@RequestMapping("gotoAccountChangePwd.do")
	public String gotoAccountChangePwd(@RequestParam(value="msg", required = false) String msg, HttpServletRequest request) {
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
		return "memberAccountManage/changePwd";
	}
	
	// 계정관리4,5 - 비밀번호 수정과 회원탈퇴에서 보안로그인 하는 메소드 => 보안로그인은 호준이 로그인 암호화와 loginUser객체 수정하고나서 나도 수정하자
	@RequestMapping("securityLogin.do")
	public void securityLogin(HttpServletResponse response, HttpSession session, String password) throws IOException {
		// 원래는 이렇게 하면 안되지만 loginUser세션에 이미 pwd가 들어있으므로, 세션의 값과 비교한다. 
		String memPwd = ((Member)session.getAttribute("loginUser")).getMemPwd();
		
		PrintWriter out = response.getWriter();
		if(password.equals(memPwd)) {
			out.print("true");
		}else {
			out.print("false");
		}
		out.flush();
		out.close();
	}
	
	// 계정관리4 - 비밀번호 수정에서 비밀번호 수정하는메소드
	@RequestMapping("updatePwd.do")
	public String updatePwd(HttpSession session, String password2, RedirectAttributes redirectAttributes) throws IOException {
		// 원래는 이렇게 하면 안되지만 loginUser세션에 이미 pwd가 들어있으므로, 세션의 값과 비교한다. 
		int memId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		Map map = new HashedMap();
		map.put("memId", memId);
		map.put("password", password2);
		
		int result = maService.updatePwd(map);
		
		String msg = "";
		if(result > 0) {
			System.out.println("비번 변경 성공");
			((Member)session.getAttribute("loginUser")).setMemPwd(password2);
			msg = "변경되었습니다.";
		}else {
			System.out.println("비번 변경 실패");
			msg = "변경이 실패했습니다.";
		}
		redirectAttributes.addAttribute("msg", msg);
		return "redirect:gotoAccountChangePwd.do";
	}
	
	// 계정관리5 - 회원탈퇴페이지로가는 메소드
	@RequestMapping("outOfMember.do")
	public String gotoOutOfMember() {
		
		return "memberAccountManage/outOfMember";
	}
	
	// 계정관리5 - 회원탈퇴 처리하는 메소드
	@RequestMapping("decideOut.do")
	public String decideOut(String memId, HttpSession session) {
		
		int result = maService.decideOut(memId);
		// 실패하면 화면 그대로 돌아가고, 성공하면 모든 세션을 지운채 index로 보낸다.
		if(result > 0) {
			System.out.println("회원탈퇴 완료");
			session.invalidate();
			return "redirect:home.do";
		}else{
			System.out.println("회원탈퇴 실패");
			return "memberAccountManage/outOfMember";
		}
	}
	
	// 계정관리2 - 신원인증하는 페이지로 가는 메소드
	@RequestMapping("gotoIdentityVerification.do")
	public String gotoIdentityVerification(HttpSession session, HttpServletRequest request) {
		// 신원인증 상태를 불러와야 함.
		// 로그인 유저의 회원번호로 조회해서 가져와야 함(회원가입때 자동 생성되는 테이블이므로 값이 없을리가 없음)
		int memId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		Identify iden = maService.selectIdentityInform(memId);
		
		if(iden != null) {
			System.out.println("신원인증 정보 잘 불러왔다.");
			request.setAttribute("iden", iden);
		}else {
			System.out.println("신원인증 정보 잘 못 불러왔다.");
			return "homd.do";
		}
		
		return "memberAccountManage/identityVerification";
	}
	
	// 계정관리2 - 신원인증 등록하는 메소드
	@RequestMapping(value="insertIden.do", method=RequestMethod.POST, consumes= {"multipart/form-data"})	
	public String insertIden(HttpSession session, HttpServletRequest request, @RequestParam(value="idenFile") MultipartFile file, String idenName, String idenAddress, HttpServletResponse response) throws UnsupportedEncodingException {
		int memId = ((Member)session.getAttribute("loginUser")).getMemId();
		System.out.println("신원인증 이미지 업로드하러 옴");
		response.setCharacterEncoding("UTF-8");
		
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			String originFileName = file.getOriginalFilename();
			System.out.println("파일 잘 저장했나");
			
			if(renameFileName !=null) {
				Map map = new HashedMap();
				map.put("renameFileName", renameFileName);
				map.put("originFileName", originFileName);
				map.put("idenName", idenName);
				map.put("idenAddress", idenAddress);
				map.put("memId", memId);
				
				int result = maService.insertIden(map);
				
				if(result > 0) {
					System.out.println("신원등록 성공");
					return "redirect:gotoIdentityVerification.do";
				}else {
					System.out.println("신원등록 실패");
					return "redirect:gotoIdentityVerification.do";
				}
			}
		}
		System.out.println("파일이 없다.");
		return "redirect:gotoIdentityVerification.do";
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) throws UnsupportedEncodingException {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\idenFile";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		originFileName = new String(originFileName.getBytes("8859_1"),"utf-8");
	    System.out.println(originFileName);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+"."+originFileName;
		
		String filePath = folder + "\\"+renameFileName;
		
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 계정관리2 - 신원인증 리셋하는 메소드
	@RequestMapping("resetIden.do")
	public String resetIden(String memId) {
		
		int result = maService.resetIden(memId);
		
		if(result > 0) {
			System.out.println("신원등록 초기화 성공");
			return "redirect:gotoIdentityVerification.do";
		}else {
			System.out.println("신원등록 초기화 실패");
			return "redirect:gotoIdentityVerification.do";
		}
		
	}
}

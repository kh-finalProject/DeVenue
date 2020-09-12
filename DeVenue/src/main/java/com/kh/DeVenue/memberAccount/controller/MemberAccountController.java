package com.kh.DeVenue.memberAccount.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.imageio.IIOException;
import javax.imageio.ImageIO;
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
import com.kh.DeVenue.memberAccount.model.dto.MemBasicInfo;
import com.kh.DeVenue.memberAccount.model.service.MemberAccountService;
import com.kh.DeVenue.memberAccount.model.vo.Bank;
import com.kh.DeVenue.memberAccount.model.vo.Identify;
import com.kh.DeVenue.memberAccount.model.vo.MemType;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;

@Controller
public class MemberAccountController {

	@Autowired
	MemberAccountService maService;
	
	// 계정관리1 - 기본적인 개인정보 수정 및 생성 으로 가는 메소드
	@RequestMapping("gotoAccountMypage.do")
	public String gotoAccountMypage(HttpSession session, HttpServletRequest request) {
		int mId = ((Member)session.getAttribute("loginUser")).getMemId();
		// 은행 목록을 불러옴
		ArrayList<Bank> banks = maService.selectBankName();
		System.out.println(banks);
		// 회원 형태 목록을 불러옴
		ArrayList<MemType> memTypes = maService.selectMemType();
		System.out.println(memTypes);
		// 여러 테이블로부터 필요한 컬럼만 불러오자.(dto 패키지에 클래스 생성)
		MemBasicInfo mbi = maService.selectMemBasicInfo(mId);
		
		if(mbi != null && banks != null && memTypes != null) {
			request.setAttribute("mbi", mbi);
			request.setAttribute("banks", banks);
			request.setAttribute("memTypes", memTypes);
			System.out.println("회원 기본 계정 정보를 잘 불러옴");
			return "memberAccountManage/accountMain";
		}else {
			System.out.println("회원 기본 계정 정보를 못 불러옴");
			return "memberAccountManage/accountMain";
		}
	}
	// 계정관리1 - 기본정보 수정하는 메소드
	@RequestMapping(value="basicInfoUpdate.do", method=RequestMethod.POST, consumes= {"multipart/form-data"})
	public String updateBasicInfo(HttpSession session, HttpServletRequest request
			,@RequestParam(value="profileImg", required=false) MultipartFile file, String mtCode, String name, String address1, String address2, String address3, String email) throws UnsupportedEncodingException {
		int mId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		if(!file.getOriginalFilename().equals("")) {
			String folderName = "\\proImg";
			String renameFileName = saveFile(file, request, folderName);
			System.out.println("파일 잘 저장했나");
			
			if(renameFileName !=null) {
				Map map = new HashedMap();
				map.put("mId", mId);
				map.put("renameFileName", renameFileName);
				map.put("mtCode", mtCode);
				map.put("name", name);
				map.put("address1", address1);
				map.put("address2", address2);
				map.put("address3", address3);
				map.put("email", email);
				System.out.println("파일이름 : " + renameFileName);
				System.out.println("회원번호 : " + mId);
				int result = maService.updateBasicInfo(map);
				int resultF = maService.updateProfileImg(map);
				System.out.println("resultF : " + resultF);
				if(result > 0 && resultF > 0) {
					System.out.println("기본정보 수정 성공");
					return "redirect:gotoAccountMypage.do";
				}else {
					System.out.println("기본정보 수정 실패");
					return "redirect:gotoAccountMypage.do";
				}
			}else {
				System.out.println("파일 리네임 에러");
				return "redirect:gotoAccountMypage.do";
			}
		}else {//파일이 없으면 나머지만 업데이트
			Map map = new HashedMap();
			map.put("mId", mId);
			map.put("mtCode", mtCode);
			map.put("name", name);
			map.put("address1", address1);
			map.put("address2", address2);
			map.put("address3", address3);
			map.put("email", email);
			
			int result = maService.updateBasicInfo(map);
			
			if(result > 0) {
				System.out.println("기본정보 수정 성공");
				return "redirect:gotoAccountMypage.do";
			}else {
				System.out.println("기본정보 수정 실패");
				return "redirect:gotoAccountMypage.do";
			}
		}
		
	}
	
	// 계정관리1 - 연락처 수정하는 메소드
	@RequestMapping("updatePhoneInfo.do")
	public String updatePhoneInfo(HttpSession session, String faxPhone,
			String cellPhone0, String cellPhone1, String cellPhone2, String cellPhone3,
			String homePhone1, String homePhone2) {
		int mId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		String cellPhone = cellPhone0 + "," + cellPhone1 + "," + cellPhone2 + "," + cellPhone3;
		String homePhone = homePhone1 + ", " + homePhone2;
		
		Map map = new HashedMap();
		map.put("mId", mId);
		map.put("cellPhone", cellPhone);
		map.put("homePhone", homePhone);
		map.put("faxPhone", faxPhone);
		
		int result = maService.updatePhoneInfo(map);
		
		if(result > 0) {
			System.out.println("연락처 정보 수정 성공");
			return "redirect:gotoAccountMypage.do";
		}else {
			System.out.println("연락처 정보 수정 실패");
			return "redirect:gotoAccountMypage.do";
		}
	}
	
	// 계정관리1 - 계좌정보 생성 혹은 수정하는 메소드
	@RequestMapping("updateInsertAccountInfo.do")
	public String updateInsertAccountInfo(HttpSession session, String bankName, String master, String acNum) {
		int mId = ((Member)session.getAttribute("loginUser")).getMemId();
		
		Map map = new HashedMap();
		map.put("mId", mId);
		map.put("bankName", bankName);
		map.put("master", master);
		map.put("acNum", acNum);
		
		int result = maService.updateInsertAccountInfo(map);
		
		if(result > 0) {
			System.out.println("계좌 정보 생성 혹은 수정 성공");
			return "redirect:gotoAccountMypage.do";
		}else {
			System.out.println("계좌 정보 생성 혹은 수정 실패");
			return "redirect:gotoAccountMypage.do";
		}
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
		int mId = ((Member)session.getAttribute("loginUser")).getMemId();
		String memPwd = maService.getPwd(mId);
		
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
		System.out.println("idenAdress : " + idenAddress);
		if(!file.getOriginalFilename().equals("")) {
			String folderName = "\\idenFile";
			String renameFileName = saveFile(file, request, folderName);
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
	
	private String saveFile(MultipartFile file, HttpServletRequest request, String folderName) throws UnsupportedEncodingException {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + folderName;
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename().toString().replace('%', '_'); //리퀘스트로 넘어온 파일명
//		originFileName = new String(originFileName.getBytes("8859_1"),"UTF-8");
//		String docName = URLEncoder.encode(originFileName,"EUC-KR");
//		String originFileName = file.getOriginalFilename();
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

	// 계정관리3 - 날인목록페이지로 가는 메소드
	@RequestMapping("gotoSignatureList.do")
	public String gotoSignatureList(HttpSession session, HttpServletRequest request) {
		int memId = ((Member)session.getAttribute("loginUser")).getMemId();
		System.out.println("회원 번호 : " + memId);
		ArrayList<Signature2> sigList = maService.selectSignatureList(memId);
		System.out.println("날인 리스트 : "+sigList);
		
		if(sigList != null && !sigList.isEmpty()) {
			request.setAttribute("sigList", sigList);
			System.out.println("날인 목록 조회 성공");
			return "memberAccountManage/signatureList";
		}else {
			System.out.println("날인 목록 조회 실패");
			return "memberAccountManage/signatureList";
		}
		
	}
	
	// 계정관리3 - 삭제할 날인을 프로젝트에서 사용중인지 검사
	@RequestMapping("searchProjectForSigDelete.do")
	public void searchProjectForSigDelete(HttpServletResponse response, HttpSession session, String sigId) throws IOException {
		
		Integer usedSigId = maService.searchProjectForSigDelete(sigId);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if(usedSigId != null) {
			out.print("true");//이미 사용중인 날인
		}else {
			out.print("false");
		}
		out.flush();
		out.close();
	}
	
	// 계정관리3 - 날인 삭제하는 메소드
	@RequestMapping("deleteSignature.do")
	public String deleteSignature(String id) {
		
		int result = maService.deleteSignature(id);
		
		if(result>0) {
			System.out.println("날인 삭제 성공");
		}else {
			System.out.println("날인 삭제 실패");
		}
		return "redirect:gotoSignatureList.do";
	}
	
	// 계정관리3 - 주날인 정하는 메소드
	@RequestMapping("changeMainSignature.do")
	public String changeMainSignature(String id, String cId) {
		Map map = new HashedMap();
		map.put("id", id);
		
		System.out.println("현재 주사용 날인 아이디 : " + cId);
		if(cId.equals("")) {
			System.out.println("현재 등록된 주사용 날인이 없는 상태 -> 기존 주사용 날인 굿바이");
			int result = maService.changeMainSignature(map);
			
			if(result>0) {
				System.out.println("주사용 날인 변경 혹은 등록 성공");
			}else {
				System.out.println("주사용 날인 변경 혹은 등록 실패");
			}
		}else {
			map.put("cId", cId);
			int result = maService.changeCommonSignature(map);
			int result2 = maService.changeMainSignature(map);
			
			if(result>0 && result2>0) {
				System.out.println("주사용 날인 변경 혹은 등록 성공");
			}else {
				System.out.println("주사용 날인 변경 혹은 등록 실패");
			}
		}
		
		return "redirect:gotoSignatureList.do";
	}
	
	// 계정관리3 - 서명등록페이지로 이동하는 메소드
	@RequestMapping("gotoInsertSign.do")
	public String gotoInsertSign() {
		
		return "memberAccountManage/insertSign";
	}

	// 계정관리3 - 도장등록페이지1로 이동하는 메소드
	@RequestMapping("gotoInsertStamp.do")
	public String gotoInsertStamp() {
		
		return "memberAccountManage/insertStamp";
	}

	// 계정관리3 - 서명등록하는 메소드
	@RequestMapping(value="insertSign.do", method=RequestMethod.POST, consumes= {"multipart/form-data"})
	public void insertSign(HttpSession session, @RequestParam(value="file", required=true) MultipartFile [] file, HttpServletRequest request, HttpServletResponse response) throws IOException {
		int memId = ((Member)session.getAttribute("loginUser")).getMemId();
		System.out.println("서명 이미지 업로드하러 옴");
		System.out.println("file size : " + file[0].getSize());	// 서버로 무사히 안착됨
		
		if(!file[0].getOriginalFilename().equals("")) {
			System.out.println("파일이 있다.");
			String folderName = "\\sigImg";
			String renameFileName = saveFile(file[0], request, folderName);
			String originFileName = file[0].getOriginalFilename();
			System.out.println("파일 잘 저장했나");
			
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			if(renameFileName !=null) {
				Map map = new HashedMap();
				map.put("renameFileName", renameFileName);
				map.put("originFileName", originFileName);
				map.put("memId", memId);
				
				int result = maService.insertSign(map);
				
				if(result > 0) {
					System.out.println("서명등록 성공");
					String msg = "서명 등록에 성공하였습니다.";
					out.print(msg);
				}else {
					System.out.println("서명등록 실패");
					String msg = "서명 등록에 실패하였습니다.";
					out.print(msg);
				}
			}
			out.flush();
			out.close();
		}
	}
	
	static int white = new Color(255,255,255).getRGB();
	static int black = new Color(0, 0, 0).getRGB();
	static int red = new Color(164, 13, 20).getRGB();
	// 계정관리3 - 이미지파일 색상변환작업 후 대비조정 단계로 이동(파일은 전송..?)
	@RequestMapping(value="changeImgColor.do", method=RequestMethod.POST, consumes = {"multipart/form-data"})
	public String changeImgColor(HttpSession session, @RequestParam(value="stampFile", required=true) MultipartFile file, HttpServletRequest request) throws IOException {
		if(!file.getOriginalFilename().equals("")) {
			// 버퍼이미지로 변환
			BufferedImage image = ImageIO.read(file.getInputStream());
			// 색상변환 및 저장
			String renameFileName = changeToRedExceptWhite(image, request);
			if(renameFileName != null) {
				// 변환 및 저장이 잘 되었으면 이 이름을 대비조정 단계페이지로 넘겨주고, 그곳에서 대비조정하게 한다.
				request.setAttribute("renameFileName", renameFileName);
			}
		}
		
		return "memberAccountManage/insertStamp2";
	}
	// 도장이미비를 흰빨로 바꾸고 서버에 저장할 함수
	public String changeToRedExceptWhite(BufferedImage image, HttpServletRequest request) {
		int width = image.getWidth();
		int height = image.getHeight();
		for(int w = 0; w < width; w++) {
			for(int h = 0; h < height; h++) {
				// 흰색이 아닌색은 모두 빨간색으로 바꾸어버림(도장이니까)
				if(image.getRGB(w, h) != white) {
					image.setRGB(w, h, red);
				}
			}
		}
		
		String renameFileName = null;
		try {
			String folderName = "\\sigImg";
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + folderName;
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdirs();
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			renameFileName = sdf.format(new Date(System.currentTimeMillis()))
					+"_"+"Stamp"+((int)(Math.random()*1000)+1)+".png";
			
			String filePath = folder + "\\"+renameFileName;
			
			ImageIO.write(image, "png", new File(filePath));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	// 도장등록2단계에서 재첨부 버튼 누르면 1단계진행으로 생성된 파일 삭제 후 1단계 페이지로 이동
	@RequestMapping("reUploadStampImg.do")
	public String reUploadStampImg(HttpServletRequest request, String renameFileName) {
		
		System.out.println("파일 이름: " + renameFileName);
		
		if(renameFileName != null) {
			String folderName = "\\sigImg";
			deleteFile(renameFileName, folderName, request);
		}
		
		return "redirect:gotoInsertStamp.do";
	}
	
	// 파일 삭제하는 메소드
	private void deleteFile(String fileName, String folderName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + folderName;
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
			System.out.println("파일 삭제완료");
		}
	}
	
	// 대비조정된 도장이미지 저장 후 도장이미지 컷팅페이지로 넣어줌
	@RequestMapping(value="changeContrast.do", method=RequestMethod.POST, consumes = {"multipart/form-data"})
	public String changeContrast(HttpSession session, String contrastPercent, HttpServletRequest request, String beforeFileName) throws IOException {
		System.out.println("대비조정이미지 저장 및 이전 이미지 삭제 메소드 들어옴");
		System.out.println("콘트라스트 수치(퍼센트)가 들어왔나 : " + contrastPercent);
		
		// 넘겨받은 수치 백분율로 전환
		float contPer = Float.valueOf(contrastPercent)/100;
		
		// 기존의 색상변환했던 이미지 파일을 불러와서
		// 수치대로 대비 조정 후 다시 저장(이전의 것은 삭제)
		float brightenFactor = 1.0f + contPer;//1보다 적어지는데, 이때 좌측만 먹는다.
		System.out.println("대비조정 수치 : " + brightenFactor);
		
		// 로컬 파일로부터 이미지 읽기
		String folderName = "\\sigImg";
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + folderName + "\\" + beforeFileName;
		
        File sourceimage = new File(filePath);
        BufferedImage img = null;
        // 새로고침하여 파일을 읽어올 수 없는 경우 첫단계로 보내버림
        try {
        	img = ImageIO.read(sourceimage);
        }catch(IIOException e) {
        	return "redirect:gotoInsertStamp.do";
        }
//        System.out.println("버퍼드이미지 가로 : "+img.getWidth());
//        System.out.println("버퍼드이미지 세로 : "+img.getHeight());
        
        // InputStream으로부터 이미지 읽기
//        InputStream is = new BufferedInputStream(new FileInputStream("c:\\new_logo.gif"));
//        image2 = ImageIO.read(is);
        // URL로 부터 이미지 읽기
//        URL url = new URL("http://www.ojc.asia/images/new_logo.gif");
//        image3 = ImageIO.read(url);
        
        // 버퍼이미지에 대비 조절 함
//		RescaleOp op = new RescaleOp(1.5f, 0, null);
//		img = op.filter(img, img);
		
//        RescaleOp rescale = new RescaleOp(contPer, 0, null);
//        img=rescale.filter(img,null);
        
//        int red = new Color(164, 13, 20).getRed();
//        int green = new Color(164, 13, 20).getGreen();
//        int blue = new Color(164, 13, 20).getBlue();
//        float redCont = red * brightenFactor;
//        int maxRGB = 255;
//        System.out.println("redCont: "+redCont);
//        float greenCont = green * brightenFactor;
//        System.out.println("greenCont: "+greenCont);
//        float blueCont = blue * brightenFactor;
//        System.out.println("blueCont: "+blueCont);
//        if(redCont >= maxRGB) {
//        	redCont = maxRGB;
//        }
//        if(greenCont >= maxRGB) {
//        	greenCont = maxRGB;
//        }
//        if(greenCont >= maxRGB) {
//        	greenCont = maxRGB;
//        }
        //----------------------
        int r = 164, g = 13, b = 20;
        float[] hsb = Color.RGBtoHSB(r, g, b, null);
        float[] hsbTran = new float[3];
        for (int i = 0; i < hsb.length; i++) {
        		hsbTran[i] = hsb[i];
        		if(i == 1) {
        			hsbTran[i] = hsb[i] + contPer;
        			if(hsbTran[i] >= 1) {
        				hsbTran[i] = 1;
        			}
        		}
        		if(i == 2) {
        			hsbTran[i] = hsb[i] + contPer/3;
        			if(hsbTran[i] >= 1) {
        				hsbTran[i] = 1;
        			}
        		}
               System.out.println("HSB 각 값 : " + hsbTran[i]);
        }
        int resultRGB = Color.HSBtoRGB(hsbTran[0], hsbTran[1], hsbTran[2]);
        System.out.println("resultRGB : " + resultRGB);
        
        int width = img.getWidth();
		int height = img.getHeight();
//		int contrastColor = new Color(Math.round(redCont), Math.round(greenCont), Math.round(blueCont)).getRGB();
		
		for(int w = 0; w < width; w++) {
			for(int h = 0; h < height; h++) {
				if(img.getRGB(w, h) != white) {
					img.setRGB(w, h, resultRGB);
				}
			}
		}
        
		// 버퍼이미지를 저장(대비조정한 파일 업로드)
		String renameFileName = saveBufferFile(img, request, folderName);
		if(renameFileName != null) {
			request.setAttribute("renameFileName", renameFileName);
			System.out.println("대비조정 파일 업로드 완료 : " + renameFileName);
			
			// 색상변환단계 파일 삭제
			deleteFile(beforeFileName, folderName, request);
			System.out.println("색상변환단계 파일 삭제 : " + beforeFileName);
		}
		
		
		return "memberAccountManage/insertStamp3";
	}
	
	private String saveBufferFile(BufferedImage img, HttpServletRequest request, String folderName) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + folderName;
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
				+"_"+"Stamp"+((int)(Math.random()*1000)+1)+".png";
		
		String filePath = folder + "\\"+renameFileName;
		
		try {
			ImageIO.write(img, "png", new File(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}

	@RequestMapping("cutImgAndUpload.do")
	public String cutImgAndUpload(String x1, String y1, String x2, String y2, String w, String h, String renameFileName, HttpServletRequest request, HttpSession session) throws IOException {
		System.out.println("커팅좌표 : (" + x1 + ", " + y1 + ", " + x2 + ", " + y2 + ")");
		System.out.println("커팅된 크기 : " + w + "," + h);
		System.out.println("커팅 전 파일 이름 : " + renameFileName);
		
		// 좌표를 int형으로 변환
		int x = Integer.valueOf(x1);
		int y = Integer.valueOf(y1);
		int width = Integer.valueOf(w);
		int height = Integer.valueOf(h);
		
		String folderName = "\\sigImg";
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + folderName + "\\" + renameFileName;
		
        File sourceimage = new File(filePath);
        BufferedImage img = ImageIO.read(sourceimage);
		
        Rectangle rect = new Rectangle(x, y, width, height);
        
        BufferedImage cropImg = cropImage(img, rect);
        
        // 제대로 잘려 반환되었으면 이전 이미지 삭제 후 자른이미지 저장 및 DB로 해당 이미지 날인 정보 송신
        if(cropImg != null) {
        	deleteFile(renameFileName, folderName, request);
        	
        	String finalFileName = saveBufferFile(cropImg, request, folderName);
        	
        	int mId = ((Member)session.getAttribute("loginUser")).getMemId();
        	
        	Map map = new HashedMap();
        	map.put("mId", mId);
        	map.put("renameFileName", finalFileName);
        	
        	int result = maService.insertStamp(map);
        	
        	if(result > 0) {
        		System.out.println("성공적으로 도장 날인 업로드를 마무리함");
        	}else {
        		System.out.println("커팅 이미지는 있지만 db에 저장을 못함");
        	}
        }else {
        	System.out.println("이미지 커팅이 정상적으로 되지 않았음");
        }
		return "redirect:gotoSignatureList.do";
	}
	
	// 좌표 및 완성 이미지 크기를 담는 내부클래스
	class Rectangle{
		int x;
		int y;
		int width;
		int height;
		
		Rectangle(int x, int y, int width, int height){
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
		}
	}
	// 이미지 컷팅 후 반환 메소드
   private BufferedImage cropImage(BufferedImage img, Rectangle rect) {
      BufferedImage cutImg = img.getSubimage(rect.x, rect.y, rect.width, rect.height);
      return cutImg; 
   }
}

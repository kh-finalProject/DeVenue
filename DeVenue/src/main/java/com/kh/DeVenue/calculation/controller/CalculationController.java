package com.kh.DeVenue.calculation.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.DeVenue.calculation.model.service.CalculationService;
import com.kh.DeVenue.calculation.model.vo.Calculation;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.memberAccount.model.vo.Signature2;
import com.kh.DeVenue.project.model.vo.Project;

@Controller
public class CalculationController {
	
	@Autowired
	CalculationService calService;
	
	
	@RequestMapping(value="gotoCalculation.do")
	public ModelAndView goToCalculation(ModelAndView mv) {
		
		//정산하기
		
		//결제가 완료되었으면서 프로젝트 상태가 종료/중단인 프로젝트를 조회한다.
		ArrayList<Calculation> project=calService.selectPaidProject();
		
		//정산 리스트를 조회한다
		ArrayList<Calculation> calculation=calService.selectCalculation();
		System.out.println("정산리스트"+project);
		
		mv.addObject("project", project);
		mv.addObject("cal", calculation);
		mv.setViewName("admin/adminCalculation");
		
		return mv;
	}
	
	@RequestMapping(value="gotoContract.do")
	public ModelAndView goToContract(ModelAndView mv) {
		
		//계약서 등록과 열람 게시판
		
		//결제전 상태의 프로젝트 조회
		ArrayList<Project> project=calService.selectUnpaidProject();
		
		mv.addObject("project", project);
		mv.setViewName("admin/adminContract");
		
		
		return mv;
	}
	
	@RequestMapping(value="getMemberInfo.do")
	public void getMemberInfo(HttpServletResponse response, @RequestParam(value="proId",required=false) Integer proId,
			@RequestParam(value="clientId",required=false) Integer clientId) throws JsonIOException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		
		System.out.println("프로젝트 아이디:"+proId);
		System.out.println("클라이언트 아이디:"+clientId);
		
		//클라이언트 정보가져오기 
		Member client=calService.selectClient(clientId);
		System.out.println("클라이언트"+client);
		
		//프로젝트의 날인 가져오기
		Signature2 proSign=calService.selectProjectSignature(proId);
		System.out.println("프로젝트 날인:"+proSign);
		
		//매칭된 파트너스의 정보 가져오기
		ArrayList<Member> partners=calService.selectPartners(proId);
		System.out.println("매칭 파트너스"+partners);
		
		//파트너스의 날인을 가져오자 
		ArrayList<Signature2> sign=calService.selectSignature(partners);
		System.out.println("파트너스 날인"+partners);
		
		HashMap info=new HashMap();
		info.put("client", client);
		info.put("proSign", proSign);
		info.put("partners", partners);
		info.put("sign", sign);
		
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(info, response.getWriter());
		
		
		
		
	}
	
	@RequestMapping(value="uploadContractDoc.do")
	public void uploadContractDoc(HttpServletResponse response,HttpServletRequest request ,@RequestParam(value = "file",required = false) MultipartFile file,
			@RequestParam(value = "proId",required=false) Integer proId) throws IOException {
		
		
		String name=file.getOriginalFilename();
		
		System.out.println("업로드한 계약서 이름?:"+name);
		System.out.println("프로젝트 ID?:"+proId);
		
		if(file!=null) {
			saveFile(file,request);
		}
		
		HashMap upload=new HashMap();
		upload.put("proId", proId);
		upload.put("name", name);
		
	
		int result=0;
		result=calService.uploadContractDoc(upload);
		
		
		PrintWriter out=response.getWriter();
		if(result>0) {
			out.append("success");
		}else {
			out.append("fail");
		}
		
		out.flush();
		out.close();
		
		
	}
	

	private void saveFile(MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException {
		
		String root=request.getSession().getServletContext().getRealPath("resources");
		String saveDir=root+"\\contract";
		File folder=new File(saveDir);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		
		String originName=file.getOriginalFilename();
		
		
		String path=folder+"\\"+originName;
		
		file.transferTo(new File(path));
		
		
	}
	
	@RequestMapping(value="getCalculationInfo.do")
	public void getCalculationInfo(HttpServletResponse response,@RequestParam(value = "proId",required=false) Integer proId ) throws JsonIOException, IOException {
		
		
		response.setContentType("application/json;charset=utf-8");
		
		System.out.println("프로젝트 아이디:"+proId);
		
		//매칭 파트너스의 정보를 가져오자
		ArrayList<Member> partners=calService.selectMatched(proId);
		System.out.println("매칭 파트너스 list"+partners);
		
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(partners, response.getWriter());
	}
	
	
	@RequestMapping(value="uploadCalculation.do")
	public String uploadCalculation(
			@ModelAttribute Calculation calculation,
			@RequestParam(value="proId", required=false) String proId
			
			) {
		
		
		//정산 테이블 insert하기
		System.out.println("정산내역"+calculation);
		System.out.println("proId:"+proId);
		int result=calService.uploadCalculation(calculation);
		
		
		return "redirect:gotoCalculation.do";
	}

}

package com.kh.DeVenue.findMember.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.DeVenue.findMember.model.service.FindMemberService;
import com.kh.DeVenue.findMember.model.vo.FindPartners;
import com.kh.DeVenue.findMember.model.vo.PEvalView;
import com.kh.DeVenue.member.model.service.MemberService;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;
import com.kh.DeVenue.myPage.model.service.MyPageService;
import com.kh.DeVenue.myPage.model.vo.Career;
import com.kh.DeVenue.myPage.model.vo.Certificate;
import com.kh.DeVenue.myPage.model.vo.Eval;
import com.kh.DeVenue.myPage.model.vo.PortFolio;
import com.kh.DeVenue.myPage.model.vo.PortTecView;
import com.kh.DeVenue.myPage.model.vo.SCCareer;
import com.kh.DeVenue.myPage.model.vo.Skill;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectProcess;

@Controller
public class FindMemberController {

	@Autowired
	private FindMemberService fmService;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MemberService mService;

	// 파트너스 찾기 클릭시 파트너스 찾기 페이지로 이동
	@RequestMapping(value = "partnersList.do")
	public ModelAndView FindPartners(ModelAndView mv) {

		// 전체 member를 조회
//		ArrayList<Member> mList = fmService.memberAll();
//		System.out.println(mList);
//		for(int i=0; i < mList.size();i++) {
//			System.out.println(mList.get(i).getMemId());
//		}

		// 파트너스 찾기 view
		ArrayList<FindPartners> fpList = fmService.findPartList();
		System.out.println(fpList);

		// 포트폴리오 개수
//		int portCount = myPageService.portCount(profileId);
//		mv.addObject("portCount", portCount);

//		mv.addObject("mList", mList);
		mv.addObject("fpList", fpList);

		/* mv.setViewName("findMember/findPartnersDetail"); */
		mv.setViewName("findMember/findPartners");

		return mv;
	}

	// 닉네임 또는 포트폴리오로 검색
	@RequestMapping(value = "searchInput.do")
	public ModelAndView searchView(ModelAndView mv, @RequestParam("type") String type,
			@RequestParam("text") String text) {

//		System.out.println(type);
//		System.out.println(text);

		if (type.equals("nickname")) {
			System.out.println("닉네임을 검색");
		} else if (type.equals("project")) {
			System.out.println("프로젝트 검색");
		} else {
			System.out.println("전체 검색");
		}

		return null;
	}

	// 클릭시 디테일페이지로 이동
	@RequestMapping(value = "fpDetail.do")
	public ModelAndView detail(ModelAndView mv, HttpServletRequest request) {

		// 프로필 아이디를 조회하고
		String id1 = request.getParameter("proId");
		int profileId = Integer.valueOf(id1);
		System.out.println(profileId);

		// memId를 비교해서 전체 값 가져오기
		FindPartners fp = fmService.selectFm(profileId);
		System.out.println(fp);

		// profileId를 넘겨서 포트폴리오값을 가져오자
		ArrayList<PortFolio> portfolio = myPageService.portList(profileId);
		System.out.println(portfolio);

		// profileId를 념겨서 portTec
		for (int i = 0; i < portfolio.size(); i++) {
			System.out.println(portfolio.get(i).getPortId());

			int portId = portfolio.get(i).getPortId();

			ArrayList<PortTecView> portTec = myPageService.ptList(portId);
			System.out.println(portTec);

			mv.addObject("portTec", portTec);
		}

		// profileId를 넘겨서 보유 기술 list 가져오기
		ArrayList<Skill> skillList = myPageService.selectSkillInfo(profileId);
//				System.out.println(skillList);

		// profileId를 넘겨서 경력list 가져오기
		ArrayList<Career> careerList = myPageService.selectCareerInfo(profileId);
//				System.out.println(careerList);

		// profileId를 넘겨 학력list 가져오기
		ArrayList<SCCareer> sccareerList = myPageService.selectSCCareerInfo(profileId);
//				System.out.println(sccareerList);

		// profileId를 넘겨 자격증list 가져오기
		ArrayList<Certificate> certiList = myPageService.selectCertificateInfo(profileId);
//				System.out.println(certiList);

		// profileId를 넘겨 포트폴리오 개수 가져오기
		int portCount = myPageService.portCount(profileId);

		// memId를 검색해서 평가 가져오기
		String mId = request.getParameter("memId");
		int memId = Integer.valueOf(mId);

		// memId를 기준으로 파트너스 평가 가져오기
		ArrayList<PEvalView> PartEval = fmService.partEvalList(memId);
		System.out.println(PartEval);

		mv.addObject("fp", fp);
		mv.addObject("portfolio", portfolio);
		mv.addObject("skillList", skillList);
		mv.addObject("careerList", careerList);
		mv.addObject("sccareerList", sccareerList);
		mv.addObject("certiList", certiList);
		mv.addObject("portCount", portCount);
		mv.addObject("PartEval", PartEval);

		mv.addObject("profileId", profileId);
		mv.addObject("memId", memId);
		mv.setViewName("findMember/findPartnersDetail");

		return mv;
	}

	// 자기소개 자세히보기
	@RequestMapping(value = "fpIntroduce,do")
	public ModelAndView fpIntro(ModelAndView mv, HttpServletRequest request) {

		String id1 = request.getParameter("proId");
		int profileId = Integer.valueOf(id1);
		String id2 = request.getParameter("memId");
		int memId = Integer.valueOf(id2);

		Profile profile = fmService.selectIntroduce(profileId);
		Member mem = fmService.selectMemNick(memId);
		mv.addObject("profile", profile);
		mv.addObject("profileId", profileId);
		mv.addObject("memId", memId);
		mv.addObject("mem", mem);

		mv.setViewName("findMember/findPartIntroduction");

		return mv;
	}

	// 포트폴리오 자세히보기
	@RequestMapping(value = "fpPortfolioAll.do")
	public ModelAndView fpPortAll(ModelAndView mv, HttpServletRequest request) {

		String id1 = request.getParameter("proId");
		int profileId = Integer.valueOf(id1);
		String id2 = request.getParameter("memId");
		int memId = Integer.valueOf(id2);

		ArrayList<PortFolio> portList = fmService.portList(profileId);
		Member mem = fmService.selectMemNick(memId);

		// profileId를 념겨서 portTec
		for (int i = 0; i < portList.size(); i++) {
			System.out.println(portList.get(i).getPortId());

			int portId = portList.get(i).getPortId();

			ArrayList<PortTecView> portTec = myPageService.ptList(portId);
			System.out.println(portTec);

			mv.addObject("portTec", portTec);
		}

		mv.addObject("profileId", profileId);
		mv.addObject("memId", memId);
		mv.addObject("portList", portList);
		mv.addObject("mem", mem);

		mv.setViewName("findMember/findPartPortfolioAll");

		return mv;
	}
	
	// 보유 기술 자세히보기
	@RequestMapping(value="fpSkill.do")
	public ModelAndView fpSkill(ModelAndView mv, HttpServletRequest request) {
		
		String id1 = request.getParameter("proId");
		int profileId = Integer.valueOf(id1);
		String id2 = request.getParameter("memId");
		int memId = Integer.valueOf(id2);

		Member mem = fmService.selectMemNick(memId);
		ArrayList<Skill> skillList = myPageService.selectSkillInfo(profileId);

		mv.addObject("profileId", profileId);
		mv.addObject("memId", memId);
		mv.addObject("mem", mem);
		mv.addObject("skillList", skillList);

		mv.setViewName("findMember/findPartSkill");

		return mv;
	}
	
	// 경력 자세히 보기
	@RequestMapping(value="fpCareer.do")
	public ModelAndView fpCareer(ModelAndView mv, HttpServletRequest request) {
		
		String id1 = request.getParameter("proId");
		int profileId = Integer.valueOf(id1);
		String id2 = request.getParameter("memId");
		int memId = Integer.valueOf(id2);

		Member mem = fmService.selectMemNick(memId);
		ArrayList<Career> careerlist = myPageService.selectCareerInfo(profileId);
		
		mv.addObject("profileId", profileId);
		mv.addObject("memId", memId);
		mv.addObject("mem", mem);
		mv.addObject("careerlist", careerlist);
		
		mv.setViewName("findMember/findPartCareer");

		return mv;
	}
	
	// 학력 자세히 보기
	@RequestMapping(value="fpScCareer.do")
	public ModelAndView fpScCareer(ModelAndView mv, HttpServletRequest request) {
		
		String id1 = request.getParameter("proId");
		int profileId = Integer.valueOf(id1);
		String id2 = request.getParameter("memId");
		int memId = Integer.valueOf(id2);

		Member mem = fmService.selectMemNick(memId);
		ArrayList<SCCareer> sccareerList = myPageService.selectSCCareerInfo(profileId);

		mv.setViewName("myPage/academic");
		mv.addObject("profileId", profileId);
		mv.addObject("memId", memId);
		mv.addObject("mem", mem);
		mv.addObject("sccareerList", sccareerList);
		
		mv.setViewName("findMember/findPartScCareer");

		return mv;
	}
	
	// 자격증 자세히 보기
	@RequestMapping(value="fpCertificate.do")
	public ModelAndView fpCertificate(ModelAndView mv, HttpServletRequest request) {
		
		String id1 = request.getParameter("proId");
		int profileId = Integer.valueOf(id1);
		String id2 = request.getParameter("memId");
		int memId = Integer.valueOf(id2);

		Member mem = fmService.selectMemNick(memId);
		ArrayList<Certificate> certiList = myPageService.selectCertificateInfo(profileId);


		mv.setViewName("myPage/certificate");
		mv.setViewName("myPage/academic");
		mv.addObject("profileId", profileId);
		mv.addObject("memId", memId);
		mv.addObject("mem", mem);
		mv.addObject("certiList", certiList);

		
		mv.setViewName("findMember/findPartCertificate");

		return mv;
	}
	
	// 평가 조회 페이지 이동
		@RequestMapping(value = "fpEval.do")
		public ModelAndView fpEval(
//				@RequestParam("profileId") int profileId, @RequestParam("memId") int memId,
				ModelAndView mv, HttpServletRequest request) {

			String id1 = request.getParameter("proId");
			int profileId = Integer.valueOf(id1);
			String id2 = request.getParameter("memId");
			int memId = Integer.valueOf(id2);
			System.out.println(memId);
			
			Member mem = fmService.selectMemNick(memId);
			
			ArrayList<PEvalView> PartEval = fmService.partEvalList(memId);
			System.out.println(PartEval);
			
//			PEvalView
			
			mv.addObject("profileId", profileId);
			mv.addObject("memId", memId);
			mv.addObject("mem", mem);
			mv.addObject("PartEval", PartEval);
			mv.setViewName("findMember/findPartEvaluation");

			return mv;
		}

		// 평가 등록 페이지 이동
		@RequestMapping(value = "fpEvalUp.do")
		public ModelAndView fpEvalUp(ModelAndView mv, HttpServletRequest request) {

			String id1 = request.getParameter("proId");
			int profileId = Integer.valueOf(id1);
			String id2 = request.getParameter("memId");
			int memId = Integer.valueOf(id2);
			System.out.println(memId);
			String id3 = request.getParameter("clientId");
			int clientId = Integer.valueOf(id3);
			
			Member mem = fmService.selectMemNick(memId);
			// 평가 프로젝트 id가져와야하는데?
			ArrayList<Project> project = fmService.projectList(clientId);
			System.out.println(project);
			
			mv.addObject("profileId", profileId);
			mv.addObject("memId", memId);
			mv.addObject("mem", mem);
			mv.addObject("project", project);
			mv.setViewName("findMember/findPartEvaluationUpdate");

			return mv;
		}
		
		
		// 평가 등록하기
		@RequestMapping(value="fpEvalInsert.do")
		public String fpEvalInsert(HttpServletRequest request, RedirectAttributes redirectAttributes) {
			
			String id1 = request.getParameter("proId");
			int profileId = Integer.valueOf(id1);
			String id2 = request.getParameter("memId");
			int memId = Integer.valueOf(id2);
			String id3 = request.getParameter("clientId");
			int clientId = Integer.valueOf(id3);
			
			// 클라이언트 번호
//			Member member = fmService.clientInfo(clientId);
//			System.out.println(member);
			
			// 클라이언트 번호로 프로젝트가져오기
			ArrayList<Project> project = fmService.projectList(clientId);			
			
			// 진행중인 프로젝트
			for(int a=0;a<project.size();a++) {
				ArrayList<ProjectProcess> pp = fmService.ppList(project.get(a).getProId());
				System.out.println(pp);
			}
			// 종료된 프로젝트(프로젝트Id랑 매칭 파트너스?)
			
			
			String proName = request.getParameter("projectName");
			String starAvg = request.getParameter("eAgv");
			int eAvg = Integer.valueOf(starAvg);
			String eContent = request.getParameter("content");
			String star1 = request.getParameter("eStar1");
			int eStar1 = Integer.valueOf(star1);
			String star2 = request.getParameter("eStar2");
			int eStar2 = Integer.valueOf(star2);
			String star3 = request.getParameter("eStar3");
			int eStar3 = Integer.valueOf(star3);
			String star4 = request.getParameter("eStar4");
			int eStar4 = Integer.valueOf(star4);
			String star5 = request.getParameter("eStar5");
			int eStar5 = Integer.valueOf(star5);
			
			Eval eval = new Eval(clientId,memId,3,eAvg,eContent,eStar1,eStar2,eStar3,eStar4,eStar5);
			
			redirectAttributes.addAttribute("profileId", profileId);
			redirectAttributes.addAttribute("memId", memId);
			
			return "redirect:fpEvalview.do";
		}
		
		// 가짜 평가 조회 페이지 이동
		@RequestMapping(value = "fpEvalview.do")
		public ModelAndView fpEvalview(
				@RequestParam("profileId") int profileId, @RequestParam("memId") int memId,
				ModelAndView mv, HttpServletRequest request) {

//			String id1 = request.getParameter("proId");
//			int profileId = Integer.valueOf(id1);
//			String id2 = request.getParameter("memId");
//			int memId = Integer.valueOf(id2);
//			System.out.println(memId);
			
			Member mem = fmService.selectMemNick(memId);
			
			ArrayList<PEvalView> PartEval = fmService.partEvalList(memId);
			System.out.println(PartEval);
			
			mv.addObject("profileId", profileId);
			mv.addObject("memId", memId);
			mv.addObject("mem", mem);
			mv.addObject("PartEval", PartEval);
			mv.setViewName("findMember/findPartEvaluation");

			return mv;
		}
	
}

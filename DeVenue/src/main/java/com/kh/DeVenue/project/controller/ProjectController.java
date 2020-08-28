package com.kh.DeVenue.project.controller;

import static com.kh.DeVenue.common.Pagination.getPageInfo;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.project.model.exception.ProjectException;
import com.kh.DeVenue.project.model.service.ProjectService;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectDetail;
import com.kh.DeVenue.project.model.vo.ProjectList;

import com.kh.DeVenue.project.model.vo.ProjectQuestion;
import com.kh.DeVenue.project.model.vo.Reply;
import com.kh.DeVenue.project.model.vo.Tech;

import static com.kh.DeVenue.common.Pagination.*;


@Controller
public class ProjectController {
@Autowired
ProjectService pService;
	@RequestMapping("addProject.do")
	public String projectAddView() {
		
		return "project/addProject";
	
	}
	
	
	@RequestMapping(value="proinsert.do", method=RequestMethod.POST)
	public String projectInsert(Project p, ProjectQuestion q, HttpServletRequest request,
								@RequestParam(value="proPlanPaper1",required=false)
								MultipartFile file) {
		System.out.println(p);
		System.out.println(q);
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String savePath = saveFile(file, request);
//			System.out.println("최종 저장 될 파일명을 포함한 경로 : " + savePath);
			if(savePath != null) {	// 파일이 잘 저장되어 경로가 반환 된다면..
				p.setProPlanPaper(file.getOriginalFilename());	
				
			}
		}
		
		int result = pService.addProject(p);
		int result1 =pService.addQuestion(q);
		
		
		if(result > 0) {
			return "redirect:addProject.do";
		}else {
			throw new ProjectException("프로젝트 등록 실패!");
		}
		
		// DB에 공지사항이 잘 들어갔으면 noticeListView.jsp로 가서
		// 별표시 수정하자
	}

	// 파일이 저장 될 경로를 설정하는 메소드
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\nuploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {	// webapp아래에 있는 resources 폴더 아래에
								// nuploadFiles가 없어서 File객체를 찾을 수 없다면
			folder.mkdirs();
			
		}
		
		String filePath = folder + "\\" + file.getOriginalFilename();
		// 실제 저장 될 파일의 경로 + 파일명
		
		try {
			file.transferTo(new File(filePath));
			// 이 상태로는 파일 업로드가 되지 않는다.
			// 왜냐면 파일 제한크기에 대한 설정을 주지 않았기 때문이다.
			// root-context.xml에 업로드 제한 파일 크기를 지정해 주자.
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return filePath;
	}
	
	@RequestMapping("check.do")
	public ModelAndView checkProjectList(ModelAndView mv) {
		ArrayList<Project> list = pService.selectList();
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.setViewName("project/checkingProjectList");
			
		}else {
			throw new ProjectException("검수중인 프로젝트 목록 조회 실패");
		}
		
		return mv;
		
	}
	
	
	
	@RequestMapping("underwayProjectList.do")
	public String projectUnderwayView() {
		
		return "project/underwayProjectList";
	}
	

	@RequestMapping("recruitProjectList.do")
	public String recruitProjectView() {
		
		return "project/recruitProjectList";
	}
	
	@RequestMapping("temporaryStoreList.do")
	public String temporaryStoreListView() {
		
		return "project/temporaryStoreList";
	}
	
	@RequestMapping("addFailProjectList.do")
	public String addFailProjectListView() {
		
		return "project/addFailProjectList";
	}
	
	@RequestMapping("endProjectList.do")
	public String endProjectListView() {
		
		return "project/endProjectList";
	}
	

	@RequestMapping("stopProjectList.do")
	public String stopProjectListView() {
		
		return "project/stopProjectList";
	}
	
	@RequestMapping("extendProjectList.do")
	public String extendProjectListView() {
		
		return "project/extendProjectList";
	}
	
	@RequestMapping("searchProjectList.do")
	public ModelAndView projectList(ModelAndView mv, @RequestParam(value="page",required=false) Integer page) {
	
		//페이지네이션 처리
		int currentPage=1;
		
		if(page!=null) {
			currentPage=page;
		}
		
		//페이징 처리를 위해 게시물 수 알아오기
		int listCount=pService.getListCount();
		
		//현재페이지+전체 게시물 수>>페이지네이션 정보 추출
		PageInfo pi=getPageInfo(currentPage, listCount);
		
		
		//게시물 가져오기
		ArrayList<ProjectList> list=pService.selectProjectList(pi);
		
		System.out.println("화면단 가기 전, 프로젝트 페이지네이션:"+pi);
		System.out.println("화면단 가기 전, 프로젝트 리스트:"+list);
		
		//프로젝트 기술 가져오기
		ArrayList<Tech> tech=pService.selectTechList();
		
		if(list!=null) {
			mv.addObject("list",list);
			mv.addObject("pi", pi);
			mv.addObject("tech", tech);
			mv.setViewName("project/find/findProjectListView");
			
		}else {
			throw new ProjectException("프로젝트 전체 조회 실패");
		}
	
		return mv;
		
	}
	
	@RequestMapping(value="searchProjectDetail.do")
	public ModelAndView projectDetail(ModelAndView mv,@ModelAttribute ProjectList project,@RequestParam(value="page", required=false) Integer page) {
		
		System.out.println("parameter 뭐 넘어왔나?"+project);
		//프로젝트 디테일 가져오기
		System.out.println(project);
		ProjectDetail detail=pService.selectProjectDetail(project.getId());
		
		// 클라이언트의 전체 프로젝트 수 
		ProjectDetail number=pService.selectAllNumber(detail.getProject().getMemId());
		detail.setAllProject(number.getAllProject());
		detail.setProcessProject(number.getProcessProject());
		detail.setCompleteProject(number.getCompleteProject());
		detail.setTotal(number.getTotal());
		detail.setEvalCount(number.getEvalCount());
		
		System.out.println("화면단 가기 전, 프로젝트 디테일:"+detail);
		
		//추천 프로젝트 리스트 가져오기
		ArrayList<ProjectList> candidate=pService.selectRecommend(project);
		System.out.println("화면단 가기 전, 추천 프로젝트 리스트"+candidate);
		
		
		mv.addObject("detail", detail);
		mv.addObject("candidate", candidate);
		mv.setViewName("project/find/findProjectDetailView");
		return mv;
		
	}
	
	@RequestMapping(value="addProjectReply.do", method=RequestMethod.POST)
	public void insertProjectReply(HttpServletResponse response,@ModelAttribute Reply r, @ModelAttribute Member m) throws IOException {
		
		
		r.setWriter(m);
		System.out.println("작성한 댓글?"+r);
		
		int result=pService.insertProjectReply(r);
		
		PrintWriter out=response.getWriter();
		
		System.out.println("댓글 입력 결과:"+result);
		
		if(result>0) {
			out.append("success");
			out.flush();
			out.close();
		}else {
			out.append("fail");
			out.flush();
			out.close();
		}
		
	}
	
	
	@RequestMapping(value="getProjectReply.do")
	public void getProjectReply(HttpServletResponse response, Integer pId) throws JsonIOException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		
		//질문 댓글 가져오기
		ArrayList<Reply> rpList=new ArrayList();
		rpList=pService.selectparentReply(pId);
		
		//답 댓글 가져오기
		ArrayList<Reply> rcList=new ArrayList();
		rcList=pService.selectchildReply(pId);
		
		ArrayList rList=new ArrayList();
		rList.add(rpList);
		rList.add(rcList);
		
		System.out.println("ajax로 댓글 불러오기:"+rList);
		
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(rList, response.getWriter());
		
		
	}
	
	@RequestMapping(value="updateProjectReply.do")
	public void updateProjectReply(HttpServletResponse response, @ModelAttribute Reply r,@ModelAttribute Member m) throws IOException {
		
		r.setWriter(m);
		System.out.println("수정한 댓글?:"+r);
		
		int result=pService.updateProjectReply(r);
		
		PrintWriter out=response.getWriter();
		
		if(result>0) {
			out.append("success");
			out.flush();
			out.close();
		}else {
			out.append("fail");
			out.flush();
			out.close();
		}
		
	}
	
	
	@RequestMapping(value = "deleteProjectReply.do")
	public void deleteProjectReply(HttpServletResponse response, @ModelAttribute Reply r) throws IOException {
		
		int result=0;
		PrintWriter out=response.getWriter();
		
		System.out.println("삭제하기 원하는 댓글:"+r);
		
		if(r.getrId()==r.getParentRId()) {
			//문의 댓글인 경우
			result=pService.deleteProjectReply(r);
			
		}else {
			//답변 댓글인 경우, 댓글 삭제 업데이트+ 문의 댓글의 답변 여부를 Y에서 N으로 수정 
			result=pService.deleteProjectReply(r);
			result+=pService.updateAnswerStatus(r);
		}
		
		
		if(result>0) {
			out.append("success");
			out.flush();
			out.close();
		}else {
			out.append("fail");
			out.flush();
			out.close();
		}
		
	}
	
	
	@RequestMapping(value="answerProjectReply.do")
	public void answerProjectReply(HttpServletResponse response,@ModelAttribute Reply r,@ModelAttribute Member m) throws IOException {
		
		r.setWriter(m);
		System.out.println("답변 댓글?:"+r);
		int result=0;
		PrintWriter out=response.getWriter();
		
		//답변 댓글을 작성
		result=pService.answerProjectReply(r);
		
		//부모 댓글의 답변 여부를 N에서 Y로 수정
		result+=pService.changeAnswerStatus(r);
		
		if(result>0) {
			out.append("success");
			out.flush();
			out.close();
		}else {
			out.append("fail");
			out.flush();
			out.close();
		}
		
	}

	
	@RequestMapping(value = "checkLikeNum.do")
	public void checkLikeNum(HttpServletResponse response, @RequestParam(value="pId") Integer pId, @RequestParam(value="memId") Integer memId) throws IOException {
		
		int likeNum=0;
		HashMap ids=new HashMap();
		ids.put("pId", pId);
		ids.put("memId",memId);
		System.out.println("관심 여부 확인 parameter:"+ids);
		likeNum=pService.checkLikeNum(ids);
		
		JSONObject like=new JSONObject();
		like.put("likeNum", likeNum);
		
		PrintWriter out=response.getWriter();
		out.print(like);
		out.flush();
		out.close();
		
	}
	
	@RequestMapping(value = "addLikeProject.do")
	public void addLikeProject(HttpServletResponse response,@RequestParam(value="pId") Integer pId, @RequestParam(value="memId") Integer memId) throws IOException {
		
		
		int result=0;
		HashMap ids=new HashMap();
		ids.put("pId",pId);
		ids.put("memId",memId);
		
		System.out.println("관심 등록하기 parameter"+ids);
		
		result=pService.addLikeProject(ids);
		
		PrintWriter out=response.getWriter();
		
		if(result>0) {
			out.append("success");
			out.flush();
			out.close();
		}else {
			out.append("fail");
			out.flush();
			out.close();
		}
		
	}
	
	@RequestMapping(value = "likeProjectList.do")
	public ModelAndView likeProjectList(HttpServletRequest request,ModelAndView mv, @RequestParam(value="page", required = false) Integer page) {
		
		//세션에서 로그인 유저의 정보를 가져와야 한다 (id)
		int memId=4;
		
		//페이지네이션
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		//전체 관심프로젝트 수
		int listCount=pService.getLikeListCount(memId);
		PageInfo pi=getPageInfo(currentPage, listCount);
		
		//프로젝트 리스트를 가져오자
		ArrayList<ProjectList> likeList=pService.selectLikeProject(memId,pi);
		
		System.out.println("화면단 가기전 관심 등록 리스트:"+likeList);
		
		mv.addObject("like", likeList);
		mv.addObject("pi", pi);
		mv.setViewName("partnerSubMenu/likeProjectView");
		
		return mv;
	}
	
	@RequestMapping(value = "deleteLikeProject.do")
	public void deleteLikeProject(HttpServletResponse response, @RequestParam(value = "lId") Integer lId) throws IOException {
		
		System.out.println("관심프로젝트 삭제 전:"+lId);
		
		PrintWriter out=response.getWriter();
		int result=0;
		result=pService.deleteLikeProject(lId);
		
	}
	
	@RequestMapping(value = "projectListTest.do")
	public ModelAndView projectListTest(ModelAndView mv) {
		
		mv.setViewName("project/find/findProjectFilterView");
		
		return mv;
	}
	
	@RequestMapping(value = "sortingProjectList.do")
	public ModelAndView sortingProjectList(HttpServletRequest request, ModelAndView mv,@RequestParam(value="page",required = false) Integer page) {
		
		String sorting=request.getParameter("sorting");
		System.out.println("정렬기준:"+sorting);
		System.out.println("정렬,현재페이지"+page);
		
		mv.setViewName("project/find/findProjectListView");
		return mv;
		
	}
	
	@RequestMapping(value="applyThisProject.do")
	public ModelAndView applyProjectDetail(ModelAndView mv, @RequestParam(value="pId") Integer pId) {
		
		//프로젝트 디테일 정보 가져오기
		ProjectDetail detail=pService.selectProjectDetail(pId);
		
		mv.addObject("detail", detail);
		mv.setViewName("project/apply/applyProjectDetailView");
		
		//로그인 유저의 포트폴리오 가져오기
		
		
		return mv;
	}

	
}



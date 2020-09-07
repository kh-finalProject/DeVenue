package com.kh.DeVenue.project.controller;

import static com.kh.DeVenue.common.Pagination.getPageInfo;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.kh.DeVenue.member.model.vo.Portfolio;
import com.kh.DeVenue.project.model.exception.ProjectException;
import com.kh.DeVenue.project.model.service.ProjectService;
import com.kh.DeVenue.project.model.vo.Application;
import com.kh.DeVenue.project.model.vo.ApplyAnswer;
import com.kh.DeVenue.project.model.vo.ApplyPortfolio;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectDetail;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;
import com.kh.DeVenue.project.model.vo.Reply;
import com.kh.DeVenue.project.model.vo.Tech;


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
								@RequestParam(value="proPlanPaper1",required=false) MultipartFile file,
								@RequestParam(value ="proAQContent",required=false) String[] proAQContent,
								@RequestParam(value ="proStartDate",required=false) String proStartDate,
								@RequestParam(value ="proDuration",required=false) int proDuration
								) throws ParseException {
								
	System.out.println("proStartDate= "+proStartDate);
	System.out.println("proDuaration =" +proDuration);
		
	Calendar cal = Calendar.getInstance();
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date date = null;
	
	
	try {
		date = df.parse(proStartDate);
	} catch (ParseException e) {
		
		e.printStackTrace();
	}
	cal.setTime(date);
	System.out.println("current: " + df.format(cal.getTime()));
	cal.add(Calendar.DATE, proDuration);
	String a = df.format(cal.getTime());
	Date date1 = df.parse(a);
	
	
	java.util.Date utilDate = date1;
	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	System.out.println("utilDate:" + utilDate);
	System.out.println("sqlDate : " +sqlDate);
	
	System.out.println("after :" + df.format(cal.getTime()));
		
	if(!file.getOriginalFilename().contentEquals("")) {
			String savePath = saveFile(file, request);
			
//			System.out.println("최종 저장 될 파일명을 포함한 경로 : " + savePath);

				if(savePath != null) {	// 파일이 잘 저장되어 경로가 반환 된다면..
			
					p.setProPlanPaper(file.getOriginalFilename());	
				p.setProPlanRePaper(savePath);
				
			}
		}
		

		System.out.println(p);	
		System.out.println(q);
		p.setProEndDate(sqlDate);
		int result = pService.addProject(p);
		for(int i =0; i<proAQContent.length; i++) {
			q.setProAQContent(proAQContent[i]);
			int result1 = pService.addQuestion(q);
		}
		System.out.println(p);			
		System.out.println(q);	
		 
	
		
		if(result > 0) {
			return "redirect:addProject.do";
		}else {
			throw new ProjectException("프로젝트 등록 실패!");
		}
		
		// DB에 공지사항이 잘 들어갔으면 noticeListView.jsp로 가서
		// 별표시 수정하자
	}
	
	
	@RequestMapping("temStoreList.do")
	public ModelAndView temStoreList(ModelAndView mv,@RequestParam(value ="memId") String memId
			
			) {
		int a = Integer.valueOf(memId);
		System.out.println("a:"+a);
		ArrayList<Project> list = pService.selectTemStoreList( a);
		
		System.out.println("임시저장 리스트"+list);
		if(!list.isEmpty()) {
			mv.addObject("list1",list);
			mv.setViewName("project/temporaryStoreList");
			
		}else {
			
		}
		
		return mv;
		
	}
	@RequestMapping(value="temStore.do", method=RequestMethod.POST)
	public String temStore(Project p, ProjectQuestion q, HttpServletRequest request,
								@RequestParam(value="proPlanPaper1",required=false)
								MultipartFile file,
								@RequestParam(value ="proAQContent",required=false) String[] proAQContent) {
	
	
		
		
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String savePath = saveFile(file, request);
//			System.out.println("최종 저장 될 파일명을 포함한 경로 : " + savePath);
			if(savePath != null) {	// 파일이 잘 저장되어 경로가 반환 된다면..
				p.setProPlanPaper(file.getOriginalFilename());	
				
			}
		}
		System.out.println(p);	
		int result = pService.temStoreProject(p);
		for(int i =0; i<proAQContent.length; i++) {
			q.setProAQContent(proAQContent[i]);
			int result1 = pService.addQuestion(q);
		}
		System.out.println(p);			
		System.out.println(q);	
		
	
		
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
		
		String savePath = root + "\\puploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {	// webapp아래에 있는 resources 폴더 아래에
								// nuploadFiles가 없어서 File객체를 찾을 수 없다면
			folder.mkdirs();
			
		}
		
		// 공지글은 파일명 중복 제거는 신경쓰지 않고 했지만
		// 게시판에서는 파일명을 날짜(업로드 시간)로 rename 해보자
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName
			= sdf.format(new java.sql.Date(System.currentTimeMillis()))
			 + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		
		String filePath = folder + "\\" + renameFileName;
		// 실제 저장 될 파일의 경로 + rename 파일명
		
		try {
			file.transferTo(new File(filePath));
			// 이 상태로는 파일 업로드가 되지 않는다.
			// 왜냐면 파일 제한크기에 대한 설정을 주지 않았기 때문이다.
			// root-context.xml에 업로드 제한 파일 크기를 지정해 주자.
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	@RequestMapping("checkList.do")
	public ModelAndView checkProjectList(ModelAndView mv, @RequestParam(value ="memId" ,required= false) String memId
			
			) {
		
	  
		System.out.println("진입");
		int a = Integer.valueOf(memId);
		System.out.println("memId?" +memId);
		ArrayList<Project> list = pService.selectCheckList(memId);
		
		System.out.println("검수 리스트"+list);
		if(!list.isEmpty()) {
			mv.addObject("list1",list);
			mv.setViewName("project/checkingProjectList");
			
		}else {
			
		}
		 
		return mv;
		
	}
	

	@RequestMapping("proUpdateForm.do")
	public String projectUpdateView(int proId, Model model, @RequestParam(value ="proAQContent",required=false) String[] proAQContent) {
		System.out.println(model);
		System.out.println(proId);
		
		ArrayList<ProjectQuestion> list = pService.getQuestion(proId);
		System.out.println(list);
		model.addAttribute("p", pService.selectOne(proId));
		model.addAttribute("q",list);
		System.out.println(model);
		
		
		return "project/updateProjectForm";
	}
	
	@RequestMapping("proUpdate.do")
	public ModelAndView proUpdate(ModelAndView mv,  Project p, ProjectQuestion q ,RedirectAttributes redirectAttributes,
									HttpServletRequest request, 
									
									@RequestParam(value ="proAQContent",required=false) String[] proAQContent,
									@RequestParam(value="proPlanPaper1", required=false)
									MultipartFile file,
									
									@RequestParam(value ="proStartDate",required=false) String proStartDate,
									@RequestParam(value ="proDuration",required=false) int proDuration) throws ParseException {
	   int a =p.getMemId();
		   redirectAttributes.addAttribute("memId", a);
		System.out.println("mv"+mv);
		String renameFileName="";
		// 기존의 파일이 input hidden으로 와서 매개변수의 Board 객체에 담김
		// 그럼 그걸 가지고 기존의 파일을 삭제하자
		if(!file.getOriginalFilename().equals("")) {	// 새로 올린 파일이 있느냐
			if(p.getProPlanPaper() != null) {		// 기존의 파일이 있느냐(hidden)
				deleteFile(p.getProPlanPaper(), request);
				// deleteFile메소드는 NoticeController에 만들었으니 아래에 복붙해서
				// 폴더명만 수정하자
			}
			renameFileName = saveFile(file, request);
		}
		
		// 위에 만든 saveFile메소드를 활용해서 새로 사용자가 수정하려고 올린 파일의
		// 파일명을 바꾸고 buploadFiles폴더에 저장하자.
		
		// Board객체에 새로 올린 파일명을 담고(원본 및 변경한 것 둘다) DB를 다녀오자(update)

			p.setProPlanPaper(file.getOriginalFilename());
			p.setProPlanRePaper(renameFileName);
			Calendar cal = Calendar.getInstance();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			
			Calendar cal1 = Calendar.getInstance();
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date2 = null;
			try {
				date = df.parse(proStartDate);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
			cal1.setTime(date);
			System.out.println("current: " + df.format(cal1.getTime()));
			cal1.add(Calendar.DATE, proDuration);
			String b = df.format(cal1.getTime());
			Date date1 = df.parse(b);
			
			System.out.println("cal"+cal);
			java.util.Date utilDate = date1;
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			System.out.println("utilDate:" + utilDate);
			System.out.println("sqlDate : " +sqlDate);
			
			p.setProEndDate(sqlDate);
		System.out.println("보자 :"+p);
		int result = pService.updateProject(p);
		
		
		
		for(int i =0; i<proAQContent.length; i++) {
			q.setProAQContent(proAQContent[i]);
			int result1 = pService.updateQuestion(q);
		}
		
		if(result > 0) {
			mv.setViewName("redirect:checkList.do");
		
		
		}else {
			throw new ProjectException("게시글 수정 실패!!");
		}
		
		return mv;
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = 
			request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nuploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("proDelete.do")
	public String proDelete(Integer proId, HttpServletRequest request) {
		
		// 게시글을 삭제하기 전에 기존의 파일을 지운다.
		Project p = pService.selectOne(proId);
		
		if(p.getProPlanPaper() != null) {
			deleteFile(p.getProPlanRePaper(), request);
			
		}
		
		// 게시글 삭제하기
		int result1 = pService.deleteQuestion(proId);
		int result = pService.deleteProject(proId);
		
		if(result > 0) {
			return "redirect:checkList.do";
		}else {
			throw new ProjectException("게시물 삭제 실패!");
		}
	}
	
	@RequestMapping("recruitProjectList.do")
	public ModelAndView recruitProjectList(ModelAndView mv
			) {
		ArrayList<Project> list = pService.selectrecruitList();
		/* ArrayList<Member> list2 = pService.selectrecruitMember(memId); */
		System.out.println(list);
		if(!list.isEmpty()) {
			mv.addObject("list1",list);
			mv.setViewName("project/recruitProjectList");
			
		}else {
			mv.setViewName("project/recruitProjectList");
		}
		
		return mv;
		
	}
	
	@RequestMapping("endProjectList.do")
	public ModelAndView endProjectList(ModelAndView mv) {
		ArrayList<Project> list = pService.selectendList();
		System.out.println(list);
		if(!list.isEmpty()) {
			mv.addObject("list1",list);
			mv.setViewName("project/endProjectList");
			
		}else {
			mv.setViewName("project/endProjectList");
		}
		
		return mv;
		
	}
	
	
	@RequestMapping("underwayProjectList.do")
	public ModelAndView underwayProjectList(ModelAndView mv, @RequestParam(value ="memId") String memId) {
		int memId1 = Integer.valueOf(memId);
		ArrayList<Project> list = pService.selectunderwayList(memId1);
		System.out.println(list);
		if(!list.isEmpty()) {
			mv.addObject("list1",list);
			mv.setViewName("project/underwayProjectList");
			
		}else {
			mv.setViewName("project/underwayProjectList");
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
		mv.setViewName("project/findProjectDetailView");
		return mv;
		
	}



	
	@RequestMapping("addFailProjectList.do")
	public String addFailProjectListView() {
		
		return "project/addFailProjectList";
		
		
		
		
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
		
		mv.addObject("page",page);
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
		Member loginUser=(Member)request.getSession().getAttribute("loginUser");
		int memId=loginUser.getMemId();
		
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
	
	
	
	@RequestMapping(value="applyThisProject.do")
	public ModelAndView applyProjectDetail(HttpServletRequest request,ModelAndView mv, @RequestParam(value="pId") Integer pId, @RequestParam(value="page") Integer page) {
		
		//프로젝트 디테일 정보 가져오기
		ProjectDetail detail=pService.selectProjectDetail(pId);
		
		mv.addObject("detail", detail);
		mv.setViewName("project/apply/applyProjectDetailView");
		
		//로그인 유저의 포트폴리오 가져오기
		int memId=((Member)(request.getSession().getAttribute("loginUser"))).getMemId();
		ArrayList<Portfolio> pf=pService.selectPortfolio(memId);
		System.out.println("화면단 가기 전, 지원 포트폴리오:"+pf);
		
		mv.addObject("page", page);
		mv.addObject("pofol", pf);
		
		return mv;
	}
	
	@RequestMapping(value="findPortfolio.do")
	public void findPortfolio(HttpServletRequest request,HttpServletResponse response, @RequestParam(value="mCate",required=false) String mCate,@RequestParam(value="dCate",required=false) String dCate) throws JsonIOException, IOException {
		
		response.setContentType("application/json;charset=utf-8");
		
		Member loginUser=(Member)request.getSession().getAttribute("loginUser");
		int memId=loginUser.getMemId();
		
		HashMap cate=new HashMap();
		cate.put("mCate",mCate);
		cate.put("dCate",dCate);
		cate.put("memId",memId);
		
		
		ArrayList<Portfolio> pf=pService.findPortfolio(cate);
		
		System.out.println("화면단 가기 전, 카테고리 검색한 포트폴리오"+pf);
		
		
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(pf, response.getWriter());
		
		
		
	}
	
	
	@RequestMapping(value = "notifyFileSize.do")
	public void notifyFileSize(HttpServletResponse response, @RequestParam(value = "file",required = false) MultipartFile file) throws IOException {
		
		String name=file.getOriginalFilename();
		Long size=file.getSize();
		System.out.println("업로드한 이력서 이름?"+name);
		System.out.println("업로드한 이력서 크기?"+size);
		
		JSONObject result=new JSONObject();
		result.put("size", size);
		
		PrintWriter out=response.getWriter();
		out.print(result);
		out.flush();
		out.close();
		
		
	}
	
	
	@RequestMapping(value = "submitApplication.do")
	public ModelAndView submitApplication(HttpServletRequest request,ModelAndView mv,@ModelAttribute Application application,
			@RequestParam(value="aqId", required=false) Integer[] aqId,@RequestParam(value="aaContent",required=false) String[] aaContent,
			@RequestParam(value="resume",required=false) MultipartFile resume,
			@RequestParam(value="portId",required=false) Integer[] portId,@RequestParam(value="portContent",required=false) String portContent) throws IllegalStateException, IOException {
		
		//이력서를 저장하자
		if(resume!=null) {
			String renamedResume=saveResume(resume,request);
			application.setOriginalResume(resume.getOriginalFilename());
			application.setReNameResume(renamedResume);
		}
		
		//지원서를 insert
		
		//세션 로그인유저를 set
		Member loginUser=(Member)request.getSession().getAttribute("loginUser");
		application.setPartner(loginUser);
		
		
	
		
		//답변을 set
		ArrayList<ApplyAnswer> answer=new ArrayList<>();
		
		if(aqId!=null) {
		
		for(int i=0;i<aqId.length;i++) {
			ApplyAnswer a=new ApplyAnswer();
			a.setAqId(aqId[i]);
			a.setAaContent(aaContent[i]);
			answer.add(a);
		}
		
		application.setAnswer(answer);
		
		}
		
		System.out.println("지원서 insert 전, 지원서:"+application);
		
		int result1=0;
		int result2=0;
		int result3=0;
		
		result1=pService.addApplication(application);
		
		//지원서가 성공적으로 insert되었다면 지원답변을 들록한다.
		if(result1>0) {
			
			//지원답변이 있을 경우,
			if(aqId!=null) {
			for(int i=0;i<aqId.length;i++) {
			result2=pService.addApplyAnswer(application.getAnswer().get(i));
			}
			}
			
		}
		
		
		
		ArrayList<ApplyPortfolio> pofo=new ArrayList<>();
		//지원 포트폴리오도 insert한다
		
		if(portId!=null) {
		
		for(int i=0;i<portId.length;i++) {
			
			ApplyPortfolio ap=new ApplyPortfolio();
			ap.setPortId(portId[i]);
			ap.setApContent(portContent);
			
			pofo.add(ap);
		}
		
		application.setPortfolio(pofo);
		
		}
		
		//지원서가 insert가 되었다면, portfolio를 등록한다.
		if(result1>0) {
			
			//지원 포트폴리오가 있는 경우
			if(portId!=null) {
			for(int i=0;i<portId.length;i++) {
			result3=pService.addApplyPofol(application.getPortfolio().get(i));
			}
			
			}
		}
		
		
		
		//임시저장 되었던 파일은 삭제한다.
		int deleteTemp=pService.deleteTempApplication(application);
		
		System.out.println("지원서 결과확인, 1:"+result1+",2:"+result2+",3:"+result3+"deleteTemp:"+deleteTemp);
		
		//지원한 프로젝트 리스트 서브메뉴로 이동하기 위해 다른 컨트롤러로 간다.
		mv.setViewName("redirect:selectApplyProject.do");
		return mv;
	}


	private String saveResume(MultipartFile resume, HttpServletRequest request) throws IllegalStateException, IOException {
		
		String root=request.getSession().getServletContext().getRealPath("resources");
		String saveDir=root+"\\resume";
		File folder=new File(saveDir);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmss");
		String originName=resume.getOriginalFilename();
		String rename=format.format(new Date(System.currentTimeMillis()))+"."
				+originName.substring(originName.lastIndexOf(".")+1);
		
		String path=folder+"\\"+rename;
		
		resume.transferTo(new File(path));
		
		return rename;
	}
	
	@RequestMapping(value = "selectApplyProject.do")
	public ModelAndView selectApplyProject(HttpServletRequest request,ModelAndView mv,@RequestParam(value = "page", required = false) Integer page) {
		
		//세션에서 로그인 유저의 정보를 가져와야 한다 (id)
		Member loginUser=(Member)request.getSession().getAttribute("loginUser");
		int memId=loginUser.getMemId();
				
		//페이지네이션
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
				
		//전체 지원 프로젝트 수
		int listCount=pService.getapplyListCount(memId);
		PageInfo pi=getPageInfo(currentPage, listCount);
				
		//프로젝트 리스트를 가져오자
		ArrayList<ProjectList> applyList=pService.selectApplyProject(memId,pi);
				
		System.out.println("화면단 가기전 지원 프로젝트 리스트:"+applyList);
		
		mv.addObject("apply", applyList);
		mv.addObject("pi", pi);
		
		mv.setViewName("partnerSubMenu/appliedProjectView");
		return mv;
	}
	
	
	@RequestMapping(value = "saveTempApplication.do")
	public void saveTempApplication(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="pId", required=false) Integer pId,
			@RequestParam(value="aPayment", required=false) Integer aPayment,
			@RequestParam(value="aDuration", required=false) Integer aDuration,
			@RequestParam(value="aContent", required=false) String aContent,
			@RequestParam(value="aqId", required=false) Integer[] aqId,
			@RequestParam(value="aaContent",required=false) String[] aaContent,
			@RequestParam(value="resume",required=false) MultipartFile resume,
			@RequestParam(value="portId",required=false) Integer[] portId,
			@RequestParam(value="portContent",required=false) String portContent) throws IllegalStateException, IOException {
		
		System.out.println("임시저장 컨트롤러에 진입!");
		
		//최종 결과
		int result=0;
		
		//이미 저장된 임시저장 row가 있는지 확인한다.
		HashMap application =new HashMap();
		int memId=((Member)(request.getSession().getAttribute("loginUser"))).getMemId();
		
		application.put("memId", memId);
		application.put("pId",pId);
		application.put("aPayment", aPayment);
		application.put("aDuration",aDuration);
		application.put("aContent", aContent);
		
		int count=pService.getTempSave(application);
		
		
			
			
			String reNameResume="";
			String originalResume="";
			//이력서를 저장하자
			if(resume!=null) {
				reNameResume=saveResume(resume,request);
				originalResume=resume.getOriginalFilename();
			}
			
			application.put("reNameResume",reNameResume);
			application.put("originalResume",originalResume);
			
			
			//답변 리스트
			ArrayList<ApplyAnswer> answer=new ArrayList<>();
			
			if(aqId!=null&&aaContent!=null) {
			
			for(int i=0;i<aaContent.length;i++) {
				ApplyAnswer a=new ApplyAnswer();
				a.setAqId(aqId[i]);
				a.setAaContent(aaContent[i]);
				answer.add(a);
			}
			
			}
			
			application.put("answer",answer);
			
			
			//지원 포트폴리오 list
			ArrayList<ApplyPortfolio> pofo=new ArrayList<>();
			if(portId!=null) {
			
			for(int i=0;i<portId.length;i++) {
				
				ApplyPortfolio ap=new ApplyPortfolio();
				ap.setPortId(portId[i]);
				ap.setApContent(portContent);
				
				pofo.add(ap);
			}
			
			}
			
			application.put("portfolio",pofo);
			
			System.out.println("임시 저장 전 지원서:"+application);
			
			
			//이미 저장된 지원서가 있는지 여부에 따라 2가지 선택
			
			if(count>0) {
				//update 이미 저장된 지원서가 있다면, 기존의 임시 저장 파일에 업데이트
				int result1=0;
				int result2=0;
				int result3=0;
				int result4=0;
				
				//임시저장 파일 아이디를 알아내자
				int aId=pService.selectTempId(application);
				application.put("aId", aId);
				
				//업로드 된 이력서와 기존에 저장된 이력서의 이름을 비교하자
				Application a=pService.selectTempResume(aId);
				if(resume!=null) {
					if(resume.getOriginalFilename()!=a.getOriginalResume()) {
						//사용자가 이전과 다른 파일을 업로드 했다면 기존에 올렸던 이력서를 삭제한다.
						
						//이전에 업로드 했다면,
						if(a.getOriginalResume()!=null) {
						deleteResume(a.getReNameResume(),request);
						}
					}
					
				}
				
				//임시저장 파일 아이디를 참조하여 업데이트 한다.
				result1=pService.updateTempApplication(application);
				
				//답변을 업데이트 하기 전, 기존의 답변이 있는지 확인한다.
				int answerCount=0;
				if(!answer.isEmpty()) {
				for(int i=0;i<answer.size();i++) {
					
					answer.get(i).setaId(aId);
					application.put("answer", answer.get(i));
					answerCount=pService.isAnswerExist(application);
					
					if(answerCount>0) {
						//기존 답변이 존재한다면 update
						result2=pService.updateTempAnswer(application);
						
					}else {
						//새 답변을 insert
						result2=pService.addTempApplyAnswer(answer.get(i));
					}
					
					
				}
				}
				
				//포트폴리오 업데이트 하기 전, 기존에 등록한 포트폴리오가 있는지 확인한다.
				int pofoCount=0;
				if(!pofo.isEmpty()) {
					
						pofoCount=pService.isPofoExist(application);
						
						if(pofoCount>0) {
							//답변과 달리 포트폴리오는 업데이트하지 않고 delete한다.
							result3=pService.deleteExistPofo(application);
						}
						
						
							//포트폴리오 리스트를 넣는다.
							for(int i=0;i<pofo.size();i++) {
								pofo.get(i).setProAId(aId);
								result4=pService.addTempApplyPofol(pofo.get(i));
							}
						
				}
				
				System.out.println("임시 저장 업데이트 결과,1:"+result1+",2:"+result2+",3:"+result3+",4:"+result4);
				result=result1+result2+result3+result4;
				
				
			}else {
				
				//기존에 임시저장된 지원서가 없다면, insert
				int result1=0;
				int result2=0;
				int result3=0;
				
				//지원서를 저장하고
				result1=pService.addTempApplication(application);
				
				//답변을 저장하고
				if(result1>0) {
					
					//지원답변이 있을 경우,
					if(aqId!=null) {
					for(int i=0;i<aqId.length;i++) {
					result2=pService.addApplyAnswer(answer.get(i));
					}
					}
					
					
				}
				
				//포트폴리오를 저장하고
				if(result1>0) {
					
					//지원 포트폴리오가 있는 경우
					if(portId!=null) {
					for(int i=0;i<portId.length;i++) {
					result3=pService.addApplyPofol(pofo.get(i));
					}
					
					}
					
				}
				
				
				System.out.println("새 임시저장 결과확인, 1:"+result1+",2:"+result2+",3:"+result3);
				result=result1+result2+result3;
			}
			
			
			
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


	private void deleteResume(String reNameResume, HttpServletRequest request) {
		
		String root=request.getSession().getServletContext().getRealPath("resources");
		String saveDir=root+"\\resume";
		File f=new File(saveDir+"\\"+reNameResume);
		
		if(f.exists()) {
			f.delete();
		}
		
	}
	
	
	@RequestMapping(value="selectTempApplicationList.do")
	public ModelAndView tempApplicationList(HttpServletRequest request,ModelAndView mv,@RequestParam(value = "page", required = false) Integer page) {
		
				
		//세션에서 로그인 유저의 정보를 가져와야 한다 (id)
		Member loginUser=(Member)request.getSession().getAttribute("loginUser");
		int memId=loginUser.getMemId();
						
		//페이지네이션
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
			}
						
		//전체 지원 프로젝트 수
		int listCount=pService.getTempApplyListCount(memId);
		PageInfo pi=getPageInfo(currentPage, listCount);
						
		//프로젝트 리스트를 가져오자
		ArrayList<ProjectList> applyList=pService.selectTempApplyProject(memId,pi);
						
		System.out.println("화면단 가기전 임시 저장된 지원 프로젝트 리스트:"+applyList);
				
		mv.addObject("apply", applyList);
		mv.addObject("pi", pi);
				
		mv.setViewName("partnerSubMenu/TempAppliedProjectView");
		return mv;
	}
	
	
	@RequestMapping(value="loadTempApplication.do")
	public ModelAndView loadTempApplication(HttpServletRequest request,ModelAndView mv,@RequestParam(value="pId") Integer pId, @RequestParam(value="aId") Integer aId, @RequestParam(value="page") Integer page) {
		//프로젝트 디테일 정보 가져오기
		ProjectDetail detail=pService.selectProjectDetail(pId);
				
		mv.addObject("detail", detail);
		mv.setViewName("project/apply/completeTempApplicationView");
				
		//로그인 유저의 포트폴리오 가져오기
		int memId=((Member)(request.getSession().getAttribute("loginUser"))).getMemId();
		ArrayList<Portfolio> pf=pService.selectPortfolio(memId);
		
		
		//임시저장된 지원서(포트폴리오,답변 포함) 가져오기
		Application application=pService.selectTempApplication(aId);
		mv.addObject("app", application);
				
		mv.addObject("page", page);
		mv.addObject("pofol", pf);
		
		
		return mv;
	}
	
	
	@RequestMapping(value = "cancelThisApply.do")
	public ModelAndView cancelThisApply(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="aId") Integer aId) {
		
		
		int result=pService.cancelThisApply(aId);
		
		
		mv.addObject("page", page);
		mv.setViewName("redirect:selectApplyProject.do");
		return mv;
	}
	
	
	@RequestMapping(value = "cancelThisTempApply.do")
	public ModelAndView cancelThisTempApply(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page,
			@RequestParam(value="aId") Integer aId) {
		
		
		int result=pService.cancelThisTempApply(aId);
		mv.addObject("page", page);
		mv.setViewName("redirect:selectTempApplicationList.do");
		
		
		
		
		if(result>0) {
			
			return mv;
		}else {
			throw new ProjectException("임시 저장 지원서 삭제 실패!");
		}
		
	}
	


}


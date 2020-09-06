package com.kh.DeVenue.project.controller;

import static com.kh.DeVenue.common.Pagination.getPageInfo;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
//	@RequestMapping("proUpdateForm.do" )
//	public ModelAndView boardUpdateView(ModelAndView mv, Integer proId ,Project p, @RequestParam("page") Integer page
//										) {
//		mv.addObject("project",pService.getUpdateForm(proId)).addObject("currentPage",page).setViewName("project/updateProjectForm");
//			System.out.println("mv"+mv);
//			System.out.println("proId"+proId);
//		return mv;
//	}
	
//	@RequestMapping("proUpdateForm.do")
//	public String projectUpdateView(int proId, Model model) {
//		System.out.println(model);
//		System.out.println(proId);
//		
//		ArrayList<Project> list = pService.selectCheckList();
//		model.addAttribute("p", pService.selectOne(proId));
//		model.addAttribute("q", pService.getQuestion(proId));
//		System.out.println(model);
//		
//		
//		return "project/updateProjectForm";
//	}
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
			mv.setViewName("project/findProjectListView");
			
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
		mv.setViewName("project/findProjectDetailView");
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
	public void checkLikeNum(HttpServletResponse response, @RequestParam(value="pId") Integer pId, @RequestParam(value="memId") Integer memId) {
		
		int likeNum=0;
		likeNum=pService.checkLikeNum(pId,memId);
	}


}



package com.kh.DeVenue.project.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.DeVenue.project.model.exception.ProjectException;
import com.kh.DeVenue.project.model.service.ProjectService;
import com.kh.DeVenue.project.model.vo.Project;

@Controller
public class ProjectController {
@Autowired
ProjectService pService;
	@RequestMapping("addProject.do")
	public String projectAddView() {
		
		return "project/addProject";
	
	}
	
	
	@RequestMapping(value="pinsert.do", method=RequestMethod.POST)
	public String noticeInsert(Project p, HttpServletRequest request,
								@RequestParam(name="uploadFile",required=false)
								MultipartFile file) {
		
		
		if(!file.getOriginalFilename().contentEquals("")) {
			String savePath = saveFile(file, request);
//			System.out.println("최종 저장 될 파일명을 포함한 경로 : " + savePath);
			if(savePath != null) {	// 파일이 잘 저장되어 경로가 반환 된다면..
				p.setProPlanPaper(file.getOriginalFilename());
			}
		}
		
		int result = pService.addProject(p);
		
		if(result > 0) {
			return "redirect:plist.do";
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
	
	@RequestMapping("plist.do")
	public ModelAndView projectList(ModelAndView mv, @RequestParam(value="page",required=false) Integer page) {
	
		//페이지네이션 처리
		int currentPage=1;
		
		if(page!=null) {
			currentPage=page;
		}
		
		//페이징 처리를 위해 게시물 수 알아오기
		int listCount=pService.getListCount();
	
		
		
		mv.setViewName("project/projectListView");
		
		return mv;
		
	}
}



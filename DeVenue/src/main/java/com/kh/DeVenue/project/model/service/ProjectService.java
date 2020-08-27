package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;


public interface ProjectService {

	int addProject(Project p);

	
	ArrayList<Project> selectCheckList();

	int getListCount();

	ArrayList<ProjectList> selectProjectList(PageInfo pi);

	int addQuestion(ProjectQuestion q);


	ArrayList<Project> selectunderwayList();


	ArrayList<Project> selectrecruitList();


	ArrayList<Project> selectendList();








	


}

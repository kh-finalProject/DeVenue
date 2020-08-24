package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectDetail;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;
import com.kh.DeVenue.project.model.vo.Tech;


public interface ProjectService {

	int addProject(Project p);

	ArrayList<Project> selectList();

	int getListCount();

	ArrayList<ProjectList> selectProjectList(PageInfo pi);

	int addQuestion(ProjectQuestion q);

	ArrayList<Tech> selectTechList();

	ProjectDetail selectProjectDetail(int id);

	ProjectDetail selectAllNumber(int memId);

	ArrayList<ProjectList> selectRecommend(ProjectList project);


	


}

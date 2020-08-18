package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.project.model.dao.ProjectDao;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectList;

@Service("proService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	ProjectDao proDao;

	@Override
	public int addProject(Project p) {
		
		return proDao.addProject(p);
	}

	@Override
	public ArrayList<Project> selectList() {
		// TODO Auto-generated method stub
		return proDao.selectList();
	}

	@Override
	public int getListCount() {
		
		return proDao.getListCount();
	}

	@Override
	public ArrayList<ProjectList> selectProjectList(PageInfo pi) {
		
		return proDao.selectProjectList(pi);
	}
	

}

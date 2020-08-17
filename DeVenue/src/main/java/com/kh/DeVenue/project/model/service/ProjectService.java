package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.project.model.vo.Project;

public interface ProjectService {

	int addProject(Project p);

	ArrayList<Project> selectList();


}

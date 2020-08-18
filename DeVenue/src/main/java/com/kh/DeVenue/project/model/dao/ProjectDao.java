package com.kh.DeVenue.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.SQLErrorCodes;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.project.model.vo.Project;

@Repository("proDao")
public class ProjectDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int addProject(Project p) {
		
		return sqlSessionTemplate.insert("projectMapper.addProject",p);
		
	}

	public ArrayList<Project> selectList() {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectList");
		return list;
	}

	public int getListCount() {
		
		return sqlSessionTemplate.selectOne("projectMapper.getListCount");
	}

}

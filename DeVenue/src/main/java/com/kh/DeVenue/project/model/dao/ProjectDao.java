package com.kh.DeVenue.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.SQLErrorCodes;
import org.springframework.stereotype.Repository;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;


 
@Repository("proDao")
public class ProjectDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int addProject(Project p) {
		
		return sqlSessionTemplate.insert("projectMapper.addProject",p);
		
	}

	
	public int getListCount() {
		
		return sqlSessionTemplate.selectOne("projectMapper.getListCount");
	}

	public ArrayList<ProjectList> selectProjectList(PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getProjectList", null, rowBounds);
	}


	public int addQuestion(ProjectQuestion q) {
		
		return sqlSessionTemplate.insert("projectMapper.addQuestion",q);
	}

	public ArrayList<Project> selectCheckList() {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectCheckList");
		return list;
	}


	public ArrayList<Project> selectunderwayList() {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectunderwayList");
		return list;
	}


	public ArrayList<Project> selectrecruitList() {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectrecruitList");
		return list;
	}


	public ArrayList<Project> selectendList() {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectendList");
		return list;
	}





}

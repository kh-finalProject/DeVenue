package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.project.model.dao.ProjectDao;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectDetail;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;
import com.kh.DeVenue.project.model.vo.Reply;
import com.kh.DeVenue.project.model.vo.Tech;

@Service("proService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	ProjectDao proDao;

	@Override
	public int addProject(Project p) {
		
		return proDao.addProject(p);
	}



	@Override
	public int getListCount() {
		
		return proDao.getListCount();
	}

	@Override
	public ArrayList<ProjectList> selectProjectList(PageInfo pi) {
		
		return proDao.selectProjectList(pi);
	}

	@Override
	public int addQuestion(ProjectQuestion q) {
		
		return  proDao.addQuestion(q);
	}

	@Override
	public ArrayList<Project> selectCheckList() {
		
		return proDao.selectCheckList();

	}



	@Override
	public ArrayList<Project> selectunderwayList() {
		
		return proDao.selectunderwayList();
	}



	@Override
	public ArrayList<Project> selectrecruitList() {
		
		return proDao.selectrecruitList();
	}



	@Override
	public ArrayList<Project> selectendList() {
		// TODO Auto-generated method stub
		return proDao.selectendList();
	}



	@Override
	public ArrayList<Tech> selectTechList() {
		return proDao.selectTechList();
	}



	@Override
	public ProjectDetail selectProjectDetail(int id) {
		return proDao.selectProjectDetail(id);
	}



	@Override
	public ProjectDetail selectAllNumber(int memId) {
		return proDao.selectAllNumber(memId);
	}



	@Override
	public ArrayList<ProjectList> selectRecommend(ProjectList project) {
		return proDao.selectRecommend(project);
	}



	@Override
	public int insertProjectReply(Reply r) {
		return proDao.insertProjectReply(r);
	}



	@Override
	public ArrayList<Reply> selectparentReply(int pId) {
		return proDao.selectparentReply(pId);
	}



	@Override
	public ArrayList<Reply> selectchildReply(int pId) {
		return proDao.selectchildReply(pId);
	}



	@Override
	public int updateProjectReply(Reply r) {
		return proDao.updateProjectReply(r);
	}



	@Override
	public int deleteProjectReply(Reply r) {
		return proDao.deleteProjectReply(r);
	}



	@Override
	public int updateAnswerStatus(Reply r) {
		return proDao.updateAnswerStatus(r);
	}



	@Override
	public int answerProjectReply(Reply r) {
		return proDao.answerProjectReply(r);
	}



	@Override
	public int changeAnswerStatus(Reply r) {
		return proDao.changeAnswerStatus(r);
	}



	@Override
	public int checkLikeNum(Integer pId, Integer memId) {
		return proDao.checkLikeNum(pId,memId);
	}
	


}

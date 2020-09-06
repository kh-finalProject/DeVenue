package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.dao.MemberDao;
import com.kh.DeVenue.member.model.vo.Member;
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
	public ArrayList<Project> selectCheckList(String memId) {
		
		return proDao.selectCheckList(memId);

	}



	@Override
	public ArrayList<Project> selectunderwayList(int memId1) {
		
		return proDao.selectunderwayList(memId1);
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



	@Override
	public int temStoreProject(Project p) {
		
		return proDao.temStoreProject(p);
	}



	@Override
	public int temStoreQuestion(ProjectQuestion q) {
		
		return proDao.temStoreQuestion(q);
	}






	



//	@Override
//	public ProjectQuestion getQuestion(int proId) {
//		
//		return proDao.getQuestion(proId);
//	}



	@Override
	public int getUpdateForm(Integer proId) {
		// TODO Auto-generated method stub
		return 0;
	}






	@Override
	public ArrayList<ProjectQuestion> getQuestion(int proId) {
	
		return proDao.getQuestion(proId);
	}



	@Override
	public Project selectOne(int proId) {
		
		return proDao.selectOne(proId);
	}



	@Override
	public int updateProject(Project p) {
	
		return proDao.updateProject(p);
	}



	@Override
	public int updateQuestion(ProjectQuestion q) {

		return proDao.updateQuestion(q);
	}



	@Override
	public ArrayList<Member> selectrecruitMember() {

		return proDao.selectrecruitMember();
	}



	@Override
	public int deleteProject(Integer proId) {
		
		return proDao.deleteProject(proId);
	}



	@Override
	public int deleteQuestion(Integer proId) {
	
		return proDao.deleteQuestion(proId);
	}



	@Override
	public ArrayList<Project> selectTemStoreList(int a) {

		return proDao.selectTemStore(a);
	}









	

}

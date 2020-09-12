package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.DeVenue.member.model.dao.MemberDao;
import com.kh.DeVenue.member.model.vo.CPeval;
import com.kh.DeVenue.member.model.vo.Member;

import com.kh.DeVenue.member.model.vo.Portfolio;
import com.kh.DeVenue.myPage.model.vo.Eval;
import com.kh.DeVenue.project.model.dao.ProjectDao;
import com.kh.DeVenue.project.model.vo.Application;
import com.kh.DeVenue.project.model.vo.ApplyAnswer;
import com.kh.DeVenue.project.model.vo.ApplyPortfolio;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectDetail;
import com.kh.DeVenue.project.model.vo.ProjectFilter;
import com.kh.DeVenue.project.model.vo.ProjectLike;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;
import com.kh.DeVenue.project.model.vo.ProjectSearch;
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
	public int getListCount(ProjectFilter filter) {
		
		return proDao.getListCount(filter);
	}

	@Override
	public ArrayList<ProjectList> selectProjectList(PageInfo pi, ProjectFilter filter) {
		
		return proDao.selectProjectList(pi,filter);
	}

	@Override
	public int addQuestion(ProjectQuestion q) {
		
		return  proDao.addQuestion(q);
	}

	@Override
	public ArrayList<Project> selectCheckList(String memId,PageInfo pi) {
		
		return proDao.selectCheckList(memId,pi);

	}



	@Override
	public ArrayList<Project> selectunderwayList(int memId1) {
		
		return proDao.selectunderwayList(memId1);
	}



	@Override
	public ArrayList<Project> selectrecruitList(int memId) {
		
		return proDao.selectrecruitList(memId);
	}



	@Override
	public ArrayList<Project> selectendList() {
		
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

	public int checkLikeNum(HashMap ids) {
		
		return proDao.checkLikeNum(ids);

	}
	

	@Override
	public int addLikeProject(HashMap ids) {
		
		return proDao.addLikeProject(ids);
	}


	@Override
	public int getLikeListCount(HashMap condition) {
		
		return proDao.getLikeListCount(condition);
	}

	@Override
	public ArrayList<ProjectLike> selectLikeProject(HashMap condition, PageInfo pi) {
		
		return proDao.selectLikeProject(condition,pi);
	}

	@Override
	public int deleteLikeProject(Integer lId) {
		
		return proDao.deleteLikeProject(lId);
	}



	@Override
	public ArrayList<Portfolio> selectPortfolio(int memId) {
		
		return proDao.selectPortfolio(memId);
	}



	@Override
	public ArrayList<Portfolio> findPortfolio(HashMap cate) {
		
		return proDao.findPortfolio(cate);
	}



	@Override
	public int addApplication(Application application) {
		
		return proDao.addApplication(application);
	}



	@Override
	public int getapplyListCount(HashMap condition) {
		
		return proDao.getApplyListCount(condition);
	}



	@Override
	public ArrayList<Application> selectApplyProject(HashMap condition, PageInfo pi) {
		
		return proDao.selectApplyProject(condition,pi);
	}



	


	@Override
	public int addApplyAnswer(ApplyAnswer answer) {
		
		return proDao.addApplyAnswer(answer);
	}



	@Override
	public int addApplyPofol(ApplyPortfolio portfolio) {
		
		return proDao.addApplyPofol(portfolio);
	}



	@Override
	public int getTempSave(HashMap application) {
		
		return proDao.getTempSave(application);
	}



	@Override
	public int addTempApplication(HashMap application) {
		
		return proDao.addTempApplication(application);
	}



	@Override
	public int updateTempApplication(HashMap application) {
		
		return proDao.updateTempApplication(application);
	}



	@Override
	public int selectTempId(HashMap application) {
		
		return proDao.selectTempId(application);
	}



	@Override
	public int isAnswerExist(HashMap application) {
		
		return proDao.isAnswerExist(application);
	}



	@Override
	public int updateTempAnswer(HashMap application) {
		
		return proDao.updateTempAnswer(application);
	}



	@Override
	public int isPofoExist(HashMap application) {
		
		return proDao.isPofoExist(application);
	}



	@Override
	public int deleteExistPofo(HashMap application) {
		
		return proDao.deleteExistPofo(application);
	}



	@Override
	public int addTempApplyAnswer(ApplyAnswer answer) {
		
		return proDao.addTempApplyAnswer(answer);
	}



	@Override
	public int addTempApplyPofol(ApplyPortfolio portfolio) {
		
		return proDao.addTempPofol(portfolio);
	}



	@Override
	public Application selectTempResume(int aId) {
		
		return proDao.selectTempResume(aId);
	}



	@Override
	public int getTempApplyListCount(HashMap condition) {
		
		return proDao.getTempApplyListCount(condition);
	}



	@Override
	public ArrayList<ProjectList> selectTempApplyProject(HashMap condition, PageInfo pi) {
		
		return proDao.selectTempApplyProject(condition,pi);
	}



	@Override
	public Application selectTempApplication(Integer aId) {
		
		return proDao.selectTempApplication(aId);
	}



	@Override
	public int deleteTempApplication(Application application) {
		
		return proDao.deleteTempApplication(application);
	}



	@Override
	public int cancelThisApply(Integer aId) {
		
		return proDao.cancelThisApply(aId);
	}



	@Override
	public int cancelThisTempApply(Integer aId) {
		
		return proDao.cancelThisTempApply(aId);
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
	public int getListCount(ProjectSearch search) {
		
		return proDao.getListCount(search);
	}



	@Override
	public ArrayList<ProjectList> selectProjectList(PageInfo pi, ProjectSearch search) {
		
		return proDao.selectProjectList(pi,search);
	}



	@Override
	public int checkApplyId(HashMap application) {
		
		return proDao.checkApplyId(application);
	}



	@Override
	public int checkTempApplyId(HashMap application) {
		
		return proDao.checkTempApplyId(application);
	}



	@Override
	public int checkSigCount(HashMap application) {
		
		return proDao.checkSigCount(application);
	}



	@Override
	public int checkMatched(HashMap application) {
		
		return proDao.checkMatched(application);
	}



	@Override
	public ArrayList<ProjectLike> selectUserLike(int memId) {
		
		return proDao.selectUserLike(memId);
	}



	@Override
	public int getOngoingListCount(HashMap condition) {
		
		return proDao.getOngoingListCount(condition);
	}
	
	
	@Override
	public ArrayList<ProjectList> selectOngoingList(HashMap condition, PageInfo pi) {
		
		return proDao.selectOngoingList(condition,pi);
	}



	@Override
	public int getCompleteListCount(HashMap condition) {
		
		return proDao.getCompleteListCount(condition);
	}
	
	@Override
	public ArrayList<ProjectList> selectCompleteList(HashMap condition, PageInfo pi){
		
		return proDao.selectCompleteList(condition,pi);
	}
	
	@Override
	public int getRequestListCount(int memId) {
		
		return proDao.getRequestListCount(memId);
	}



	@Override
	public ArrayList<ProjectList> selectSuggestList(int memId, PageInfo pi) {
		
		return proDao.selectSuggestList(memId,pi);
	}


	@Override
	public int deleteThisSuggest(Integer sgId) {
		
		return proDao.deleteThisSuggest(sgId);
	}


	@Override
	public int temStoreProject(Project p) {
		
		return proDao.temStoreProject(p);
	}



	@Override
	public int temStoreQuestion(ProjectQuestion q) {
		
		return proDao.temStoreQuestion(q);
	}


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
	public ArrayList<Member> selectrecruitMember(HashMap prof) {

		return proDao.selectrecruitMember(prof);
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



	@Override
	public Project selectOne1(int proId) {
		
		return proDao.selectOne1(proId);
	}



	


	@Override
	public ArrayList<Project> selectApplyList(int proId) {
	
		return proDao.selectApplyList(proId);
	}




	@Override
	public ArrayList<Project> selectCommitList() {
		
		return proDao.selectCommitList();
	}



	@Override
	public ArrayList<Member> selectModal(String proId) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int commitProject(int proId) {
		
		return proDao.commitProject(proId);
	}



	@Override
	public int getCheckListCount(String memId) {
	
		return proDao.getCheckListCount(memId);
	}



	@Override
	public int applyUpdate(int memPId) {
		// TODO Auto-generated method stub
		return proDao.applyUpdate(memPId);
	}



	@Override
	public int getCommitListCount(int proId) {
		
		return proDao.getCommitListCount(proId);


	}



	@Override
	public int getRecuritNum(int proId) {
		// TODO Auto-generated method stub
		return proDao.getRecuritNum(proId);
	}



	@Override
	public int rejectApply(int memPId) {
		
		return proDao.rejectApply(memPId);
	}

	@Override
	public int getLikeId(HashMap ids) {
		
		return proDao.selectLikeId(ids);
	}



	@Override
	public ArrayList<CPeval> selectEvaluation(HashMap condition) {
		
		return proDao.selectEvaluation(condition);
	}



	@Override
	public ArrayList<ProjectList> selectFourWeb() {
		
		return proDao.selectFourWeb();
	}



	@Override
	public ArrayList<ProjectList> selectFourApp() {
		
		return proDao.selectFourApp();
	}



	@Override
	public ArrayList<ProjectList> selectFourPub() {
		
		return proDao.selectFourPub();
	}




	

}

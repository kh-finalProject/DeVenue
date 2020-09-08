package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.DeVenue.member.model.vo.Portfolio;
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
	public int getLikeListCount(int memId) {
		
		return proDao.getLikeListCount(memId);
	}

	@Override
	public ArrayList<ProjectLike> selectLikeProject(int memId, PageInfo pi) {
		
		return proDao.selectLikeProject(memId,pi);
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
	public int getapplyListCount(int memId) {
		
		return proDao.getApplyListCount(memId);
	}



	@Override
	public ArrayList<Application> selectApplyProject(int memId, PageInfo pi) {
		
		return proDao.selectApplyProject(memId,pi);
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
	public int getTempApplyListCount(int memId) {
		
		return proDao.getTempApplyListCount(memId);
	}



	@Override
	public ArrayList<ProjectList> selectTempApplyProject(int memId, PageInfo pi) {
		
		return proDao.selectTempApplyProject(memId,pi);
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
	public int getOngoingListCount(int memId) {
		
		return proDao.getOngoingListCount(memId);
	}
	
	
	@Override
	public ArrayList<ProjectList> selectOngoingList(int memId, PageInfo pi) {
		
		return proDao.selectOngoingList(memId,pi);
	}



	@Override
	public int getCompleteListCount(int memId) {
		
		return proDao.getCompleteListCount(memId);
	}
	
	@Override
	public ArrayList<ProjectList> selectCompleteList(int memId, PageInfo pi){
		
		return proDao.selectCompleteList(memId,pi);
	}
	
	@Override
	public int getRequestListCount(int memId) {
		
		return proDao.getRequestListCount(memId);
	}



	@Override
	public ArrayList<ProjectList> selectSuggestList(int memId, PageInfo pi) {
		
		return proDao.selectSuggestList(memId,pi);
	}




	

}

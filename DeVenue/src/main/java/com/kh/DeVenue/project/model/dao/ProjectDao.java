package com.kh.DeVenue.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Portfolio;
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


 
@Repository("proDao")
public class ProjectDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int addProject(Project p) {
		
		return sqlSessionTemplate.insert("projectMapper.addProject",p);
		
	}

	
	public int getListCount(ProjectFilter filter) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getListCount",filter);
	}

	public ArrayList<ProjectList> selectProjectList(PageInfo pi, ProjectFilter filter) {
		
		System.out.println("필터있는 프로젝트 리스트");
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getProjectList", filter, rowBounds);
	}


	public int addQuestion(ProjectQuestion q) {
		
		return sqlSessionTemplate.insert("projectMapper.addQuestion",q);
	}


	public ArrayList<Project> selectCheckList(String memId) {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectCheckList",memId);
		return list;
	}


	public ArrayList<Project> selectunderwayList() {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectunderwayList");
		return list;
	}


	public ArrayList<Project> selectrecruitList(int memId) {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectrecruitList",memId);
		return list;
	}


	public ArrayList<Project> selectendList() {
		ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectendList");
		return list;
	}
	
	public int temStoreProject(Project p) {
		
		return sqlSessionTemplate.insert("projectMapper.temStoreProject",p);
	}

	

public ArrayList<Tech> selectTechList() {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getTechList");
	}

	public ProjectDetail selectProjectDetail(int id) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getProjectDetail",id);
	}


	public ProjectDetail selectAllNumber(int memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getProjectNumber",memId);
	}

	public ArrayList<ProjectList> selectRecommend(ProjectList project) {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getRecommend", project);
	}

	public int insertProjectReply(Reply r) {
		
		return sqlSessionTemplate.insert("projectMapper.insertProjectReply", r);
	}

	public ArrayList<Reply> selectparentReply(int pId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectPReply", pId);
	}

	public ArrayList<Reply> selectchildReply(int pId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectCReply",pId);
	}

	public int updateProjectReply(Reply r) {
		
		return sqlSessionTemplate.update("projectMapper.updateProjectReply",r);
	}

	public int deleteProjectReply(Reply r) {
		
		return sqlSessionTemplate.update("projectMapper.deleteProjectReply",r);
	}

	public int updateAnswerStatus(Reply r) {
		
		return sqlSessionTemplate.update("projectMapper.updateAnswerStatus",r);
	}

	public int answerProjectReply(Reply r) {
		
		return sqlSessionTemplate.insert("projectMapper.answerProjectReply", r);
	}

	public int changeAnswerStatus(Reply r) {
		
		return sqlSessionTemplate.update("projectMapper.changeAnswerStatus", r);
	}


	public int checkLikeNum(HashMap ids) {
		
		return sqlSessionTemplate.selectOne("projectMapper.checkLikeNum", ids);
	}

	public int addLikeProject(HashMap ids) {
		
		return sqlSessionTemplate.insert("projectMapper.addLikeProject",ids );
	}

	public ArrayList<ProjectLike> selectLikeProject(ProjectFilter filter, PageInfo pi) {
		
		int offset=pi.getBoardLimit()*(pi.getCurrentPage()-1);
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getLikeList", filter, rowBounds);
	}

	public int getLikeListCount(HashMap condition) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getLikeCount", condition);
	}

	public int deleteLikeProject(Integer lId) {
		
		return sqlSessionTemplate.delete("projectMapper.deleteLikeProject", lId);
	}


	public ArrayList<Portfolio> selectPortfolio(int memId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectPortfolio", memId);
	}


	public ArrayList<Portfolio> findPortfolio(HashMap cate) {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.findPortfolio", cate);
	}


	public int addApplication(Application application) {
		
		return sqlSessionTemplate.insert("projectMapper.insertApplication", application);
	}


	public int addApplyAnswer(ApplyAnswer answer) {
		
		return sqlSessionTemplate.insert("projectMapper.insertApplyAnswer", answer);
	}


	public int addApplyPofol(ApplyPortfolio portfolio) {
		
		return sqlSessionTemplate.insert("projectMapper.insertApplypofol", portfolio);
	}


	public int getApplyListCount(int memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getApplyCount", memId);
	}


	public ArrayList<Application> selectApplyProject(int memId, PageInfo pi) {
		
		int offset=pi.getBoardLimit()*(pi.getCurrentPage()-1);
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectApplyProject", memId, rowBounds);
	}


	public int getTempSave(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getTempSaveNum", application);
	}


	public int addTempApplication(HashMap application) {
		
		return sqlSessionTemplate.insert("projectMapper.insertTempApplication", application);
	}


	public int updateTempApplication(HashMap application) {
		
		return sqlSessionTemplate.update("projectMapper.updateTempApplication", application);
	}


	public int selectTempId(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getTempId", application);
	}


	public int isAnswerExist(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.isAnswerExist", application);
	}


	public int updateTempAnswer(HashMap application) {
		
		return sqlSessionTemplate.update("projectMapper.updateTempAnswer", application);
	}


	public int isPofoExist(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.isPofoExist", application);
	}


	public int deleteExistPofo(HashMap application) {
		
		return sqlSessionTemplate.delete("projectMapper.deleteExistPofo", application);
	}


	public int addTempApplyAnswer(ApplyAnswer answer) {
		
		return sqlSessionTemplate.insert("projectMapper.insertTempAnswer", answer);
	}


	public int addTempPofol(ApplyPortfolio portfolio) {
		
		return sqlSessionTemplate.insert("projectMapper.insertTempPofo",portfolio);
	}


	public Application selectTempResume(int aId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.selectTempResume",aId);
	}


	public int getTempApplyListCount(int memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getTempApplyCount", memId);
	}


	public ArrayList<ProjectList> selectTempApplyProject(int memId, PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*(pi.getBoardLimit());
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectTempApplyProject", memId, rowBounds);
	}


	public Application selectTempApplication(Integer aId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.selectTempApplication", aId);
	}


	public int deleteTempApplication(Application application) {
		
		return sqlSessionTemplate.delete("projectMapper.deleteTempApplication", application);
	}


	public int cancelThisApply(Integer aId) {
		
		return sqlSessionTemplate.update("projectMapper.cancelThisApply", aId);
	}


	public int cancelThisTempApply(Integer aId) {
		
		return sqlSessionTemplate.update("projectMapper.cancelTempApply", aId);
	}


	public int getListCount() {
		
		return sqlSessionTemplate.selectOne("projectMapper.getListCountNoFilter");
	}


	public ArrayList<ProjectList> selectProjectList(PageInfo pi) {
		
		System.out.println("필터없는 프로젝트 리스트");
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getProjectListNoFilter", null, rowBounds);
	}


	public int getListCount(ProjectSearch search) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getListCountWithSearch",search);
	}


	public ArrayList<ProjectList> selectProjectList(PageInfo pi, ProjectSearch search) {
		
		System.out.println("검색있고 필터없는 프로젝트 리스트");
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getProjectListWithSearch", search, rowBounds);
	}


	public int checkApplyId(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.checkApplyCount", application);
	}


	public int checkTempApplyId(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.checkTempApplyCount", application);
	}


	public int checkSigCount(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.checkSigCount", application);
	}


	public int checkMatched(HashMap application) {
		
		return sqlSessionTemplate.selectOne("projectMapper.checkMatched", application);
	}


	public ArrayList<ProjectLike> selectUserLike(int memId) {
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectUserLike", memId);
	}


	public int getOngoingListCount(int memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getOngoingCount", memId);
	}



	public ArrayList<ProjectList> selectOngoingList(int memId, PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectOngoingList", memId, rowBounds);
	}


	public int getCompleteListCount(int memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getCompleteCount",memId);
	}


	public ArrayList<ProjectList> selectCompleteList(int memId, PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectCompleteList", memId, rowBounds);
	}


	public int getRequestListCount(int memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getRequestCount", memId);
	}


	public ArrayList<ProjectList> selectSuggestList(int memId, PageInfo pi) {
		
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds=new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.selectSuggestList", memId, rowBounds);
	}



	public int deleteThisSuggest(Integer sgId) {
		
		return sqlSessionTemplate.delete("projectMapper.deleteThisSuggest", sgId);
	}



	public int temStoreQuestion(ProjectQuestion q) {
		
		return sqlSessionTemplate.insert("projectMapper.temStoreQuestion",q);
	}


	public int getUpdateForm(int proId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getUpdateForm", proId);
		
	}


	public ArrayList<ProjectQuestion> getQuestion(int proId) {
	ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.getQuestion",proId);
		return list;
		
	}

   
	


	public Project selectOne(int proId) {
		
		return  sqlSessionTemplate.selectOne("projectMapper.selectOne", proId);
	}


	public int updateProject(Project p) {
		
		return sqlSessionTemplate.update("projectMapper.updateProject",p);
	}


	public int updateQuestion(ProjectQuestion q) {
	
		return sqlSessionTemplate.update("projectMapper.updateQuestion",q);
	}


	public ArrayList<Member> selectrecruitMember(HashMap prof) {
	ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectRecruitMember",prof);
		return list;
		
	}


	public int deleteProject(int proId) {
		
		return sqlSessionTemplate.delete("projectMapper.deleteProject", proId);
	}


	public int deleteQuestion(Integer proId) {
	
		return  sqlSessionTemplate.delete("projectMapper.deleteQuestion", proId);
	}


	public ArrayList<Project> selectTemStore(int a) {
	ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.temStoreList", a);
		return list;
		
	}


	public ArrayList<Project> selectunderwayList(int memId1) {
	ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.underwayList", memId1);
		return list;
	}


	public Project selectOne1(int proId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.temUpdateForm", proId);
	}


	public ArrayList<Member> selectModal(String proId) {
	ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("memberMapper.selectModal", proId);
		return list;
		
	}



}

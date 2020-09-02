package com.kh.DeVenue.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Portfolio;
import com.kh.DeVenue.project.model.vo.Application;
import com.kh.DeVenue.project.model.vo.ApplyAnswer;
import com.kh.DeVenue.project.model.vo.ApplyPortfolio;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectDetail;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;
import com.kh.DeVenue.project.model.vo.Reply;
import com.kh.DeVenue.project.model.vo.Tech;


 
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

	public ArrayList<ProjectList> selectLikeProject(int memId, PageInfo pi) {
		
		int offset=pi.getBoardLimit()*(pi.getCurrentPage()-1);
		RowBounds rowBounds=new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSessionTemplate.selectList("projectMapper.getLikeList", memId, rowBounds);
	}

	public int getLikeListCount(int memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.getLikeCount", memId);
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


	public ArrayList<ProjectList> selectApplyProject(int memId, PageInfo pi) {
		
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







}

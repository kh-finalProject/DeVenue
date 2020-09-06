package com.kh.DeVenue.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.DeVenue.member.model.vo.Member;
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

	public int checkLikeNum(Integer pId, Integer memId) {
		
		return sqlSessionTemplate.selectOne("projectMapper.checkLikeNum");
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


	public ArrayList<Member> selectrecruitMember() {
	ArrayList list =new ArrayList();
		
		list= (ArrayList)sqlSessionTemplate.selectList("projectMapper.recruitMember");
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





//	public ProjectQuestion getQuestion(int proId) {
//		
//		return sqlSessionTemplate.selectOne("projectMapper.getQuestion",proId);
//	
//	}


	








}

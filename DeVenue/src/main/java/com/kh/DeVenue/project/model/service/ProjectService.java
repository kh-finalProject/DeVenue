package com.kh.DeVenue.project.model.service;

import java.util.ArrayList;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.project.model.vo.PageInfo;
import com.kh.DeVenue.project.model.vo.Project;
import com.kh.DeVenue.project.model.vo.ProjectDetail;
import com.kh.DeVenue.project.model.vo.ProjectList;
import com.kh.DeVenue.project.model.vo.ProjectQuestion;
import com.kh.DeVenue.project.model.vo.Reply;
import com.kh.DeVenue.project.model.vo.Tech;


public interface ProjectService {

	int addProject(Project p);

	
	ArrayList<Project> selectCheckList(String memId);

	int getListCount();

	ArrayList<ProjectList> selectProjectList(PageInfo pi);

	int addQuestion(ProjectQuestion q);



	ArrayList<Project> selectunderwayList(int memId1);


	ArrayList<Project> selectrecruitList();


	ArrayList<Project> selectendList();
	ArrayList<Tech> selectTechList();

	ProjectDetail selectProjectDetail(int id);

	ProjectDetail selectAllNumber(int memId);

	ArrayList<ProjectList> selectRecommend(ProjectList project);

	int insertProjectReply(Reply r);

	ArrayList<Reply> selectparentReply(int pId);

	ArrayList<Reply> selectchildReply(int pId);

	int updateProjectReply(Reply r);

	int deleteProjectReply(Reply r);

	int updateAnswerStatus(Reply r);

	int answerProjectReply(Reply r);

	int changeAnswerStatus(Reply r);

	int checkLikeNum(Integer pId, Integer memId);


	int temStoreProject(Project p);


	int temStoreQuestion(ProjectQuestion q);


	int getUpdateForm(Integer proId);


	Project selectOne(int proId);


	ArrayList<ProjectQuestion> getQuestion(int proId);


	int updateProject(Project p);


	int updateQuestion(ProjectQuestion q);


	ArrayList<Member> selectrecruitMember();


	int deleteProject(Integer proId);


	int deleteQuestion(Integer proId);


	ArrayList<Project> selectTemStoreList(int a);


	


//	ProjectQuestion getQuestion(int proId);


	












	


}

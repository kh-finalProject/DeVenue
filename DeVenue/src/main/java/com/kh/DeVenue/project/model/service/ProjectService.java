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

	int checkLikeNum(HashMap ids);

	int addLikeProject(HashMap ids);

	ArrayList<ProjectList> selectLikeProject(int memId, PageInfo pi);

	int getLikeListCount(int memId);

	int deleteLikeProject(Integer lId);


	ArrayList<Portfolio> selectPortfolio(int memId);


	ArrayList<Portfolio> findPortfolio(HashMap cate);


	int addApplication(Application application);


	int addApplyAnswer(ApplyAnswer applyAnswer);


	int addApplyPofol(ApplyPortfolio applyPortfolio);


	int getapplyListCount(int memId);


	ArrayList<ProjectList> selectApplyProject(int memId, PageInfo pi);


	int getTempSave(HashMap application);


	int addTempApplication(HashMap application);


	int updateTempApplication(HashMap application);


	int selectTempId(HashMap application);


	int isAnswerExist(HashMap application);


	int updateTempAnswer(HashMap application);


	int isPofoExist(HashMap application);


	int deleteExistPofo(HashMap application);


	int addTempApplyAnswer(ApplyAnswer applyAnswer);


	int addTempApplyPofol(ApplyPortfolio applyPortfolio);


	Application selectTempResume(int aId);


	int getTempApplyListCount(int memId);


	ArrayList<ProjectList> selectTempApplyProject(int memId, PageInfo pi);


	Application selectTempApplication(Integer aId);


	int deleteTempApplication(Application application);


	int cancelThisApply(Integer aId);


	int cancelThisTempApply(Integer aId);




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

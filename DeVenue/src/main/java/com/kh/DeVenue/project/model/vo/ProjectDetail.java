package com.kh.DeVenue.project.model.vo;

import java.util.ArrayList;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Profile;

public class ProjectDetail {
	
	private int pId; //프로젝트 아이디
	private Project project; //프로젝트 객체
	private ProjectList pList; //프로젝트 리스트 객체
	private ArrayList<ProjectQuestion> question; //프로젝트 질문 객체
	private ArrayList<Reply> rpList; //부모 댓글 리스트
	private ArrayList<Reply> rcList; //자식 댓글 리스트
	private Member client; //클라이언트 객체
	private Profile profile;//프로필
	private int allProject;//전체 프로젝트 수
	private int processProject;//진행중 프로젝트 수
	private int completeProject;//완료된 프로젝트 수
	private int total;//프로젝트 진행 누적 금액
	private int evalCount;//클라이언트 평가 수 
	
	public ProjectDetail() {
		super();
	}

	public ProjectDetail(int pId, Project project, ProjectList pList, ArrayList<ProjectQuestion> question,
			ArrayList<Reply> rpList, ArrayList<Reply> rcList, Member client, Profile profile, int allProject,
			int processProject, int completeProject, int total, int evalCount) {
		super();
		this.pId = pId;
		this.project = project;
		this.pList = pList;
		this.question = question;
		this.rpList = rpList;
		this.rcList = rcList;
		this.client = client;
		this.profile = profile;
		this.allProject = allProject;
		this.processProject = processProject;
		this.completeProject = completeProject;
		this.total = total;
		this.evalCount = evalCount;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ProjectList getpList() {
		return pList;
	}

	public void setpList(ProjectList pList) {
		this.pList = pList;
	}

	public ArrayList<ProjectQuestion> getQuestion() {
		return question;
	}

	public void setQuestion(ArrayList<ProjectQuestion> question) {
		this.question = question;
	}

	public ArrayList<Reply> getRpList() {
		return rpList;
	}

	public void setRpList(ArrayList<Reply> rpList) {
		this.rpList = rpList;
	}

	public ArrayList<Reply> getRcList() {
		return rcList;
	}

	public void setRcList(ArrayList<Reply> rcList) {
		this.rcList = rcList;
	}

	public Member getClient() {
		return client;
	}

	public void setClient(Member client) {
		this.client = client;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public int getAllProject() {
		return allProject;
	}

	public void setAllProject(int allProject) {
		this.allProject = allProject;
	}

	public int getProcessProject() {
		return processProject;
	}

	public void setProcessProject(int processProject) {
		this.processProject = processProject;
	}

	public int getCompleteProject() {
		return completeProject;
	}

	public void setCompleteProject(int completeProject) {
		this.completeProject = completeProject;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getEvalCount() {
		return evalCount;
	}

	public void setEvalCount(int evalCount) {
		this.evalCount = evalCount;
	}

	@Override
	public String toString() {
		return "ProjectDetail [pId=" + pId + ", project=" + project + ", pList=" + pList + ", question=" + question
				+ ", rpList=" + rpList + ", rcList=" + rcList + ", client=" + client + ", profile=" + profile
				+ ", allProject=" + allProject + ", processProject=" + processProject + ", completeProject="
				+ completeProject + ", total=" + total + ", evalCount=" + evalCount + "]";
	}
	
	
	
	

}

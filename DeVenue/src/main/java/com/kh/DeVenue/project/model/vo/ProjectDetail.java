package com.kh.DeVenue.project.model.vo;

import java.util.ArrayList;

import com.kh.DeVenue.member.model.vo.Member;

public class ProjectDetail {
	
	private int pId; //프로젝트 아이디
	private Project project; //프로젝트 객체
	private ProjectList pList; //프로젝트 리스트 객체
	private ProjectQuestion question; //프로젝트 질문 객체
	private ArrayList<Reply> rList; //댓글 리스트
	private Member client; //클라이언트 객체
	
	public ProjectDetail() {
		super();
	}

	public ProjectDetail(int pId, Project project, ProjectList pList, ProjectQuestion question, ArrayList<Reply> rList,
			Member client) {
		super();
		this.pId = pId;
		this.project = project;
		this.pList = pList;
		this.question = question;
		this.rList = rList;
		this.client = client;
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

	public ProjectQuestion getQuestion() {
		return question;
	}

	public void setQuestion(ProjectQuestion question) {
		this.question = question;
	}

	public ArrayList<Reply> getrList() {
		return rList;
	}

	public void setrList(ArrayList<Reply> rList) {
		this.rList = rList;
	}

	public Member getClient() {
		return client;
	}

	public void setClient(Member client) {
		this.client = client;
	}

	@Override
	public String toString() {
		return "ProjectDetail [pId=" + pId + ", project=" + project + ", pList=" + pList + ", question=" + question
				+ ", rList=" + rList + ", client=" + client + "]";
	}
	
	
	
	
	

}

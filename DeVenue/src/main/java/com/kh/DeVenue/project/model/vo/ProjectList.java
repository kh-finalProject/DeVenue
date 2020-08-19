package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.DeVenue.project.model.vo.Tech;

public class ProjectList implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 951063778678382462L;
	private int id;//프로젝트 id
	private Project project;//프로젝트
	private int applyNum;//프로젝트 지원 수 
	private int likeNum;//프로젝트 관심 수
	private int replyNum;//프로젝트 댓글 수
	private String mCategory;//프로젝트 메인 카테고리
	private String dCategory;//프로젝트 상세 카테고리
	private String workType;//프로젝트 근무 형태
	private String identify;//프로젝트 클라이언트 인증 여부
	private int evaluation;//프로젝트 클라이언트 평균 점수
	private ArrayList<Tech> techName;//프로젝트 기술명
	
	public ProjectList() {
		super();
	}

	public ProjectList(int id, Project project, int applyNum, int likeNum, int replyNum, String mCategory,
			String dCategory, String workType, String identify, int evaluation, ArrayList<Tech> techName) {
		super();
		this.id = id;
		this.project = project;
		this.applyNum = applyNum;
		this.likeNum = likeNum;
		this.replyNum = replyNum;
		this.mCategory = mCategory;
		this.dCategory = dCategory;
		this.workType = workType;
		this.identify = identify;
		this.evaluation = evaluation;
		this.techName = techName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public int getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public String getmCategory() {
		return mCategory;
	}

	public void setmCategory(String mCategory) {
		this.mCategory = mCategory;
	}

	public String getdCategory() {
		return dCategory;
	}

	public void setdCategory(String dCategory) {
		this.dCategory = dCategory;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public String getIdentify() {
		return identify;
	}

	public void setIdentify(String identify) {
		this.identify = identify;
	}

	public int getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}

	public ArrayList<Tech> getTechName() {
		return techName;
	}

	public void setTechName(ArrayList<Tech> techName) {
		this.techName = techName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProjectList [id=" + id + ", project=" + project + ", applyNum=" + applyNum + ", likeNum=" + likeNum
				+ ", replyNum=" + replyNum + ", mCategory=" + mCategory + ", dCategory=" + dCategory + ", workType="
				+ workType + ", identify=" + identify + ", evaluation=" + evaluation + ", techName=" + techName + "]";
	}
	
	
	
	
	
	

}

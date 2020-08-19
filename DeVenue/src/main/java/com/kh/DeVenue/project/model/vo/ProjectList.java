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
	private String name;//프로젝트명
	private int planDetail;//프로젝트 상세
	private int duration;//프로젝트 예상 기간
	private String summary;//프로젝트 요약
	private int payment;//프로젝트 예상금액
	private String location;//프로젝트 지역
	private String recruit;//프로젝트 모집 상태
	private Date cDate;//프로젝트 생성일
	private Date rEndDate;//프로젝트 모집 마감일
	private int applyNum;//프로젝트 지원 수 
	private int likeNum;//프로젝트 관심 수
	private int replyNum;//프로젝트 댓글 수
	private String mCategory;//프로젝트 메인 카테고리
	private String dCategory;//프로젝트 상세 카테고리
	private String workType;//프로젝트 근무 형태
	private int clientId;//프로젝트 클라이언트 아이디
	private String identify;//프로젝트 클라이언트 인증 여부
	private int evaluation;//프로젝트 클라이언트 평균 점수
	private ArrayList<Tech> techName;//프로젝트 기술명
	
	public ProjectList() {
		super();
	}

	public ProjectList(int id, String name, int planDetail, int duration, String summary, int payment, String location,
			String recruit, Date cDate, Date rEndDate, int applyNum, int likeNum, int replyNum, String mCategory,
			String dCategory, String workType, int clientId, String identify, int evaluation,
			ArrayList<Tech> techName) {
		super();
		this.id = id;
		this.name = name;
		this.planDetail = planDetail;
		this.duration = duration;
		this.summary = summary;
		this.payment = payment;
		this.location = location;
		this.recruit = recruit;
		this.cDate = cDate;
		this.rEndDate = rEndDate;
		this.applyNum = applyNum;
		this.likeNum = likeNum;
		this.replyNum = replyNum;
		this.mCategory = mCategory;
		this.dCategory = dCategory;
		this.workType = workType;
		this.clientId = clientId;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPlanDetail() {
		return planDetail;
	}

	public void setPlanDetail(int planDetail) {
		this.planDetail = planDetail;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getRecruit() {
		return recruit;
	}

	public void setRecruit(String recruit) {
		this.recruit = recruit;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public Date getrEndDate() {
		return rEndDate;
	}

	public void setrEndDate(Date rEndDate) {
		this.rEndDate = rEndDate;
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

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
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
		return "ProjectList [id=" + id + ", name=" + name + ", planDetail=" + planDetail + ", duration=" + duration
				+ ", summary=" + summary + ", payment=" + payment + ", location=" + location + ", recruit=" + recruit
				+ ", cDate=" + cDate + ", rEndDate=" + rEndDate + ", applyNum=" + applyNum + ", likeNum=" + likeNum
				+ ", replyNum=" + replyNum + ", mCategory=" + mCategory + ", dCategory=" + dCategory + ", workType="
				+ workType + ", clientId=" + clientId + ", identify=" + identify + ", evaluation=" + evaluation
				+ ", techName=" + techName + "]";
	}
	
	
	
	
	

}

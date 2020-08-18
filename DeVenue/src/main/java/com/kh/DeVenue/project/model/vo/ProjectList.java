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
	private int id;
	private String name;
	private int planDetail;
	private int duration;
	private String summary;
	private int payment;
	private String location;
	private String recruit;
	private Date cDate;
	private int applyNum;
	private int likeNum;
	private int replyNum;
	private String mCategory;
	private String dCategory;
	private String workType;
	private int clientId;
	private String identify;
	private int evaluation;
	private ArrayList<Tech> techName;
	
	public ProjectList() {
		super();
	}

	public ProjectList(int id, String name, int planDetail, int duration, String summary, int payment, String location,
			String recruit, Date cDate, int applyNum, int likeNum, int replyNum, String mCategory, String dCategory,
			String workType, int clientId, String identify, int evaluation, ArrayList<Tech> techName) {
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

	@Override
	public String toString() {
		return "ProjectList [id=" + id + ", name=" + name + ", planDetail=" + planDetail + ", duration=" + duration
				+ ", summary=" + summary + ", payment=" + payment + ", location=" + location + ", recruit=" + recruit
				+ ", cDate=" + cDate + ", applyNum=" + applyNum + ", likeNum=" + likeNum + ", replyNum=" + replyNum
				+ ", mCategory=" + mCategory + ", dCategory=" + dCategory + ", workType=" + workType + ", clientId="
				+ clientId + ", identify=" + identify + ", evaluation=" + evaluation + ", techName=" + techName + "]";
	}
	
	
	
	

}

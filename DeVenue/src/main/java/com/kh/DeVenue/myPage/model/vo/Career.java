package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Career implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 406687552062782709L;

	private int cId;
	private String cName;
	private String cDept;
	private String cPosition;
	private Date cStartDate;
	private Date cEndDate;
	private String cContent;
	private int profileId;
	public Career() {
		super();
	}
	public Career(int cId, String cName, String cDept, String cPosition, Date cStartDate, Date cEndDate,
			String cContent, int profileId) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cDept = cDept;
		this.cPosition = cPosition;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cContent = cContent;
		this.profileId = profileId;
	}
	
	// 경력 insert
	public Career(String cName, String cDept, String cPosition, Date cStartDate, Date cEndDate, String cContent,
			int profileId) {
		super();
		this.cName = cName;
		this.cDept = cDept;
		this.cPosition = cPosition;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cContent = cContent;
		this.profileId = profileId;
	}
	
	public int getcId() {
		return cId;
	}
	
	
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcDept() {
		return cDept;
	}
	public void setcDept(String cDept) {
		this.cDept = cDept;
	}
	public String getcPosition() {
		return cPosition;
	}
	public void setcPosition(String cPosition) {
		this.cPosition = cPosition;
	}
	public Date getcStartDate() {
		return cStartDate;
	}
	public void setcStartDate(Date cStartDate) {
		this.cStartDate = cStartDate;
	}
	public Date getcEndDate() {
		return cEndDate;
	}
	public void setcEndDate(Date cEndDate) {
		this.cEndDate = cEndDate;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	@Override
	public String toString() {
		return "Career [cId=" + cId + ", cName=" + cName + ", cDept=" + cDept + ", cPosition=" + cPosition
				+ ", cStartDate=" + cStartDate + ", cEndDate=" + cEndDate + ", cContent=" + cContent + ", profileId="
				+ profileId + "]";
	}
	
	
	
	
}

package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SCCareer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5624869417674342390L;
	
	private int scId;
	private String sgId;
	private String ssId;
	private String scName;
	private String scMajor;
	private String scStartDate;
	private String scEndDate;
	private int profileId;
	public SCCareer() {
		super();
	}
	public SCCareer(int scId, String sgId, String ssId, String scName, String scMajor, String scStartDate,
			String scEndDate, int profileId) {
		super();
		this.scId = scId;
		this.sgId = sgId;
		this.ssId = ssId;
		this.scName = scName;
		this.scMajor = scMajor;
		this.scStartDate = scStartDate;
		this.scEndDate = scEndDate;
		this.profileId = profileId;
	}
	
	// 학력 insert
	public SCCareer(String sgId, String ssId, String scName, String scMajor, String scStartDate, String scEndDate,
			int profileId) {
		super();
		this.sgId = sgId;
		this.ssId = ssId;
		this.scName = scName;
		this.scMajor = scMajor;
		this.scStartDate = scStartDate;
		this.scEndDate = scEndDate;
		this.profileId = profileId;
	}
	public int getScId() {
		return scId;
	}
	public void setScId(int scId) {
		this.scId = scId;
	}
	public String getSgId() {
		return sgId;
	}
	public void setSgId(String sgId) {
		this.sgId = sgId;
	}
	public String getSsId() {
		return ssId;
	}
	public void setSsId(String ssId) {
		this.ssId = ssId;
	}
	public String getScName() {
		return scName;
	}
	public void setScName(String scName) {
		this.scName = scName;
	}
	public String getScMajor() {
		return scMajor;
	}
	public void setScMajor(String scMajor) {
		this.scMajor = scMajor;
	}
	public String getScStartDate() {
		return scStartDate;
	}
	public void setScStartDate(String scStartDate) {
		this.scStartDate = scStartDate;
	}
	public String getScEndDate() {
		return scEndDate;
	}
	public void setScEndDate(String scEndDate) {
		this.scEndDate = scEndDate;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	@Override
	public String toString() {
		return "SCCareer [scId=" + scId + ", sgId=" + sgId + ", ssId=" + ssId + ", scName=" + scName + ", scMajor="
				+ scMajor + ", scStartDate=" + scStartDate + ", scEndDate=" + scEndDate + ", profileId=" + profileId
				+ "]";
	}	
	
	

	
	
	
	
}

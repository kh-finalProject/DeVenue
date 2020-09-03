package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Certificate implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4972887329908245745L;

	private int ccId;
	private int profileId;
	private String ccName;
	private String ccPlace;
	private String ccCreateDate;
	private String ccNumber;
	public Certificate() {
		super();
	}

	public Certificate(int ccId, int profileId, String ccName, String ccPlace, String ccCreateDate, String ccNumber) {
		super();
		this.ccId = ccId;
		this.profileId = profileId;
		this.ccName = ccName;
		this.ccPlace = ccPlace;
		this.ccCreateDate = ccCreateDate;
		this.ccNumber = ccNumber;
	}

	// 자격증 insert
	public Certificate(int profileId, String ccName, String ccPlace, String ccCreateDate, String ccNumber) {
		super();
		this.profileId = profileId;
		this.ccName = ccName;
		this.ccPlace = ccPlace;
		this.ccCreateDate = ccCreateDate;
		this.ccNumber = ccNumber;
	}
	
	
	public int getCcId() {
		return ccId;
	}


	public void setCcId(int ccId) {
		this.ccId = ccId;
	}

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public String getCcName() {
		return ccName;
	}

	public void setCcName(String ccName) {
		this.ccName = ccName;
	}

	public String getCcPlace() {
		return ccPlace;
	}

	public void setCcPlace(String ccPlace) {
		this.ccPlace = ccPlace;
	}

	public String getCcCreateDate() {
		return ccCreateDate;
	}

	public void setCcCreateDate(String ccCreateDate) {
		this.ccCreateDate = ccCreateDate;
	}

	public String getCcNumber() {
		return ccNumber;
	}

	public void setCcNumber(String ccNumber) {
		this.ccNumber = ccNumber;
	}

	@Override
	public String toString() {
		return "Certificate [ccId=" + ccId + ", profileId=" + profileId + ", ccName=" + ccName + ", ccPlace=" + ccPlace
				+ ", ccCreateDate=" + ccCreateDate + ", ccNumber=" + ccNumber + "]";
	}
	
	
	
	
	
	
}

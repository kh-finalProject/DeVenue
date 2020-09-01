package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class Partinfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6605436142356696198L;
	
	private int piId;		//파트너스정보 번호
	private String wtId;	//근무형태(외주/상주/외주+상주)
	private String mcId;	//대표카테고리(개발/디자인/개발+디자인)
	private int piType;		//활동가능성(1~3 활동가능성/협의필요/활동불가능)
	private int profileId;	//프로필 번호
	public Partinfo() {
		super();
	}
	
	public Partinfo(int piId, String wtId, String mcId, int piType, int profileId) {
		super();
		this.piId = piId;
		this.wtId = wtId;
		this.mcId = mcId;
		this.piType = piType;
		this.profileId = profileId;
	}
		
	// 파트너스 정보 업데이트용
	public Partinfo(String wtId, String mcId, int piType) {
		super();
		this.wtId = wtId;
		this.mcId = mcId;
		this.piType = piType;
	}
	
	public int getPiId() {
		return piId;
	}
	public void setPiId(int piId) {
		this.piId = piId;
	}
	public String getWtId() {
		return wtId;
	}
	public void setWtId(String wtId) {
		this.wtId = wtId;
	}
	public String getMcId() {
		return mcId;
	}
	public void setMcId(String mcId) {
		this.mcId = mcId;
	}
	public int getPiType() {
		return piType;
	}
	public void setPiType(int piType) {
		this.piType = piType;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	@Override
	public String toString() {
		return "Partinfo [piId=" + piId + ", wtId=" + wtId + ", mcId=" + mcId + ", piType=" + piType + ", profileId="
				+ profileId + "]";
	}

	
	
}

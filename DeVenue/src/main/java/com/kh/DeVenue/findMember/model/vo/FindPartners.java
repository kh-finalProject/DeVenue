package com.kh.DeVenue.findMember.model.vo;

import java.io.Serializable;

public class FindPartners implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7876739221308635513L;

	private int memId;
	private String memNick;
	private String cellPhone;
	private String ideStatus;
	private String memTypeKind;
	private int profileId;
	private String introduction;
	private int piType;
	private String mcType;
	public FindPartners() {
		super();
	}
	public FindPartners(int memId, String memNick, String cellPhone, String ideStatus, String memTypeKind,
			int profileId, String introduction, int piType, String mcType) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.cellPhone = cellPhone;
		this.ideStatus = ideStatus;
		this.memTypeKind = memTypeKind;
		this.profileId = profileId;
		this.introduction = introduction;
		this.piType = piType;
		this.mcType = mcType;
	}
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getIdeStatus() {
		return ideStatus;
	}
	public void setIdeStatus(String ideStatus) {
		this.ideStatus = ideStatus;
	}
	public String getMemTypeKind() {
		return memTypeKind;
	}
	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getPiType() {
		return piType;
	}
	public void setPiType(int piType) {
		this.piType = piType;
	}
	public String getMcType() {
		return mcType;
	}
	public void setMcType(String mcType) {
		this.mcType = mcType;
	}
	@Override
	public String toString() {
		return "FindPartners [memId=" + memId + ", memNick=" + memNick + ", cellPhone=" + cellPhone + ", ideStatus="
				+ ideStatus + ", memTypeKind=" + memTypeKind + ", profileId=" + profileId + ", introduction="
				+ introduction + ", piType=" + piType + ", mcType=" + mcType + "]";
	}
	
	
	
	
	
	
}

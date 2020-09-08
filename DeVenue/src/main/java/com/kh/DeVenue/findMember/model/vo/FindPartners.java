package com.kh.DeVenue.findMember.model.vo;

import java.io.Serializable;

public class FindPartners implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7876739221308635513L;

	private String memType; 	// 회원 형태(개인,팀,법인....)
	private String memNick; 	// 회원 닉네임 
	private String cellPhone;	// 휴대폰 전화
	private String ideStatus;	// 신원 인증
	private int	profileId;		// 프로필 번호
	private String introduction;// 자기소개
	private String mcId;		// 메인 카테고리(개발,디자인...)
	private int piType;			// 활동 가능성(활동가능,협의필요...)
	private int memId;			// 회원 번호
	public FindPartners() {
		super();
	}
	public FindPartners(String memType, String memNick, String cellPhone, String ideStatus, int profileId,
			String introduction, String mcId, int piType, int memId) {
		super();
		this.memType = memType;
		this.memNick = memNick;
		this.cellPhone = cellPhone;
		this.ideStatus = ideStatus;
		this.profileId = profileId;
		this.introduction = introduction;
		this.mcId = mcId;
		this.piType = piType;
		this.memId = memId;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
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
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "FindPartners [memType=" + memType + ", memNick=" + memNick + ", cellPhone=" + cellPhone + ", ideStatus="
				+ ideStatus + ", profileId=" + profileId + ", introduction=" + introduction + ", mcId=" + mcId
				+ ", piType=" + piType + ", memId=" + memId + "]";
	}
	
	
	
}

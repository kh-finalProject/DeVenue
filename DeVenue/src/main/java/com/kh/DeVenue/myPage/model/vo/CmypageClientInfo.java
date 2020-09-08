package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class CmypageClientInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3977703890179148295L;
	
	private int memId;
	private String userType;
	private String memNick;
	private String memTypeKind;
	private String memEmail;
	private String ideStatus;
	private String phone;
	private String cellPhone;
	private String proImg;
	private int addProject;
	private int stopProject;
	private int ingProject;
	private String introduction;
	private String url;
	
	public CmypageClientInfo() {
		super();
	}

	public CmypageClientInfo(int memId, String userType, String memNick, String memTypeKind, String memEmail,
			String ideStatus, String phone, String cellPhone, String proImg, int addProject, int stopProject,
			int ingProject, String introduction, String url) {
		super();
		this.memId = memId;
		this.userType = userType;
		this.memNick = memNick;
		this.memTypeKind = memTypeKind;
		this.memEmail = memEmail;
		this.ideStatus = ideStatus;
		this.phone = phone;
		this.cellPhone = cellPhone;
		this.proImg = proImg;
		this.addProject = addProject;
		this.stopProject = stopProject;
		this.ingProject = ingProject;
		this.introduction = introduction;
		this.url = url;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemTypeKind() {
		return memTypeKind;
	}

	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getIdeStatus() {
		return ideStatus;
	}

	public void setIdeStatus(String ideStatus) {
		this.ideStatus = ideStatus;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	public int getAddProject() {
		return addProject;
	}

	public void setAddProject(int addProject) {
		this.addProject = addProject;
	}

	public int getStopProject() {
		return stopProject;
	}

	public void setStopProject(int stopProject) {
		this.stopProject = stopProject;
	}

	public int getIngProject() {
		return ingProject;
	}

	public void setIngProject(int ingProject) {
		this.ingProject = ingProject;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CmypageClientInfo [memId=" + memId + ", userType=" + userType + ", memNick=" + memNick
				+ ", memTypeKind=" + memTypeKind + ", memEmail=" + memEmail + ", ideStatus=" + ideStatus + ", phone="
				+ phone + ", cellPhone=" + cellPhone + ", proImg=" + proImg + ", addProject=" + addProject
				+ ", stopProject=" + stopProject + ", ingProject=" + ingProject + ", introduction=" + introduction
				+ ", url=" + url + "]";
	}
	
}

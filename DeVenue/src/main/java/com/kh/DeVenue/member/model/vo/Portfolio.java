package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.DeVenue.project.model.vo.Tech;

public class Portfolio implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4099163562829157053L;
	private int portId;//포트폴리오아이디
	private Profile profileId;//프로필
	private String mCategory;//메인카테고리
	private String dCategory;//세부카테고리
	private String portName;//포트폴리오이름
	private int portJoin;//포트폴리오 프로젝트 참여도
	private String portContent;//포트폴리오 내용
	private Date startDate;//포트폴리오 프로젝트 시작일
	private Date endDate;//포트폴리오 프로젝트 종료일
	private ArrayList<Tech> tech;//포트폴리오 기술
	private ArrayList<Image> image;//포트폴리오 이미지
	
	
	public Portfolio() {
		super();
	}


	public Portfolio(int portId, Profile profileId, String mCategory, String dCategory, String portName, int portJoin,
			String portContent, Date startDate, Date endDate, ArrayList<Tech> tech, ArrayList<Image> image) {
		super();
		this.portId = portId;
		this.profileId = profileId;
		this.mCategory = mCategory;
		this.dCategory = dCategory;
		this.portName = portName;
		this.portJoin = portJoin;
		this.portContent = portContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.tech = tech;
		this.image = image;
	}


	public int getPortId() {
		return portId;
	}


	public void setPortId(int portId) {
		this.portId = portId;
	}


	public Profile getProfileId() {
		return profileId;
	}


	public void setProfileId(Profile profileId) {
		this.profileId = profileId;
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


	public String getPortName() {
		return portName;
	}


	public void setPortName(String portName) {
		this.portName = portName;
	}


	public int getPortJoin() {
		return portJoin;
	}


	public void setPortJoin(int portJoin) {
		this.portJoin = portJoin;
	}


	public String getPortContent() {
		return portContent;
	}


	public void setPortContent(String portContent) {
		this.portContent = portContent;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public ArrayList<Tech> getTech() {
		return tech;
	}


	public void setTech(ArrayList<Tech> tech) {
		this.tech = tech;
	}


	public ArrayList<Image> getImage() {
		return image;
	}


	public void setImage(ArrayList<Image> image) {
		this.image = image;
	}


	@Override
	public String toString() {
		return "Portfolio [portId=" + portId + ", profileId=" + profileId + ", mCategory=" + mCategory + ", dCategory="
				+ dCategory + ", portName=" + portName + ", portJoin=" + portJoin + ", portContent=" + portContent
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", tech=" + tech + ", image=" + image + "]";
	}
	
	
	
	
}

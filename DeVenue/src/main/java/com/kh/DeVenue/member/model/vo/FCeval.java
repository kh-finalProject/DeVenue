package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;
import java.util.ArrayList;

import com.kh.DeVenue.project.model.vo.Tech;

public class FCeval implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4729240150116368737L;

	private int memId;
	private String memNick;		// 닉네임
	private String memTypeKind;
	private String ideStatus;	// 신원확인
	private int phone;			// 번호등록
	private String profileImg;
	private int avgEagv;		// 
	private int stopProject;
	private int ingProject;
	private int completeProject;
//	private ArrayList<CPeval> evalList;
	
	public FCeval() {
		super();
	}

	public FCeval(int memId, String memNick, String memTypeKind, String ideStatus, int phone, String profileImg,
			int avgEagv, int stopProject, int ingProject, int completeProject) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.memTypeKind = memTypeKind;
		this.ideStatus = ideStatus;
		this.phone = phone;
		this.profileImg = profileImg;
		this.avgEagv = avgEagv;
		this.stopProject = stopProject;
		this.ingProject = ingProject;
		this.completeProject = completeProject;
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

	public String getMemTypeKind() {
		return memTypeKind;
	}

	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
	}

	public String getIdeStatus() {
		return ideStatus;
	}

	public void setIdeStatus(String ideStatus) {
		this.ideStatus = ideStatus;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public int getAvgEagv() {
		return avgEagv;
	}

	public void setAvgEagv(int avgEagv) {
		this.avgEagv = avgEagv;
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

	public int getCompleteProject() {
		return completeProject;
	}

	public void setCompleteProject(int completeProject) {
		this.completeProject = completeProject;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FCeval [memId=" + memId + ", memNick=" + memNick + ", memTypeKind=" + memTypeKind + ", ideStatus="
				+ ideStatus + ", phone=" + phone + ", profileImg=" + profileImg + ", avgEagv=" + avgEagv
				+ ", stopProject=" + stopProject + ", ingProject=" + ingProject + ", completeProject=" + completeProject
				+ "]";
	}
	
	
	

	
	
}

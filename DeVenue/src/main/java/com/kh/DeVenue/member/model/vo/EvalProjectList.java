package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class EvalProjectList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7293933183393068227L;

	private int memId;
	private String memNick;		// 닉네임
	private String memTypeKind;
	private String ideStatus;	// 신원확인
	private String phone;			// 번호등록
	private String profileImg;
	private String proId;		// 프로젝트 번호
	private String proName;		// 프로젝트 이름
	
	public EvalProjectList() {
		super();
	}

	public EvalProjectList(int memId, String memNick, String memTypeKind, String ideStatus, String phone,
			String profileImg, String proId, String proName) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.memTypeKind = memTypeKind;
		this.ideStatus = ideStatus;
		this.phone = phone;
		this.profileImg = profileImg;
		this.proId = proId;
		this.proName = proName;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "EvalProjectList [memId=" + memId + ", memNick=" + memNick + ", memTypeKind=" + memTypeKind
				+ ", ideStatus=" + ideStatus + ", phone=" + phone + ", profileImg=" + profileImg + ", proId=" + proId
				+ ", proName=" + proName + "]";
	}
	
}

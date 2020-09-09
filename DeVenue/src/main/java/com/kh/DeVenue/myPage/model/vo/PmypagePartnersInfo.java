package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class PmypagePartnersInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4701012731559293968L;
	
	private int memId;
	private String memNick;
	private String memTypeKind;
	private String email;
	private String iStatus;
	private String phone;
	private String cellPhone;
	private String proImg;
	
	public PmypagePartnersInfo() {
		super();
	}

	public PmypagePartnersInfo(int memId, String memNick, String memTypeKind, String email, String iStatus,
			String phone, String cellPhone, String proImg) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.memTypeKind = memTypeKind;
		this.email = email;
		this.iStatus = iStatus;
		this.phone = phone;
		this.cellPhone = cellPhone;
		this.proImg = proImg;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PmypagePartnersInfo [memId=" + memId + ", memNick=" + memNick + ", memTypeKind=" + memTypeKind
				+ ", email=" + email + ", iStatus=" + iStatus + ", phone=" + phone + ", cellPhone=" + cellPhone
				+ ", proImg=" + proImg + "]";
	}
	
	
}

package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class CmypageSuggest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2224754558999827090L;

	private int cId;
	private int pId;
	private String memNick;
	private String memTypeKind;
	private String mcType;
	private int career;
	private String proName;
	
	public CmypageSuggest() {
		super();
	}

	public CmypageSuggest(int cId, int pId, String memNick, String memTypeKind, String mcType, int career,
			String proName) {
		super();
		this.cId = cId;
		this.pId = pId;
		this.memNick = memNick;
		this.memTypeKind = memTypeKind;
		this.mcType = mcType;
		this.career = career;
		this.proName = proName;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
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

	public String getMcType() {
		return mcType;
	}

	public void setMcType(String mcType) {
		this.mcType = mcType;
	}

	public int getCareer() {
		return career;
	}

	public void setCareer(int career) {
		this.career = career;
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
		return "CmypageSuggest [cId=" + cId + ", pId=" + pId + ", memNick=" + memNick + ", memTypeKind=" + memTypeKind
				+ ", mcType=" + mcType + ", career=" + career + ", proName=" + proName + "]";
	}

			
}

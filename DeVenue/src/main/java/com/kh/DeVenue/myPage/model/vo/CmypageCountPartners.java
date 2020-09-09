package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class CmypageCountPartners implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7616684067789201037L;

	private int memId;
	private int countPartners;

	public CmypageCountPartners() {
		super();
	}

	public CmypageCountPartners(int memId, int countPartners) {
		super();
		this.memId = memId;
		this.countPartners = countPartners;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public int getCountPartners() {
		return countPartners;
	}

	public void setCountPartners(int countPartners) {
		this.countPartners = countPartners;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CmypageCountPartners [memId=" + memId + ", countPartners=" + countPartners + "]";
	}
	
}

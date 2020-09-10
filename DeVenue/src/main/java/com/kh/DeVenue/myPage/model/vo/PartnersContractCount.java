package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class PartnersContractCount implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5970287635425245628L;
	
	private int memId;
	private int countContract;
	
	public PartnersContractCount() {
		super();
	}

	public PartnersContractCount(int memId, int countContract) {
		super();
		this.memId = memId;
		this.countContract = countContract;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public int getCountContract() {
		return countContract;
	}

	public void setCountContract(int countContract) {
		this.countContract = countContract;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PartnersContractCount [memId=" + memId + ", countContract=" + countContract + "]";
	}
	
}

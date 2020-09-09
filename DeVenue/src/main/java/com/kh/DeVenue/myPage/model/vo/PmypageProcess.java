package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PmypageProcess implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6004298334976295494L;

	private String proName;
	private String mcType;
	private String dcType;
	private int proPayment;
	private Date proStartDate;
	private Date endDate;
	private int countPartners;
	private int memId;
	
	public PmypageProcess() {
		super();
	}

	public PmypageProcess(String proName, String mcType, String dcType, int proPayment, Date proStartDate, Date endDate,
			int countPartners, int memId) {
		super();
		this.proName = proName;
		this.mcType = mcType;
		this.dcType = dcType;
		this.proPayment = proPayment;
		this.proStartDate = proStartDate;
		this.endDate = endDate;
		this.countPartners = countPartners;
		this.memId = memId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getMcType() {
		return mcType;
	}

	public void setMcType(String mcType) {
		this.mcType = mcType;
	}

	public String getDcType() {
		return dcType;
	}

	public void setDcType(String dcType) {
		this.dcType = dcType;
	}

	public int getProPayment() {
		return proPayment;
	}

	public void setProPayment(int proPayment) {
		this.proPayment = proPayment;
	}

	public Date getProStartDate() {
		return proStartDate;
	}

	public void setProStartDate(Date proStartDate) {
		this.proStartDate = proStartDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getCountPartners() {
		return countPartners;
	}

	public void setCountPartners(int countPartners) {
		this.countPartners = countPartners;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PmypageProcess [proName=" + proName + ", mcType=" + mcType + ", dcType=" + dcType + ", proPayment="
				+ proPayment + ", countPartners=" + countPartners + ", memId=" + memId + "]";
	}
	
}

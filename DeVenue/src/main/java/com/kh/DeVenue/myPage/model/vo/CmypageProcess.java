package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CmypageProcess implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 931668520939791247L;
	
	private int memId;
	private String proName;
	private String mcType;
	private String dcType;
	private int proPayment;
	private Date proStartDate;
	private Date proEndDate;
	
	public CmypageProcess() {
		super();
	}

	public CmypageProcess(int memId, String proName, String mcType, String dcType, int proPayment, Date proStartDate,
			Date proEndDate) {
		super();
		this.memId = memId;
		this.proName = proName;
		this.mcType = mcType;
		this.dcType = dcType;
		this.proPayment = proPayment;
		this.proStartDate = proStartDate;
		this.proEndDate = proEndDate;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
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

	public Date getProEndDate() {
		return proEndDate;
	}

	public void setProEndDate(Date proEndDate) {
		this.proEndDate = proEndDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CmypageProcess [memId=" + memId + ", proName=" + proName + ", mcType=" + mcType + ", dcType=" + dcType
				+ ", proPayment=" + proPayment + ", proStartDate=" + proStartDate + ", proEndDate=" + proEndDate + "]";
	}
	
}

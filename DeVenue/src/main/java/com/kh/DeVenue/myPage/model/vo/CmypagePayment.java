package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CmypagePayment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1420869928395049615L;
	
	private int memId;
	private int proId;
	private String proName;
	private String mcType;
	private String dcType;
	private Date proREndDate;
	private int payment;
	private int applyCount;
	
	public CmypagePayment() {
		super();
	}

	public CmypagePayment(int memId, int proId, String proName, String mcType, String dcType, Date proREndDate,
			int payment, int applyCount) {
		super();
		this.memId = memId;
		this.proId = proId;
		this.proName = proName;
		this.mcType = mcType;
		this.dcType = dcType;
		this.proREndDate = proREndDate;
		this.payment = payment;
		this.applyCount = applyCount;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
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

	public Date getProREndDate() {
		return proREndDate;
	}

	public void setProREndDate(Date proREndDate) {
		this.proREndDate = proREndDate;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getApplyCount() {
		return applyCount;
	}

	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CmypagePayment [memId=" + memId + ", proId=" + proId + ", proName=" + proName + ", mcType=" + mcType
				+ ", dcType=" + dcType + ", proREndDate=" + proREndDate + ", payment=" + payment + ", applyCount="
				+ applyCount + "]";
	}
	
}

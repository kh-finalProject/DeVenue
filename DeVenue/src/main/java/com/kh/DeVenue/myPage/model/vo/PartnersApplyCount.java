package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PartnersApplyCount implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8945304377944248037L;
	
	private int proAid;
	private int memPid;
	private int proId;
	private int proApayment;
	private int proAduration;
	private String proAcontent;
	private String proAresume;
	private String proRearesume;
	private Date proApplyDate;
	private String proAsaveStatus;
	private String proAstatus;
	
	public PartnersApplyCount() {
		super();
	}

	public PartnersApplyCount(int proAid, int memPid, int proId, int proApayment, int proAduration, String proAcontent,
			String proAresume, String proRearesume, Date proApplyDate, String proAsaveStatus, String proAstatus) {
		super();
		this.proAid = proAid;
		this.memPid = memPid;
		this.proId = proId;
		this.proApayment = proApayment;
		this.proAduration = proAduration;
		this.proAcontent = proAcontent;
		this.proAresume = proAresume;
		this.proRearesume = proRearesume;
		this.proApplyDate = proApplyDate;
		this.proAsaveStatus = proAsaveStatus;
		this.proAstatus = proAstatus;
	}

	public int getProAid() {
		return proAid;
	}

	public void setProAid(int proAid) {
		this.proAid = proAid;
	}

	public int getMemPid() {
		return memPid;
	}

	public void setMemPid(int memPid) {
		this.memPid = memPid;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public int getProApayment() {
		return proApayment;
	}

	public void setProApayment(int proApayment) {
		this.proApayment = proApayment;
	}

	public int getProAduration() {
		return proAduration;
	}

	public void setProAduration(int proAduration) {
		this.proAduration = proAduration;
	}

	public String getProAcontent() {
		return proAcontent;
	}

	public void setProAcontent(String proAcontent) {
		this.proAcontent = proAcontent;
	}

	public String getProAresume() {
		return proAresume;
	}

	public void setProAresume(String proAresume) {
		this.proAresume = proAresume;
	}

	public String getProRearesume() {
		return proRearesume;
	}

	public void setProRearesume(String proRearesume) {
		this.proRearesume = proRearesume;
	}

	public Date getProApplyDate() {
		return proApplyDate;
	}

	public void setProApplyDate(Date proApplyDate) {
		this.proApplyDate = proApplyDate;
	}

	public String getProAsaveStatus() {
		return proAsaveStatus;
	}

	public void setProAsaveStatus(String proAsaveStatus) {
		this.proAsaveStatus = proAsaveStatus;
	}

	public String getProAstatus() {
		return proAstatus;
	}

	public void setProAstatus(String proAstatus) {
		this.proAstatus = proAstatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PartnersApplyCount [proAid=" + proAid + ", memPid=" + memPid + ", proId=" + proId + ", proApayment="
				+ proApayment + ", proAduration=" + proAduration + ", proAcontent=" + proAcontent + ", proAresume="
				+ proAresume + ", proRearesume=" + proRearesume + ", proApplyDate=" + proApplyDate + ", proAsaveStatus="
				+ proAsaveStatus + ", proAstatus=" + proAstatus + "]";
	}
	
}

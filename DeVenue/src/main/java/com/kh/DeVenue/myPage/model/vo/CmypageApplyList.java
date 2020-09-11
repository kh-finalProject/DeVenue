package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class CmypageApplyList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2308734421555171833L;

	private int proId;
	private int memPid;
	private String memNick;
	private int proPayment;
	
	public CmypageApplyList() {
		super();
	}
	public CmypageApplyList(int proId, int memPid, String memNick, int proPayment) {
		super();
		this.proId = proId;
		this.memPid = memPid;
		this.memNick = memNick;
		this.proPayment = proPayment;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public int getMemPid() {
		return memPid;
	}
	public void setMemPid(int memPid) {
		this.memPid = memPid;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public int getProPayment() {
		return proPayment;
	}
	public void setProPayment(int proPayment) {
		this.proPayment = proPayment;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "CmypageApplyList [proId=" + proId + ", memPid=" + memPid + ", memNick=" + memNick + ", proPayment="
				+ proPayment + "]";
	}
	
	
}

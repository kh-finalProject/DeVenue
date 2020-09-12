package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class EPid implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6490030013080055449L;

	private int epId;
	private int memId;
	private int eTarget;
	private int proId;
	
	public EPid() {
		super();
	}

	public EPid(int epId, int memId, int eTarget, int proId) {
		super();
		this.epId = epId;
		this.memId = memId;
		this.eTarget = eTarget;
		this.proId = proId;
	}

	public int getEpId() {
		return epId;
	}

	public void setEpId(int epId) {
		this.epId = epId;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public int geteTarget() {
		return eTarget;
	}

	public void seteTarget(int eTarget) {
		this.eTarget = eTarget;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "EPid [epId=" + epId + ", memId=" + memId + ", eTarget=" + eTarget + ", proId=" + proId + "]";
	}

	
}

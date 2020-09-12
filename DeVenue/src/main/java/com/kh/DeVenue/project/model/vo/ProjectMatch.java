package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;

// 매칭 파트너스
public class ProjectMatch implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8248024764313490938L;
	private int proPmId;
	private int proPid;
	private int memId;
	private int sigId;
	public ProjectMatch() {
		super();
	}
	public ProjectMatch(int proPmId, int proPid, int memId, int sigId) {
		super();
		this.proPmId = proPmId;
		this.proPid = proPid;
		this.memId = memId;
		this.sigId = sigId;
	}
	public int getProPmId() {
		return proPmId;
	}
	public void setProPmId(int proPmId) {
		this.proPmId = proPmId;
	}
	public int getProPid() {
		return proPid;
	}
	public void setProPid(int proPid) {
		this.proPid = proPid;
	}
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public int getSigId() {
		return sigId;
	}
	public void setSigId(int sigId) {
		this.sigId = sigId;
	}
	@Override
	public String toString() {
		return "ProjectMatch [proPmId=" + proPmId + ", proPid=" + proPid + ", memId=" + memId + ", sigId=" + sigId
				+ "]";
	}
	
	
}

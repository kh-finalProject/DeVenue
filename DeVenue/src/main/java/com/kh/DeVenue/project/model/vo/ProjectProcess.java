package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;

// 진행중인 프로젝트
public class ProjectProcess implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5046774012519958315L;
	private int proPid;
	private int proId;
	public ProjectProcess() {
		super();
	}
	public ProjectProcess(int proPid, int proId) {
		super();
		this.proPid = proPid;
		this.proId = proId;
	}
	public int getProPid() {
		return proPid;
	}
	public void setProPid(int proPid) {
		this.proPid = proPid;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	@Override
	public String toString() {
		return "ProjectProcess [proPid=" + proPid + ", proId=" + proId + "]";
	}
	
	
}

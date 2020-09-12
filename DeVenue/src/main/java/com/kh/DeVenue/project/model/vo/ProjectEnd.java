package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;

// 종료된 프로젝트
public class ProjectEnd implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9180007231428545631L;
	
	private int epId;
	private int proId;
	private int proPmId;
	public ProjectEnd() {
		super();
	}
	public ProjectEnd(int epId, int proId, int proPmId) {
		super();
		this.epId = epId;
		this.proId = proId;
		this.proPmId = proPmId;
	}
	public int getEpId() {
		return epId;
	}
	public void setEpId(int epId) {
		this.epId = epId;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public int getProPmId() {
		return proPmId;
	}
	public void setProPmId(int proPmId) {
		this.proPmId = proPmId;
	}
	@Override
	public String toString() {
		return "ProjectEnd [epId=" + epId + ", proId=" + proId + ", proPmId=" + proPmId + "]";
	}
	
	
	
}

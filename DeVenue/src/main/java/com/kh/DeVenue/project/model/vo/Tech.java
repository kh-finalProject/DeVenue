package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;

public class Tech implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7148907688144373749L;
	private int pId; //프로젝트 id
	private String tId; //기술 id
	private String tName; //기술 이름
	
	public Tech() {
		super();
	}

	public Tech(int pId, String tId, String tName) {
		super();
		this.pId = pId;
		this.tId = tId;
		this.tName = tName;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String gettId() {
		return tId;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	@Override
	public String toString() {
		return "Tech [pId=" + pId + ", tId=" + tId + ", tName=" + tName + "]";
	}
	
	
	
	

}

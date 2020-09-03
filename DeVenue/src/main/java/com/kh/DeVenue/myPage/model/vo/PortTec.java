package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class PortTec implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8352878437365120008L;
	private int portId;
	private String tId;
	private int ptId;
	public PortTec() {
		super();
	}
	
	public PortTec(int portId, String tId, int ptId) {
		super();
		this.portId = portId;
		this.tId = tId;
		this.ptId = ptId;
	}
	
	// 포트폴리오 기술 테이블 생성용
	public PortTec(int portId, String tId) {
		super();
		this.portId = portId;
		this.tId = tId;
	}

	public int getPortId() {
		return portId;
	}

	public void setPortId(int portId) {
		this.portId = portId;
	}
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	public int getPtId() {
		return ptId;
	}
	public void setPtId(int ptId) {
		this.ptId = ptId;
	}
	@Override
	public String toString() {
		return "PortTec [portId=" + portId + ", tId=" + tId + ", ptId=" + ptId + "]";
	}
	
	
}

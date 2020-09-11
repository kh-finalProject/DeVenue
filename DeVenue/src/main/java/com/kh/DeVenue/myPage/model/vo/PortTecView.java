package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class PortTecView implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3313296468510015544L;
	private int portId;
	private String tId;
	private String tName;
	public PortTecView() {
		super();
	}
	public PortTecView(int portId, String tId, String tName) {
		super();
		this.portId = portId;
		this.tId = tId;
		this.tName = tName;
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
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	@Override
	public String toString() {
		return "PortTecView [portId=" + portId + ", tId=" + tId + ", tName=" + tName + "]";
	}
	
	
}

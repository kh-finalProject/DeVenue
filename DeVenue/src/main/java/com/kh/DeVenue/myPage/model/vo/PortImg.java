package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class PortImg implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 869555929913299582L;
	
	private int portImgId;
	private int portId;
	private String portImgContent;
	private String portImgPath;
	public PortImg() {
		super();
	}
	public PortImg(int portImgId, int portId, String portImgContent, String portImgPath) {
		super();
		this.portImgId = portImgId;
		this.portId = portId;
		this.portImgContent = portImgContent;
		this.portImgPath = portImgPath;
	}
	
	// 포트폴리오이미지 insert용
	public PortImg(int portId, String portImgContent, String portImgPath) {
		super();
		this.portId = portId;
		this.portImgContent = portImgContent;
		this.portImgPath = portImgPath;
	}	
	
	public int getPortImgId() {
		return portImgId;
	}
	public void setPortImgId(int portImgId) {
		this.portImgId = portImgId;
	}
	public int getPortId() {
		return portId;
	}
	public void setPortId(int portId) {
		this.portId = portId;
	}
	public String getPortImgContent() {
		return portImgContent;
	}
	public void setPortImgContent(String portImgContent) {
		this.portImgContent = portImgContent;
	}
	public String getPortImgPath() {
		return portImgPath;
	}
	public void setPortImgPath(String portImgPath) {
		this.portImgPath = portImgPath;
	}
	@Override
	public String toString() {
		return "PortImg [portImgId=" + portImgId + ", portId=" + portId + ", portImgContent=" + portImgContent
				+ ", portImgPath=" + portImgPath + "]";
	}
	
	
}

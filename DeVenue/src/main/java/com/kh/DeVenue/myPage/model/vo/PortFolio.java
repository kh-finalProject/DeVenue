package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PortFolio implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1511588030544721629L;
	
	private int portId;
	private int profileId;
	private String mcId;
	private String dcId;
	private String portName;
	private int portJoin;
	private String content;
	private String portStartDate;
	private String portEndDate;
	public PortFolio() {
		super();
	}
	public PortFolio(int portId, int profileId, String mcId, String dcId, String portName, int portJoin, String content,
			String portStartDate, String portEndDate) {
		super();
		this.portId = portId;
		this.profileId = profileId;
		this.mcId = mcId;
		this.dcId = dcId;
		this.portName = portName;
		this.portJoin = portJoin;
		this.content = content;
		this.portStartDate = portStartDate;
		this.portEndDate = portEndDate;
	}
	
	// 포트폴리오 추가용M
	public PortFolio(int profileId, String mcId, String dcId, String portName, int portJoin, String content,
			String portStartDate, String portEndDate) {
		super();
		this.profileId = profileId;
		this.mcId = mcId;
		this.dcId = dcId;
		this.portName = portName;
		this.portJoin = portJoin;
		this.content = content;
		this.portStartDate = portStartDate;
		this.portEndDate = portEndDate;
	}
	
	// 포트폴리오 id 찾기
	public PortFolio(int profileId) {
		super();
		this.profileId = profileId;
	}	
	
	public int getPortId() {
		return portId;
	}
	public void setPortId(int portId) {
		this.portId = portId;
	}
	public int getprofileId() {
		return profileId;
	}
	public void setprofileId(int profileId) {
		this.profileId = profileId;
	}
	public String getMcId() {
		return mcId;
	}
	public void setMcId(String mcId) {
		this.mcId = mcId;
	}
	public String getDcId() {
		return dcId;
	}
	public void setDcId(String dcId) {
		this.dcId = dcId;
	}
	public String getPortName() {
		return portName;
	}
	public void setPortName(String portName) {
		this.portName = portName;
	}
	public int getPortJoin() {
		return portJoin;
	}
	public void setPortJoin(int portJoin) {
		this.portJoin = portJoin;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPortStartDate() {
		return portStartDate;
	}
	public void setPortStartDate(String portStartDate) {
		this.portStartDate = portStartDate;
	}
	public String getPortEndDate() {
		return this.portEndDate;
	}
	public void setPortEndDate(String portEndDate) {
		this.portEndDate = portEndDate;
	}
	@Override
	public String toString() {
		return "PortFolio [portId=" + portId + ", profileId=" + profileId + ", mcId=" + mcId + ", dcId=" + dcId
				+ ", portName=" + portName + ", portJoin=" + portJoin + ", content=" + content + ", portStartDate="
				+ portStartDate + ", portEndDate=" + portEndDate + "]";
	}
	
	
}

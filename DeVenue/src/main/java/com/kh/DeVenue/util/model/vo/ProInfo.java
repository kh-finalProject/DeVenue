package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

public class ProInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8254895408463029370L;
	private int proId;
	private String clientId;
	private String partnersId;
	private String proName;
	private String proStatId;
	private String proStatName;
	private String proSummary;
	private String proStartDate;
	private String proEndDate;
	private int proDuration;
	private String proWorkPlace;
	private int proPayment;
	
	
	public ProInfo() {
	}
	public ProInfo(int proId, String clientId, String partnersId, String proName, String proStatId, String proStatName, String proSummary, String proStartDate, String proEndDate, int proDuration, String proWorkPlace, int proPayment) {
		this.proId = proId;
		this.clientId = clientId;
		this.partnersId = partnersId;
		this.proName = proName;
		this.proStatId = proStatId;
		this.proStatName = proStatName;
		this.proSummary = proSummary;
		this.proStartDate = proStartDate;
		this.proEndDate = proEndDate;
		this.proDuration = proDuration;
		this.proWorkPlace = proWorkPlace;
		this.proPayment = proPayment;
	}
	
	
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getPartnersId() {
		return partnersId;
	}
	public void setPartnersId(String partnersId) {
		this.partnersId = partnersId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProStatId() {
		return proStatId;
	}
	public void setProStatId(String proStatId) {
		this.proStatId = proStatId;
	}
	public String getProStatName() {
		return proStatName;
	}
	public void setProStatName(String proStatName) {
		this.proStatName = proStatName;
	}
	public String getProSummary() {
		return proSummary;
	}
	public void setProSummary(String proSummary) {
		this.proSummary = proSummary;
	}
	public String getProStartDate() {
		return proStartDate;
	}
	public void setProStartDate(String proStartDate) {
		this.proStartDate = proStartDate;
	}
	public String getProEndDate() {
		return proEndDate;
	}
	public void setProEndDate(String proEndDate) {
		this.proEndDate = proEndDate;
	}
	public int getProDuration() {
		return proDuration;
	}
	public void setProDuration(int proDuration) {
		this.proDuration = proDuration;
	}
	public String getProWorkPlace() {
		return proWorkPlace;
	}
	public void setProWorkPlace(String proWorkPlace) {
		this.proWorkPlace = proWorkPlace;
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
		return "ProInfo [proId=" + proId + ", clientId=" + clientId + ", partnersId=" + partnersId + ", proName=" + proName + ", proStatId=" + proStatId + ", proStatName=" + proStatName + ", proSummary=" + proSummary + ", proStartDate=" + proStartDate + ", proEndDate=" + proEndDate + ", proDuration=" + proDuration + ", proWorkPlace=" + proWorkPlace + ", proPayment=" + proPayment + "]";
	}
	
	
}

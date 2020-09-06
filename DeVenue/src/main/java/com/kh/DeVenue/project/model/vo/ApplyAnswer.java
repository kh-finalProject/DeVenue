package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ApplyAnswer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7989465515075020316L;
	
	private int aaId;//지원답변 아이디
	private String aaContent;//답변 내용
	private int aqId;//질문 아이디
	private String aqContent;//질문 내용
	private int aId;// 지원서 아이디
	private Date aaCDate;//생성일
	
	public ApplyAnswer() {
		super();
	}
	public ApplyAnswer(int aaId, String aaContent, int aqId, String aqContent, int aId, Date aaCDate) {
		super();
		this.aaId = aaId;
		this.aaContent = aaContent;
		this.aqId = aqId;
		this.aqContent = aqContent;
		this.aId = aId;
		this.aaCDate = aaCDate;
	}
	public int getAaId() {
		return aaId;
	}
	public void setAaId(int aaId) {
		this.aaId = aaId;
	}
	public String getAaContent() {
		return aaContent;
	}
	public void setAaContent(String aaContent) {
		this.aaContent = aaContent;
	}
	public int getAqId() {
		return aqId;
	}
	public void setAqId(int aqId) {
		this.aqId = aqId;
	}
	public String getAqContent() {
		return aqContent;
	}
	public void setAqContent(String aqContent) {
		this.aqContent = aqContent;
	}
	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
	}
	public Date getAaCDate() {
		return aaCDate;
	}
	public void setAaCDate(Date aaCDate) {
		this.aaCDate = aaCDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ApplyAnswer [aaId=" + aaId + ", aaContent=" + aaContent + ", aqId=" + aqId + ", aqContent=" + aqContent
				+ ", aId=" + aId + ", aaCDate=" + aaCDate + "]";
	}
	
	
	

}

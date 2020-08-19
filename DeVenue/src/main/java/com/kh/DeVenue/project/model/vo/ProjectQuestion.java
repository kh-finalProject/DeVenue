package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ProjectQuestion implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int proAQId; //지원전질문 id
	private String proAQContent; //질문내용
 	private Date proAQCDate; //질문등록일
 	private int proId; //프로젝트 id 
	public ProjectQuestion() {
		super();
	}
	public ProjectQuestion(int proAQId, String proAQContent, Date proAQCDate, int proId) {
		super();
		this.proAQId = proAQId;
		this.proAQContent = proAQContent;
		this.proAQCDate = proAQCDate;
		this.proId = proId;
	}
	public int getProAQId() {
		return proAQId;
	}
	public void setProAQId(int proAQId) {
		this.proAQId = proAQId;
	}
	public String getProAQContent() {
		return proAQContent;
	}
	public void setProAQContent(String proAQContent) {
		this.proAQContent = proAQContent;
	}
	public Date getProAQCDate() {
		return proAQCDate;
	}
	public void setProAQCDate(Date proAQCDate) {
		this.proAQCDate = proAQCDate;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ProjectQuestion [proAQId=" + proAQId + ", proAQContent=" + proAQContent + ", proAQCDate=" + proAQCDate
				+ ", proId=" + proId + "]";
	}

  
}

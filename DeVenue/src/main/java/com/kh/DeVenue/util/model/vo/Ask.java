package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;
import java.sql.Date;

// 챗봇 데이터용 객체
public class Ask implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4882796465727376923L;
	private int askId;
	private String askTitle;
	private String askContent;
	private String askKeyword;
	private Date askCreateDate;
	private Date askModifyDate;
	
	
	public Ask() {
	}
	public Ask(int askId, String askTitle, String askContent, String askKeyword, Date askCreateDate, Date askModifyDate) {
		this.askId = askId;
		this.askTitle = askTitle;
		this.askContent = askContent;
		this.askKeyword = askKeyword;
		this.askCreateDate = askCreateDate;
		this.askModifyDate = askModifyDate;
	}
	
	
	public int getAskId() {
		return askId;
	}
	public void setAskId(int askId) {
		this.askId = askId;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskContent() {
		return askContent;
	}
	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}
	public String getAskKeyword() {
		return askKeyword;
	}
	public void setAskKeyword(String askKeyword) {
		this.askKeyword = askKeyword;
	}
	public Date getAskCreateDate() {
		return askCreateDate;
	}
	public void setAskCreateDate(Date askCreateDate) {
		this.askCreateDate = askCreateDate;
	}
	public Date getAskModifyDate() {
		return askModifyDate;
	}
	public void setAskModifyDate(Date askModifyDate) {
		this.askModifyDate = askModifyDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "Ask [askId=" + askId + ", askTitle=" + askTitle + ", askContent=" + askContent + ", askKeyword=" + askKeyword + ", askCreateDate=" + askCreateDate + ", askModifyDate=" + askModifyDate + "]";
	}
	
	
}

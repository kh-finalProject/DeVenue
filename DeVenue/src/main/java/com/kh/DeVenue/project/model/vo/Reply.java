package com.kh.DeVenue.project.model.vo;

import java.sql.Date;

import com.kh.DeVenue.member.model.vo.Member;

public class Reply {

	private int rId;
	private int pId;
	private Member writer;
	private String rContent;
	private Date rCreateDate;
	private Date rModifyDate;
	private String rAnswerStatus;
	private String rStatus;
	private int parentRId;
	private String rSecret;
	
	public Reply() {
		super();
	}

	public Reply(int rId, int pId, Member writer, String rContent, Date rCreateDate, Date rModifyDate,
			String rAnswerStatus, String rStatus, int parentRId, String rSecret) {
		super();
		this.rId = rId;
		this.pId = pId;
		this.writer = writer;
		this.rContent = rContent;
		this.rCreateDate = rCreateDate;
		this.rModifyDate = rModifyDate;
		this.rAnswerStatus = rAnswerStatus;
		this.rStatus = rStatus;
		this.parentRId = parentRId;
		this.rSecret = rSecret;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public Member getWriter() {
		return writer;
	}

	public void setWriter(Member writer) {
		this.writer = writer;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Date rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Date getrModifyDate() {
		return rModifyDate;
	}

	public void setrModifyDate(Date rModifyDate) {
		this.rModifyDate = rModifyDate;
	}

	public String getrAnswerStatus() {
		return rAnswerStatus;
	}

	public void setrAnswerStatus(String rAnswerStatus) {
		this.rAnswerStatus = rAnswerStatus;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public int getParentRId() {
		return parentRId;
	}

	public void setParentRId(int parentRId) {
		this.parentRId = parentRId;
	}

	public String getrSecret() {
		return rSecret;
	}

	public void setrSecret(String rSecret) {
		this.rSecret = rSecret;
	}

	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", pId=" + pId + ", writer=" + writer + ", rContent=" + rContent + ", rCreateDate="
				+ rCreateDate + ", rModifyDate=" + rModifyDate + ", rAnswerStatus=" + rAnswerStatus + ", rStatus="
				+ rStatus + ", parentRId=" + parentRId + ", rSecret=" + rSecret + "]";
	}
	
	
	
	
	
	
	
	
}

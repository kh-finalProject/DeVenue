package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;

import com.kh.DeVenue.member.model.vo.Portfolio;

public class ApplyPortfolio implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4186732335507488616L;
	private int apId;//지원포트폴리오아이디
	private int proAId;//지원서 아이디
	private int portId;//포트폴리오 아이디
	private Portfolio portfolio;//포트폴리오
	private String apContent;//포트폴리오 설명
	
	public ApplyPortfolio() {
		super();
	}

	public ApplyPortfolio(int apId, int proAId, int portId, Portfolio portfolio, String apContent) {
		super();
		this.apId = apId;
		this.proAId = proAId;
		this.portId = portId;
		this.portfolio = portfolio;
		this.apContent = apContent;
	}

	public int getApId() {
		return apId;
	}

	public void setApId(int apId) {
		this.apId = apId;
	}

	public int getProAId() {
		return proAId;
	}

	public void setProAId(int proAId) {
		this.proAId = proAId;
	}

	public int getPortId() {
		return portId;
	}

	public void setPortId(int portId) {
		this.portId = portId;
	}

	public Portfolio getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(Portfolio portfolio) {
		this.portfolio = portfolio;
	}

	public String getApContent() {
		return apContent;
	}

	public void setApContent(String apContent) {
		this.apContent = apContent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ApplyPortfolio [apId=" + apId + ", proAId=" + proAId + ", portId=" + portId + ", portfolio=" + portfolio
				+ ", apContent=" + apContent + "]";
	}
	
	
	
	

}

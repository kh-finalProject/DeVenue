package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class MatchingPartnersList implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5373411486948261947L;

	private int proPmId;	// 매칭파트너스 주식별자
	private int partnersId;	// 파트너스 아이디
	private String partnersNick;	// 파트너스 닉네임
	private String proName;		// 프로젝트 이름
	private int clientId;	// 클라이언트 아이디
	private String clientNick;	// 클라이언트 닉네임
	
	public MatchingPartnersList() {
		super();
	}

	public MatchingPartnersList(int proPmId, int partnersId, String partnersNick, String proName, int clientId,
			String clientNick) {
		super();
		this.proPmId = proPmId;
		this.partnersId = partnersId;
		this.partnersNick = partnersNick;
		this.proName = proName;
		this.clientId = clientId;
		this.clientNick = clientNick;
	}

	public int getProPmId() {
		return proPmId;
	}

	public void setProPmId(int proPmId) {
		this.proPmId = proPmId;
	}

	public int getPartnersId() {
		return partnersId;
	}

	public void setPartnersId(int partnersId) {
		this.partnersId = partnersId;
	}

	public String getPartnersNick() {
		return partnersNick;
	}

	public void setPartnersNick(String partnersNick) {
		this.partnersNick = partnersNick;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public String getClientNick() {
		return clientNick;
	}

	public void setClientNick(String clientNick) {
		this.clientNick = clientNick;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MatchingPartnersList [proPmId=" + proPmId + ", partnersId=" + partnersId + ", partnersNick="
				+ partnersNick + ", proName=" + proName + ", clientId=" + clientId + ", clientNick=" + clientNick + "]";
	}

}

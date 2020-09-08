package com.kh.DeVenue.memberAccount.model.vo;

import java.io.Serializable;

public class Bank implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8147680853686987643L;
	private int bankId;
	private String bankName;
	
	
	public Bank() {
	}
	public Bank(int bankId, String bankName) {
		this.bankId = bankId;
		this.bankName = bankName;
	}
	
	
	public int getBankId() {
		return bankId;
	}
	public void setBankId(int bankId) {
		this.bankId = bankId;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "Bank [bankId=" + bankId + ", bankName=" + bankName + "]";
	}
	
	
}

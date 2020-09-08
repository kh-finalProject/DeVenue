package com.kh.DeVenue.memberAccount.model.vo;

import java.io.Serializable;

public class MemType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7916398255415143792L;
	private String memTypeCode;
	private String memTypeKind;
	
	
	public MemType() {
	}
	public MemType(String memTypeCode, String memTypeKind) {
		this.memTypeCode = memTypeCode;
		this.memTypeKind = memTypeKind;
	}
	public String getMemTypeCode() {
		return memTypeCode;
	}
	public void setMemTypeCode(String memTypeCode) {
		this.memTypeCode = memTypeCode;
	}
	public String getMemTypeKind() {
		return memTypeKind;
	}
	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "MemType [memTypeCode=" + memTypeCode + ", memTypeKind=" + memTypeKind + "]";
	}
	
	
}

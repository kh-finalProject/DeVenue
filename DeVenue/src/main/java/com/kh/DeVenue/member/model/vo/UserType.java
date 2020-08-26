package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class UserType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1487108877628822967L;
	
	private String utCode;
	private String utName;
	public UserType() {
		super();
	}
	public UserType(String utCode, String utName) {
		super();
		this.utCode = utCode;
		this.utName = utName;
	}
	public String getUtCode() {
		return utCode;
	}
	public void setUtCode(String utCode) {
		this.utCode = utCode;
	}
	public String getUtName() {
		return utName;
	}
	public void setUtName(String utName) {
		this.utName = utName;
	}
	@Override
	public String toString() {
		return "UserType [utCode=" + utCode + ", utName=" + utName + "]";
	}
	
	

}

package com.kh.DeVenue.memberAccount.model.vo;

import java.io.Serializable;

// 신고내역 확인(신고자의 이름, 연락처 필요)
public class DeclareDTO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3454671668955709079L;
	private int decId;
	private String fromName;
	private String fromPhone;
	private String decContent;
	
	
	public DeclareDTO() {
	}
	public DeclareDTO(int decId, String fromName, String fromPhone, String decContent) {
		this.decId = decId;
		this.fromName = fromName;
		this.fromPhone = fromPhone;
		this.decContent = decContent;
	}
	
	
	public int getDecId() {
		return decId;
	}
	public void setDecId(int decId) {
		this.decId = decId;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String getFromPhone() {
		return fromPhone;
	}
	public void setFromPhone(String fromPhone) {
		this.fromPhone = fromPhone;
	}
	public String getDecContent() {
		return decContent;
	}
	public void setDecContent(String decContent) {
		this.decContent = decContent;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "DeclareDTO [decId=" + decId + ", fromName=" + fromName + ", fromPhone=" + fromPhone + ", decContent="
				+ decContent + "]";
	}
	
	
	
}

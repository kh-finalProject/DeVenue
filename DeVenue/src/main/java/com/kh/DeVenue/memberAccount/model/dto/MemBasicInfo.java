package com.kh.DeVenue.memberAccount.model.dto;

import java.io.Serializable;

public class MemBasicInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7970365806118974025L;
	private String proImgName;
	private String utName;
	private String mtName;
	private String memName;
	private String address1;
	private String address2;
	private String address3;
	private String taxEmail;
	private String phone;
	private String cellPhone;
	private String faxNo;
	private String bankName;
	private String master;
	private String accNo;
	
	
	public MemBasicInfo() {
	}
	public MemBasicInfo(String proImgName, String utName, String mtName, String memName, String address1,
			String address2, String address3, String taxEmail, String phone, String cellPhone, String faxNo,
			String bankName, String master, String accNo) {
		this.proImgName = proImgName;
		this.utName = utName;
		this.mtName = mtName;
		this.memName = memName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.taxEmail = taxEmail;
		this.phone = phone;
		this.cellPhone = cellPhone;
		this.faxNo = faxNo;
		this.bankName = bankName;
		this.master = master;
		this.accNo = accNo;
	}
	
	
	public String getProImgName() {
		return proImgName;
	}
	public void setProImgName(String proImgName) {
		this.proImgName = proImgName;
	}
	public String getUtName() {
		return utName;
	}
	public void setUtName(String utName) {
		this.utName = utName;
	}
	public String getMtName() {
		return mtName;
	}
	public void setMtName(String mtName) {
		this.mtName = mtName;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getTaxEmail() {
		return taxEmail;
	}
	public void setTaxEmail(String taxEmail) {
		this.taxEmail = taxEmail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getFaxNo() {
		return faxNo;
	}
	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "MemBasicInfo [proImgName=" + proImgName + ", utName=" + utName + ", mtName=" + mtName + ", memName="
				+ memName + ", address1=" + address1 + ", address2=" + address2 + ", address3=" + address3
				+ ", taxEmail=" + taxEmail + ", phone=" + phone + ", cellPhone=" + cellPhone + ", faxNo=" + faxNo
				+ ", bankName=" + bankName + ", master=" + master + ", accNo=" + accNo + "]";
	}
	
	
}

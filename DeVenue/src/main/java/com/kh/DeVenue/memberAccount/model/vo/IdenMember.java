package com.kh.DeVenue.memberAccount.model.vo;

import java.io.Serializable;

// 신원인증 관리를 위한 DTO
public class IdenMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3152944922214623521L;
	private int memId;
	private String memName;
	private String phone;
	private String cellPhone;
	private String faxNo;
	private String memInGroup;
	private String ideName;
	private String ideAddress;
	private String originalFileName;
	private String renameFileName;
	
	
	public IdenMember() {
	}

	public IdenMember(int memId, String memName, String phone, String cellPhone, String faxNo, String memInGroup,
			String ideName, String ideAddress, String originalFileName, String renameFileName) {
		this.memId = memId;
		this.memName = memName;
		this.phone = phone;
		this.cellPhone = cellPhone;
		this.faxNo = faxNo;
		this.memInGroup = memInGroup;
		this.ideName = ideName;
		this.ideAddress = ideAddress;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
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

	public String getMemInGroup() {
		return memInGroup;
	}

	public void setMemInGroup(String memInGroup) {
		this.memInGroup = memInGroup;
	}

	public String getIdeName() {
		return ideName;
	}

	public void setIdeName(String ideName) {
		this.ideName = ideName;
	}

	public String getideAddress() {
		return ideAddress;
	}

	public void setideAddress(String ideAddress) {
		this.ideAddress = ideAddress;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "IdenMember [memId=" + memId + ", memName=" + memName + ", phone=" + phone + ", cellPhone=" + cellPhone
				+ ", faxNo=" + faxNo + ", memInGroup=" + memInGroup + ", ideName=" + ideName + ", ideAddress="
				+ ideAddress + ", originalFileName=" + originalFileName + ", renameFileName=" + renameFileName + "]";
	}
	
}

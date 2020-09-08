package com.kh.DeVenue.memberAccount.model.vo;

import java.io.Serializable;

public class Signature2 implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6816391137577371898L;
	private int id;// 날인 id
	private int memId;// 날인 주인 id
	private String originFileName;// 원본파일명
	private String renameFileName;// 수정파일명
	private String sigType;// 날인구분(도장인지 서명인지)
	private String isMain;// 날인구분(주사용 날인인지 서명인지)
	
	
	public Signature2() {
	}
	public Signature2(int id, int memId, String originFileName, String renameFileName, String sigType, String isMain) {
		this.id = id;
		this.memId = memId;
		this.originFileName = originFileName;
		this.renameFileName = renameFileName;
		this.sigType = sigType;
		this.isMain = isMain;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getRenameFileName() {
		return renameFileName;
	}
	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}
	public String getSigType() {
		return sigType;
	}
	public void setSigType(String sigType) {
		this.sigType = sigType;
	}
	public String getIsMain() {
		return isMain;
	}
	public void setIsMain(String isMain) {
		this.isMain = isMain;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "Signature2 [id=" + id + ", memId=" + memId + ", originFileName=" + originFileName + ", renameFileName="
				+ renameFileName + ", sigType=" + sigType + ", isMain=" + isMain + "]";
	}
	
	
}

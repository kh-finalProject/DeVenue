package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class Signature implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4178487457880021929L;
	private int id;//날인 id
	private int memId;//날인 주인 id
	private String originFileName;//원본파일명
	private String renameFileName;//수정파일명
	
	public Signature() {
		super();
	}

	public Signature(int id, int memId, String originFileName, String renameFileName) {
		super();
		this.id = id;
		this.memId = memId;
		this.originFileName = originFileName;
		this.renameFileName = renameFileName;
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

	@Override
	public String toString() {
		return "Signature [id=" + id + ", memId=" + memId + ", originFileName=" + originFileName + ", renameFileName="
				+ renameFileName + "]";
	}
	
	
	
	

}

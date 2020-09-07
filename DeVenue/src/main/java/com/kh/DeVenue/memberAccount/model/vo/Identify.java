package com.kh.DeVenue.memberAccount.model.vo;

import java.io.Serializable;

public class Identify implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6666613700671775625L;
	private int ideId;
	private String ideName;
	private String ideAdress;
	private String originalFileName;
	private String renameFileName;
	private String ideStatus;
	
	
	public Identify() {
	}
	public Identify(int ideId, String ideName, String ideAdress, String originalFileName, String renameFileName,
			String ideStatus) {
		this.ideId = ideId;
		this.ideName = ideName;
		this.ideAdress = ideAdress;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.ideStatus = ideStatus;
	}
	
	
	public int getIdeId() {
		return ideId;
	}
	public void setIdeId(int ideId) {
		this.ideId = ideId;
	}
	public String getIdeName() {
		return ideName;
	}
	public void setIdeName(String ideName) {
		this.ideName = ideName;
	}
	public String getIdeAdress() {
		return ideAdress;
	}
	public void setIdeAdress(String ideAdress) {
		this.ideAdress = ideAdress;
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
	public String getIdeStatus() {
		return ideStatus;
	}
	public void setIdeStatus(String ideStatus) {
		this.ideStatus = ideStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "Identify [ideId=" + ideId + ", ideName=" + ideName + ", ideAdress=" + ideAdress + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + ", ideStatus=" + ideStatus + "]";
	}

	
}

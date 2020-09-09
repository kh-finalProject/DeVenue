package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class PmypageSuggest implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4819098365408019634L;
	
	private int memId;
	private String memNick;
	private String memTypeKind;
	private int eAgv;
	private String proName;
	
	public PmypageSuggest() {
		super();
	}

	public PmypageSuggest(int memId, String memNick, String memTypeKind, int eAgv, String proName) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.memTypeKind = memTypeKind;
		this.eAgv = eAgv;
		this.proName = proName;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemTypeKind() {
		return memTypeKind;
	}

	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
	}

	public int geteAgv() {
		return eAgv;
	}

	public void seteAgv(int eAgv) {
		this.eAgv = eAgv;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PmypageSuggest [memId=" + memId + ", memNick=" + memNick + ", memTypeKind=" + memTypeKind + ", eAgv="
				+ eAgv + ", proName=" + proName + "]";
	}
	
	
}

package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class Eval implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7831960372164445955L;
	
	private int eId;
	private int eWriter;
	private int eTarget;
	private int epId;
	private int eAgv;
	private String eContent;
	private int eStar1;
	private int eStar2;
	private int eStar3;
	private int eStar4;
	private int eStar5;
	private String eCreateDate;
	private String eStatus;
	public Eval() {
		super();
	}
	public Eval(int eId, int eWriter, int eTarget, int epId, int eAgv, String eContent, int eStar1, int eStar2,
			int eStar3, int eStar4, int eStar5, String eCreateDate, String eStatus) {
		super();
		this.eId = eId;
		this.eWriter = eWriter;
		this.eTarget = eTarget;
		this.epId = epId;
		this.eAgv = eAgv;
		this.eContent = eContent;
		this.eStar1 = eStar1;
		this.eStar2 = eStar2;
		this.eStar3 = eStar3;
		this.eStar4 = eStar4;
		this.eStar5 = eStar5;
		this.eCreateDate = eCreateDate;
		this.eStatus = eStatus;
	}
	
	// 생성용
	public Eval(int eWriter, int eTarget, int epId, int eAgv, String eContent, int eStar1, int eStar2, int eStar3,
			int eStar4, int eStar5) {
		super();
		this.eWriter = eWriter;
		this.eTarget = eTarget;
		this.epId = epId;
		this.eAgv = eAgv;
		this.eContent = eContent;
		this.eStar1 = eStar1;
		this.eStar2 = eStar2;
		this.eStar3 = eStar3;
		this.eStar4 = eStar4;
		this.eStar5 = eStar5;
	}
	
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public int geteWriter() {
		return eWriter;
	}
	public void seteWriter(int eWriter) {
		this.eWriter = eWriter;
	}
	public int geteTarget() {
		return eTarget;
	}
	public void seteTarget(int eTarget) {
		this.eTarget = eTarget;
	}
	public int getEpId() {
		return epId;
	}
	public void setEpId(int epId) {
		this.epId = epId;
	}
	public int geteAgv() {
		return eAgv;
	}
	public void seteAgv(int eAgv) {
		this.eAgv = eAgv;
	}
	public String geteContent() {
		return eContent;
	}
	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	public int geteStar1() {
		return eStar1;
	}
	public void seteStar1(int eStar1) {
		this.eStar1 = eStar1;
	}
	public int geteStar2() {
		return eStar2;
	}
	public void seteStar2(int eStar2) {
		this.eStar2 = eStar2;
	}
	public int geteStar3() {
		return eStar3;
	}
	public void seteStar3(int eStar3) {
		this.eStar3 = eStar3;
	}
	public int geteStar4() {
		return eStar4;
	}
	public void seteStar4(int eStar4) {
		this.eStar4 = eStar4;
	}
	public int geteStar5() {
		return eStar5;
	}
	public void seteStar5(int eStar5) {
		this.eStar5 = eStar5;
	}
	public String geteCreateDate() {
		return eCreateDate;
	}
	public void seteCreateDate(String eCreateDate) {
		this.eCreateDate = eCreateDate;
	}
	public String geteStatus() {
		return eStatus;
	}
	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}
	@Override
	public String toString() {
		return "Eval [eId=" + eId + ", eWriter=" + eWriter + ", eTarget=" + eTarget + ", epId=" + epId + ", eAgv="
				+ eAgv + ", eContent=" + eContent + ", eStar1=" + eStar1 + ", eStar2=" + eStar2 + ", eStar3=" + eStar3
				+ ", eStar4=" + eStar4 + ", eStar5=" + eStar5 + ", eCreateDate=" + eCreateDate + ", eStatus=" + eStatus
				+ "]";
	}
	
	
}

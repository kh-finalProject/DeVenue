package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class CPeval implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2977099611152057092L;
	
	private String proName;		// 프로젝트 이름
	private String mcId;		// 주카테고리 번호
	private String dcType;		// 부카테고리 이름
	private int eId;			// 평가번호 주식별자
	private int eWriter;		// 작성자(파트너스)
	private int eTarget;		// 평가대상(클라이언트)
	private int epId;			// 종료프로젝트 번호
	private int eAgv;			// 평가점수
	private String eContent;	// 평가내용
	private int star1;			// 전문성
	private int star2;			// 적극성
	private int star3;			// 의사소통
	private int star4;			// 일정준수
	private int star5;			// 만족도
	private Date eCreateDate;	// 작성일
	private String eStatus;		// 평가 여부
	
	public CPeval() {
		super();
	}

	public CPeval(String proName, String mcId, String dcType, int eId, int eWriter, int eTarget, int epId, int eAgv,
			String eContent, int star1, int star2, int star3, int star4, int star5, Date eCreateDate, String eStatus) {
		super();
		this.proName = proName;
		this.mcId = mcId;
		this.dcType = dcType;
		this.eId = eId;
		this.eWriter = eWriter;
		this.eTarget = eTarget;
		this.epId = epId;
		this.eAgv = eAgv;
		this.eContent = eContent;
		this.star1 = star1;
		this.star2 = star2;
		this.star3 = star3;
		this.star4 = star4;
		this.star5 = star5;
		this.eCreateDate = eCreateDate;
		this.eStatus = eStatus;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getMcId() {
		return mcId;
	}

	public void setMcId(String mcId) {
		this.mcId = mcId;
	}

	public String getDcType() {
		return dcType;
	}

	public void setDcType(String dcType) {
		this.dcType = dcType;
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

	public int getStar1() {
		return star1;
	}

	public void setStar1(int star1) {
		this.star1 = star1;
	}

	public int getStar2() {
		return star2;
	}

	public void setStar2(int star2) {
		this.star2 = star2;
	}

	public int getStar3() {
		return star3;
	}

	public void setStar3(int star3) {
		this.star3 = star3;
	}

	public int getStar4() {
		return star4;
	}

	public void setStar4(int star4) {
		this.star4 = star4;
	}

	public int getStar5() {
		return star5;
	}

	public void setStar5(int star5) {
		this.star5 = star5;
	}

	public Date geteCreateDate() {
		return eCreateDate;
	}

	public void seteCreateDate(Date eCreateDate) {
		this.eCreateDate = eCreateDate;
	}

	public String geteStatus() {
		return eStatus;
	}

	public void seteStatus(String eStatus) {
		this.eStatus = eStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CPeval [proName=" + proName + ", mcId=" + mcId + ", dcType=" + dcType + ", eId=" + eId + ", eWriter="
				+ eWriter + ", eTarget=" + eTarget + ", epId=" + epId + ", eAgv=" + eAgv + ", eContent=" + eContent
				+ ", star1=" + star1 + ", star2=" + star2 + ", star3=" + star3 + ", star4=" + star4 + ", star5=" + star5
				+ ", eCreateDate=" + eCreateDate + ", eStatus=" + eStatus + "]";
	}
	
}

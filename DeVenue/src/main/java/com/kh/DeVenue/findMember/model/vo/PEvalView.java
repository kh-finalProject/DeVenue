package com.kh.DeVenue.findMember.model.vo;

import java.io.Serializable;
import java.sql.Date;


// 클라이언트가 파트너스를 평가한 view(FINDPART_PARTEVAL_VIEW)
/**
 * @author 82104
 *
 */
public class PEvalView implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6339180385863096680L;
	
	private int eId;			// 평가 번호
	private int eWriter;		// 작성자 즉 클라이언트
	private int eTarget;		// 파트너스  회원번호
	private int eAgv;			// 평균평점?
	private String eContent;	// 클라이언트 후기
	private int eStar1;			// 전문성
	private int eStar2;			// 적극성
	private int eStar3;			// 의사소통
	private int eStar4;			// 일정준수
	private int eStar5;			// 만족도
	private String proName;		// 프로젝트명 	 
	private int proPayment;		// 계약금
	private Date proStartDate;// 계약일자
	private int proDuration;	// 프로젝트 기간
	private String mcType;		// 메인카테고리(개발,디자인..)
	private String dcType;		// 서브카테고리(앱,어플리케이션...)
	private String memNick;		// 사용자 닉네임 
	private String memEmail;	// 사용자 이메일
	public PEvalView() {
		super();
	}
	public PEvalView(int eId, int eWriter, int eTarget, int eAgv, String eContent, int eStar1, int eStar2, int eStar3,
			int eStar4, int eStar5, String proName, int proPayment, Date proStartDate, int proDuration, String mcType,
			String dcType, String memNick, String memEmail) {
		super();
		this.eId = eId;
		this.eWriter = eWriter;
		this.eTarget = eTarget;
		this.eAgv = eAgv;
		this.eContent = eContent;
		this.eStar1 = eStar1;
		this.eStar2 = eStar2;
		this.eStar3 = eStar3;
		this.eStar4 = eStar4;
		this.eStar5 = eStar5;
		this.proName = proName;
		this.proPayment = proPayment;
		this.proStartDate = proStartDate;
		this.proDuration = proDuration;
		this.mcType = mcType;
		this.dcType = dcType;
		this.memNick = memNick;
		this.memEmail = memEmail;
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
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPayment() {
		return proPayment;
	}
	public void setProPayment(int proPayment) {
		this.proPayment = proPayment;
	}
	public Date getProStartDate() {
		return proStartDate;
	}
	public void setProStartDate(Date proStartDate) {
		this.proStartDate = proStartDate;
	}
	public int getProDuration() {
		return proDuration;
	}
	public void setProDuration(int proDuration) {
		this.proDuration = proDuration;
	}
	public String getMcType() {
		return mcType;
	}
	public void setMcType(String mcType) {
		this.mcType = mcType;
	}
	public String getDcType() {
		return dcType;
	}
	public void setDcType(String dcType) {
		this.dcType = dcType;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	@Override
	public String toString() {
		return "PEvalView [eId=" + eId + ", eWriter=" + eWriter + ", eTarget=" + eTarget + ", eAgv=" + eAgv
				+ ", eContent=" + eContent + ", eStar1=" + eStar1 + ", eStar2=" + eStar2 + ", eStar3=" + eStar3
				+ ", eStar4=" + eStar4 + ", eStar5=" + eStar5 + ", proName=" + proName + ", proPayment=" + proPayment
				+ ", proStartDate=" + proStartDate + ", proDuration=" + proDuration + ", mcType=" + mcType + ", dcType="
				+ dcType + ", memNick=" + memNick + ", memEmail=" + memEmail + "]";
	}
	
	
	
	
}

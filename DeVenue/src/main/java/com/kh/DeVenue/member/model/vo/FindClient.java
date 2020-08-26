package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class FindClient implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1751290273972257502L;

	private int memId;				// 회원 기본키
	private String userType;		// 사용자 분류
	private String memType;			// 회원 형태
	private String memEmail;		// 회원 이메일
	private String memNick;			// 회원 닉네임
	private String memName;			// 회원 이름
	private int phone;				// 회원 전화번호
	private int cellphone;			// 회원 핸드폰번호
	private int faxNo;				// 회원 팩스번호
	private int decCount;			// 신고 당한 횟수
	private Date memCreateDate;		// 가입일
	private Date memModifyDate;		// 수정일
	private String memStatus;		// 사용자 탈퇴상태
	private String memTypeName;		// 회원 소속명
	private String proImg;			// 프로필 이미지 rename
	private String introduction;	// 프로필 자기소개
	private double avgEval; 		// 평균 평가 점수
	private int countEval; 			// 평가 개수
	private int countProject;		// 진행한 프로젝트 수
	private String mostDC;			// 자주 진행한 프로젝트
	private String checkIdentify;	// 신원인증 여부
	
	public FindClient() {
		super();
	}

	public FindClient(int memId, String userType, String memType, String memEmail, String memNick, String memName,
			int phone, int cellphone, int faxNo, int decCount, Date memCreateDate, Date memModifyDate, String memStatus,
			String memTypeName, String proImg, String introduction, double avgEval,
			int countEval, int countProject, String mostDC, String checkIdentify) {
		super();
		this.memId = memId;
		this.userType = userType;
		this.memType = memType;
		this.memEmail = memEmail;
		this.memNick = memNick;
		this.memName = memName;
		this.phone = phone;
		this.cellphone = cellphone;
		this.faxNo = faxNo;
		this.decCount = decCount;
		this.memCreateDate = memCreateDate;
		this.memModifyDate = memModifyDate;
		this.memStatus = memStatus;
		this.memTypeName = memTypeName;
		this.proImg = proImg;
		this.introduction = introduction;
		this.avgEval = avgEval;
		this.countEval = countEval;
		this.countProject = countProject;
		this.mostDC = mostDC;
		this.checkIdentify = checkIdentify;
	}

	public int getMemId() {
		return memId;
	}

	public void setMemId(int memId) {
		this.memId = memId;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getMemType() {
		return memType;
	}

	public void setMemType(String memType) {
		this.memType = memType;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemNick() {
		return memNick;
	}

	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getCellphone() {
		return cellphone;
	}

	public void setCellphone(int cellphone) {
		this.cellphone = cellphone;
	}

	public int getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(int faxNo) {
		this.faxNo = faxNo;
	}

	public int getDecCount() {
		return decCount;
	}

	public void setDecCount(int decCount) {
		this.decCount = decCount;
	}

	public Date getMemCreateDate() {
		return memCreateDate;
	}

	public void setMemCreateDate(Date memCreateDate) {
		this.memCreateDate = memCreateDate;
	}

	public Date getMemModifyDate() {
		return memModifyDate;
	}

	public void setMemModifyDate(Date memModifyDate) {
		this.memModifyDate = memModifyDate;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getMemTypeName() {
		return memTypeName;
	}

	public void setMemTypeName(String memTypeName) {
		this.memTypeName = memTypeName;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public double getAvgEval() {
		return avgEval;
	}

	public void setAvgEval(double avgEval) {
		this.avgEval = avgEval;
	}

	public int getCountEval() {
		return countEval;
	}

	public void setCountEval(int countEval) {
		this.countEval = countEval;
	}

	public int getCountProject() {
		return countProject;
	}

	public void setCountProject(int countProject) {
		this.countProject = countProject;
	}

	public String getMostDC() {
		return mostDC;
	}

	public void setMostDC(String mostDC) {
		this.mostDC = mostDC;
	}

	public String getCheckIdentify() {
		return checkIdentify;
	}

	public void setCheckIdentify(String checkIdentify) {
		this.checkIdentify = checkIdentify;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FindClient [memId=" + memId + ", userType=" + userType + ", memType=" + memType + ", memEmail="
				+ memEmail + ", memNick=" + memNick + ", memName=" + memName + ", phone=" + phone + ", cellphone="
				+ cellphone + ", faxNo=" + faxNo + ", decCount=" + decCount + ", memCreateDate=" + memCreateDate
				+ ", memModifyDate=" + memModifyDate + ", memStatus=" + memStatus + ", memTypeName=" + memTypeName
				+ ", proImg=" + proImg + ", introduction=" + introduction + ", avgEval=" + avgEval
				+ ", countEval=" + countEval + ", countProject=" + countProject + ", mostDC=" + mostDC
				+ ", checkIdentify=" + checkIdentify + "]";
	}
	
	
}

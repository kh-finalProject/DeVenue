package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1525429141226873587L;
	
	private int memId; 			// 회원번호
	private String userType; 	// 사용자 분류(주관리자,관리자,클라이언트,파트너스)
	private String memType; 	// 회원 형태(개인,법인,팀,기업,개인사업자,법인사업자)
	private String memEmail;	// 사용자 이메일
	private String memNick;		// 사용자 닉네임
	private String memName;		// 사용자 이름
	private String memPwd;		// 사용자 비밀번호
	private String address1;	// 사용자 우편번호
	private String address2;	// 사용자 주소
	private String address3;	// 사용자 상세 주소
	private int phone;			// 사용자 핸드폰 번호
	private int cellPhone;		// 사용자 다른 핸들폰 번호
	private int faxNo;			// 사용자 팩스 번호
	private String taxEmail;	// 세금관리용 이메일
	private int decCount;		// 신고당한 횟수
	private String memAction;	// 사용자 활동여부(활동가능,협의필요,활동불가능)
	private String isAdvertise;	// 마케팅 수신 동의
	private Date memCreateDate; // 사용자 가입 날짜 
	private Date memModifyDate; // 사용자 수정 날짜
	private String memStatus;	// 사용자 탈퇴 현황
	private String memTypeName; // 사용자(회원) 소속
	
	public Member() {
		super();
	}

	public Member(int memId, String userType, String memType, String memEmail, String memNick, String memName,
			String memPwd, String address1, String address2, String address3, int phone, int cellPhone, int faxNo,
			String taxEmail, int decCount, String memAction, String isAdvertise, Date memCreateDate, Date memModifyDate,
			String memStatus, String memTypeName) {
		super();
		this.memId = memId;
		this.userType = userType;
		this.memType = memType;
		this.memEmail = memEmail;
		this.memNick = memNick;
		this.memName = memName;
		this.memPwd = memPwd;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.phone = phone;
		this.cellPhone = cellPhone;
		this.faxNo = faxNo;
		this.taxEmail = taxEmail;
		this.decCount = decCount;
		this.memAction = memAction;
		this.isAdvertise = isAdvertise;
		this.memCreateDate = memCreateDate;
		this.memModifyDate = memModifyDate;
		this.memStatus = memStatus;
		this.memTypeName = memTypeName;
	}
	
	
	// 로그인용
	public Member(String memEmail, String memPwd) {
		super();
		this.memEmail = memEmail;
		this.memPwd = memPwd;
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

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
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

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(int cellPhone) {
		this.cellPhone = cellPhone;
	}

	public int getFaxNo() {
		return faxNo;
	}

	public void setFaxNo(int faxNo) {
		this.faxNo = faxNo;
	}

	public String getTaxEmail() {
		return taxEmail;
	}

	public void setTaxEmail(String taxEmail) {
		this.taxEmail = taxEmail;
	}

	public int getDecCount() {
		return decCount;
	}

	public void setDecCount(int decCount) {
		this.decCount = decCount;
	}

	public String getMemAction() {
		return memAction;
	}

	public void setMemAction(String memAction) {
		this.memAction = memAction;
	}

	public String getIsAdvertise() {
		return isAdvertise;
	}

	public void setIsAdvertise(String isAdvertise) {
		this.isAdvertise = isAdvertise;
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

	@Override
	public String toString() {
		return "Member [memId=" + memId + ", userType=" + userType + ", memType=" + memType + ", memEmail=" + memEmail
				+ ", memNick=" + memNick + ", memName=" + memName + ", memPwd=" + memPwd + ", address1=" + address1
				+ ", address2=" + address2 + ", address3=" + address3 + ", phone=" + phone + ", cellPhone=" + cellPhone
				+ ", faxNo=" + faxNo + ", taxEmail=" + taxEmail + ", decCount=" + decCount + ", memAction=" + memAction
				+ ", isAdvertise=" + isAdvertise + ", memCreateDate=" + memCreateDate + ", memModifyDate="
				+ memModifyDate + ", memStatus=" + memStatus + ", memTypeName=" + memTypeName + "]";
	}

		
	

	
	
}

package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.DeVenue.project.model.vo.ProjectLike;
import com.kh.DeVenue.project.model.vo.ProjectList;

public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6563273375076952851L;


	private int memId; // 회원 기본키
	private String userType; // 사용자 분류
	private String memType; // 회원 형태
	private String memEmail; // 회원 이메일
	private String memNick; // 회원 닉네임
	private String memName; // 회원 이름
	private String memPwd; // 회원 비밀번호
	private String address1; // 회원 우편번호
	private String address2; // 화원 주소
	private String address3; // 회원 상세주소
	private int phone; // 회원 전화번호
	private int cellPhone; // 회원 핸드폰번호
	private int faxNo; // 회원 팩스번호
	private String taxEmail; // 세금관리용 이메일
	private int decCount; // 신고 당한 횟수
	private String memAction; // 사용자 활동여부
	private String isAdvertise; // 마케팅메시지 수신 여부
	private Date memCreateDate; // 가입일
	private Date memModifyDate; // 수정일
	private String memStatus; // 사용자 탈퇴상태
	private String memTypeName; // 회원 소속명
	private ArrayList<Signature> sigs;// 날인 리스트
	private ArrayList<ProjectLike> likeList;//관심 프로젝트 리스트
	private ArrayList<ProjectList> applyList;// 지원 프로젝트 리스트


	public Member() {
		super();
	}

	public Member(int memId, String userType, String memType, String memEmail, String memNick, String memName,
			String memPwd, String address1, String address2, String address3, int phone, int cellPhone, int faxNo,
			String taxEmail, int decCount, String memAction, String isAdvertise, Date memCreateDate, Date memModifyDate,
			String memStatus, String memTypeName, ArrayList<Signature> sigs, ArrayList<ProjectLike> likeList,
			ArrayList<ProjectList> applyList) {
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
		this.sigs = sigs;
		this.likeList = likeList;
		this.applyList = applyList;
	}


	// 로그인용
	public Member(String memEmail, String memPwd) {
		super();
		this.memEmail = memEmail;
		this.memPwd = memPwd;
	}

	// 회원가입용
	public Member(String userType, String memType, String memEmail, String memNick, String memName, String memPwd,
			String address1, String address2, String address3, int phone) {
		super();
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
	}
	
	// 이메일로 memId를 검색해옴
	public Member(String memEmail) {
		super();
		this.memEmail = memEmail;
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

	public void setCellphone(int cellPhone) {
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

	public ArrayList<Signature> getSigs() {
		return sigs;
	}

	public void setSigs(ArrayList<Signature> sigs) {
		this.sigs = sigs;
	}

	public ArrayList<ProjectLike> getLikeList() {
		return likeList;
	}

	public void setLikeList(ArrayList<ProjectLike> likeList) {
		this.likeList = likeList;
	}

	public ArrayList<ProjectList> getApplyList() {
		return applyList;
	}

	public void setApplyList(ArrayList<ProjectList> applyList) {
		this.applyList = applyList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [memId=" + memId + ", userType=" + userType + ", memType=" + memType + ", memEmail=" + memEmail
				+ ", memNick=" + memNick + ", memName=" + memName + ", memPwd=" + memPwd + ", address1=" + address1
				+ ", address2=" + address2 + ", address3=" + address3 + ", phone=" + phone + ", cellPhone=" + cellPhone
				+ ", faxNo=" + faxNo + ", taxEmail=" + taxEmail + ", decCount=" + decCount + ", memAction=" + memAction
				+ ", isAdvertise=" + isAdvertise + ", memCreateDate=" + memCreateDate + ", memModifyDate="
				+ memModifyDate + ", memStatus=" + memStatus + ", memTypeName=" + memTypeName + ", sigs=" + sigs
				+ ", likeList=" + likeList + ", applyList=" + applyList + "]";
	}

}

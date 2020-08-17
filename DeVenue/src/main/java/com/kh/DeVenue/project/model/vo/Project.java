package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Project implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7310711498785777239L;
	
	private int proId; // 프로젝트id
	private int memId; //클라이언트 id
	private String proName; //프로젝트 명
	private String proMaintain; //신규/유지보수
	private String proStaId; //프로젝트 상태 id
	private String proRecruit; //모집상태
	private Date proCreateDate; //등록일
	private int proPlan; // 기획상태
	private int proPlanDetail; //상세기획상태
	private String proSummary; //프로젝트 개요
	private String proNeeds; //필요요소
	private String proNeedsDetail; //요구사항
	private String proResource; //개발환경
	private int proPayment; //예상금액
	private Date proStartDate; //예상 시작일
	private int proDuration;  //예상기간
	private Date proREndDate; //모집마감일
	private Date proEndDate; //프로젝트종료일
	private String proMCId; //카테고리ID
	private String proDCId; //세부카테고리ID
	private String proWTId; //근무형태 ID
	private int proRecruitNum; //모집인원
	private String proPlanPaper; //관련자료파일 originalName
	private String proPlanRePaper; //관련자료파일 rename
	private String proLocation; //클라이언트 위치
	private int proHelp; //인력상황
	private int proManage; //매니징 경험
	private int proFuturePlan; //향후 계획
	private int proPriority; //우선순위
	private String proContract; //계약서 파일명
	private String proTypeCode; //회원형태코드
	private String proWorkspace; //지역
	private int proSignId; //클라이언트 날인id
	private String proPayStatus;//결제상태
	private int proParentId; //부모프로젝트 id
	public Project() {
		super();
	}
	public Project(int proId, int memId, String proName, String proMaintain, String proStaId, String proRecruit,
			Date proCreateDate, int proPlan, int proPlanDetail, String proSummary, String proNeeds,
			String proNeedsDetail, String proResource, int proPayment, Date proStartDate, int proDuration,
			Date proREndDate, Date proEndDate, String proMCId, String proDCId, String proWTId, int proRecruitNum,
			String proPlanPaper, String proPlanRePaper, String proLocation, int proHelp, int proManage,
			int proFuturePlan, int proPriority, String proContract, String proTypeCode, String proWorkspace,
			int proSignId, String proPayStatus, int proParentId) {
		super();
		this.proId = proId;
		this.memId = memId;
		this.proName = proName;
		this.proMaintain = proMaintain;
		this.proStaId = proStaId;
		this.proRecruit = proRecruit;
		this.proCreateDate = proCreateDate;
		this.proPlan = proPlan;
		this.proPlanDetail = proPlanDetail;
		this.proSummary = proSummary;
		this.proNeeds = proNeeds;
		this.proNeedsDetail = proNeedsDetail;
		this.proResource = proResource;
		this.proPayment = proPayment;
		this.proStartDate = proStartDate;
		this.proDuration = proDuration;
		this.proREndDate = proREndDate;
		this.proEndDate = proEndDate;
		this.proMCId = proMCId;
		this.proDCId = proDCId;
		this.proWTId = proWTId;
		this.proRecruitNum = proRecruitNum;
		this.proPlanPaper = proPlanPaper;
		this.proPlanRePaper = proPlanRePaper;
		this.proLocation = proLocation;
		this.proHelp = proHelp;
		this.proManage = proManage;
		this.proFuturePlan = proFuturePlan;
		this.proPriority = proPriority;
		this.proContract = proContract;
		this.proTypeCode = proTypeCode;
		this.proWorkspace = proWorkspace;
		this.proSignId = proSignId;
		this.proPayStatus = proPayStatus;
		this.proParentId = proParentId;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProMaintain() {
		return proMaintain;
	}
	public void setProMaintain(String proMaintain) {
		this.proMaintain = proMaintain;
	}
	public String getProStaId() {
		return proStaId;
	}
	public void setProStaId(String proStaId) {
		this.proStaId = proStaId;
	}
	public String getProRecruit() {
		return proRecruit;
	}
	public void setProRecruit(String proRecruit) {
		this.proRecruit = proRecruit;
	}
	public Date getProCreateDate() {
		return proCreateDate;
	}
	public void setProCreateDate(Date proCreateDate) {
		this.proCreateDate = proCreateDate;
	}
	public int getProPlan() {
		return proPlan;
	}
	public void setProPlan(int proPlan) {
		this.proPlan = proPlan;
	}
	public int getProPlanDetail() {
		return proPlanDetail;
	}
	public void setProPlanDetail(int proPlanDetail) {
		this.proPlanDetail = proPlanDetail;
	}
	public String getProSummary() {
		return proSummary;
	}
	public void setProSummary(String proSummary) {
		this.proSummary = proSummary;
	}
	public String getProNeeds() {
		return proNeeds;
	}
	public void setProNeeds(String proNeeds) {
		this.proNeeds = proNeeds;
	}
	public String getProNeedsDetail() {
		return proNeedsDetail;
	}
	public void setProNeedsDetail(String proNeedsDetail) {
		this.proNeedsDetail = proNeedsDetail;
	}
	public String getProResource() {
		return proResource;
	}
	public void setProResource(String proResource) {
		this.proResource = proResource;
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
	public Date getProREndDate() {
		return proREndDate;
	}
	public void setProREndDate(Date proREndDate) {
		this.proREndDate = proREndDate;
	}
	public Date getProEndDate() {
		return proEndDate;
	}
	public void setProEndDate(Date proEndDate) {
		this.proEndDate = proEndDate;
	}
	public String getProMCId() {
		return proMCId;
	}
	public void setProMCId(String proMCId) {
		this.proMCId = proMCId;
	}
	public String getProDCId() {
		return proDCId;
	}
	public void setProDCId(String proDCId) {
		this.proDCId = proDCId;
	}
	public String getProWTId() {
		return proWTId;
	}
	public void setProWTId(String proWTId) {
		this.proWTId = proWTId;
	}
	public int getProRecruitNum() {
		return proRecruitNum;
	}
	public void setProRecruitNum(int proRecruitNum) {
		this.proRecruitNum = proRecruitNum;
	}
	public String getProPlanPaper() {
		return proPlanPaper;
	}
	public void setProPlanPaper(String proPlanPaper) {
		this.proPlanPaper = proPlanPaper;
	}
	public String getProPlanRePaper() {
		return proPlanRePaper;
	}
	public void setProPlanRePaper(String proPlanRePaper) {
		this.proPlanRePaper = proPlanRePaper;
	}
	public String getProLocation() {
		return proLocation;
	}
	public void setProLocation(String proLocation) {
		this.proLocation = proLocation;
	}
	public int getProHelp() {
		return proHelp;
	}
	public void setProHelp(int proHelp) {
		this.proHelp = proHelp;
	}
	public int getProManage() {
		return proManage;
	}
	public void setProManage(int proManage) {
		this.proManage = proManage;
	}
	public int getProFuturePlan() {
		return proFuturePlan;
	}
	public void setProFuturePlan(int proFuturePlan) {
		this.proFuturePlan = proFuturePlan;
	}
	public int getProPriority() {
		return proPriority;
	}
	public void setProPriority(int proPriority) {
		this.proPriority = proPriority;
	}
	public String getProContract() {
		return proContract;
	}
	public void setProContract(String proContract) {
		this.proContract = proContract;
	}
	public String getProTypeCode() {
		return proTypeCode;
	}
	public void setProTypeCode(String proTypeCode) {
		this.proTypeCode = proTypeCode;
	}
	public String getProWorkspace() {
		return proWorkspace;
	}
	public void setProWorkspace(String proWorkspace) {
		this.proWorkspace = proWorkspace;
	}
	public int getProSignId() {
		return proSignId;
	}
	public void setProSignId(int proSignId) {
		this.proSignId = proSignId;
	}
	public String getProPayStatus() {
		return proPayStatus;
	}
	public void setProPayStatus(String proPayStatus) {
		this.proPayStatus = proPayStatus;
	}
	public int getProParentId() {
		return proParentId;
	}
	public void setProParentId(int proParentId) {
		this.proParentId = proParentId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Project [proId=" + proId + ", memId=" + memId + ", proName=" + proName + ", proMaintain=" + proMaintain
				+ ", proStaId=" + proStaId + ", proRecruit=" + proRecruit + ", proCreateDate=" + proCreateDate
				+ ", proPlan=" + proPlan + ", proPlanDetail=" + proPlanDetail + ", proSummary=" + proSummary
				+ ", proNeeds=" + proNeeds + ", proNeedsDetail=" + proNeedsDetail + ", proResource=" + proResource
				+ ", proPayment=" + proPayment + ", proStartDate=" + proStartDate + ", proDuration=" + proDuration
				+ ", proREndDate=" + proREndDate + ", proEndDate=" + proEndDate + ", proMCId=" + proMCId + ", proDCId="
				+ proDCId + ", proWTId=" + proWTId + ", proRecruitNum=" + proRecruitNum + ", proPlanPaper="
				+ proPlanPaper + ", proPlanRePaper=" + proPlanRePaper + ", proLocation=" + proLocation + ", proHelp="
				+ proHelp + ", proManage=" + proManage + ", proFuturePlan=" + proFuturePlan + ", proPriority="
				+ proPriority + ", proContract=" + proContract + ", proTypeCode=" + proTypeCode + ", proWorkspace="
				+ proWorkspace + ", proSignId=" + proSignId + ", proPayStatus=" + proPayStatus + ", proParentId="
				+ proParentId + "]";
	}
	

	

	

}

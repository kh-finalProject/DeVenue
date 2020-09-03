package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.member.model.vo.Portfolio;

public class Application implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 630471416336442254L;
	private int aId;//지원서 아이디
	private Member partner;//지원자
	private int pId;//프로젝트 아이디
	private ProjectList pList;//프로젝트 정보
	private int aPayment;//지원금액
	private int aDuration;//지원기간
	private String aContent;//지원 내용(자소서)
	private String originalResume;//이력서 원본 파일 이름
	private String reNameResume;//이력서 수정 파일 이름
	private Date applyDate;//지원 날짜
	private String saveStatus;//임시저장 여부
	private String status;//삭제 여부
	private ArrayList<ApplyPortfolio> portfolio;//제출하는 포트폴리오 아이디
	private ArrayList<ApplyAnswer> answer;//클라이언트 질문에 대한 답변
	
	public Application() {
		super();
	}

	public Application(int aId, Member partner, int pId, ProjectList pList, int aPayment, int aDuration,
			String aContent, String originalResume, String reNameResume, Date applyDate, String saveStatus,
			String status, ArrayList<ApplyPortfolio> portfolio, ArrayList<ApplyAnswer> answer) {
		super();
		this.aId = aId;
		this.partner = partner;
		this.pId = pId;
		this.pList = pList;
		this.aPayment = aPayment;
		this.aDuration = aDuration;
		this.aContent = aContent;
		this.originalResume = originalResume;
		this.reNameResume = reNameResume;
		this.applyDate = applyDate;
		this.saveStatus = saveStatus;
		this.status = status;
		this.portfolio = portfolio;
		this.answer = answer;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public Member getPartner() {
		return partner;
	}

	public void setPartner(Member partner) {
		this.partner = partner;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public ProjectList getpList() {
		return pList;
	}

	public void setpList(ProjectList pList) {
		this.pList = pList;
	}

	public int getaPayment() {
		return aPayment;
	}

	public void setaPayment(int aPayment) {
		this.aPayment = aPayment;
	}

	public int getaDuration() {
		return aDuration;
	}

	public void setaDuration(int aDuration) {
		this.aDuration = aDuration;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getOriginalResume() {
		return originalResume;
	}

	public void setOriginalResume(String originalResume) {
		this.originalResume = originalResume;
	}

	public String getReNameResume() {
		return reNameResume;
	}

	public void setReNameResume(String reNameResume) {
		this.reNameResume = reNameResume;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getSaveStatus() {
		return saveStatus;
	}

	public void setSaveStatus(String saveStatus) {
		this.saveStatus = saveStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ArrayList<ApplyPortfolio> getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(ArrayList<ApplyPortfolio> portfolio) {
		this.portfolio = portfolio;
	}

	public ArrayList<ApplyAnswer> getAnswer() {
		return answer;
	}

	public void setAnswer(ArrayList<ApplyAnswer> answer) {
		this.answer = answer;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Application [aId=" + aId + ", partner=" + partner + ", pId=" + pId + ", pList=" + pList + ", aPayment="
				+ aPayment + ", aDuration=" + aDuration + ", aContent=" + aContent + ", originalResume="
				+ originalResume + ", reNameResume=" + reNameResume + ", applyDate=" + applyDate + ", saveStatus="
				+ saveStatus + ", status=" + status + ", portfolio=" + portfolio + ", answer=" + answer + "]";
	}
	
	
	
	
	
	
	
	
	
}

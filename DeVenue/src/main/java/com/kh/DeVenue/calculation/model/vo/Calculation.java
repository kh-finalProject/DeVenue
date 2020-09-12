package com.kh.DeVenue.calculation.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.DeVenue.member.model.vo.Member;
import com.kh.DeVenue.project.model.vo.Project;

public class Calculation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2580555140172765576L;

	private int calId;//정산 아이디
	private int proId;//프로젝트 아이디 
	private Project project;//정산 대상 프로젝트
	private ArrayList<Member> partners;//매칭 파트너스
	private Member partner;//정산 대상 파트너
	private Member client;//클라이언트
	private int expectPayment;//예상 지불 금액
	private int realPay;//실제 지불 금액
	private int deposit;//예치금(클라이언트 결제 금액)
	private int incentive;//인센티브(디베뉴가 받는 5%)
	private int tax;//세금(파트너스 사업자 형태에 따라)
	private String status;//정산상태
	private Date payDate;//정산날
	
	public Calculation() {
		super();
	}

	public Calculation(int calId, int proId, Project project, ArrayList<Member> partners, Member partner, Member client,
			int expectPayment, int realPay, int deposit, int incentive, int tax, String status, Date payDate) {
		super();
		this.calId = calId;
		this.proId = proId;
		this.project = project;
		this.partners = partners;
		this.partner = partner;
		this.client = client;
		this.expectPayment = expectPayment;
		this.realPay = realPay;
		this.deposit = deposit;
		this.incentive = incentive;
		this.tax = tax;
		this.status = status;
		this.payDate = payDate;
	}

	public int getCalId() {
		return calId;
	}

	public void setCalId(int calId) {
		this.calId = calId;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public ArrayList<Member> getPartners() {
		return partners;
	}

	public void setPartners(ArrayList<Member> partners) {
		this.partners = partners;
	}

	public Member getPartner() {
		return partner;
	}

	public void setPartner(Member partner) {
		this.partner = partner;
	}

	public Member getClient() {
		return client;
	}

	public void setClient(Member client) {
		this.client = client;
	}

	public int getExpectPayment() {
		return expectPayment;
	}

	public void setExpectPayment(int expectPayment) {
		this.expectPayment = expectPayment;
	}

	public int getRealPay() {
		return realPay;
	}

	public void setRealPay(int realPay) {
		this.realPay = realPay;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getIncentive() {
		return incentive;
	}

	public void setIncentive(int incentive) {
		this.incentive = incentive;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Calculation [calId=" + calId + ", proId=" + proId + ", project=" + project + ", partners=" + partners
				+ ", partner=" + partner + ", client=" + client + ", expectPayment=" + expectPayment + ", realPay="
				+ realPay + ", deposit=" + deposit + ", incentive=" + incentive + ", tax=" + tax + ", status=" + status
				+ ", payDate=" + payDate + "]";
	}
	
	
	
	
	
	
}

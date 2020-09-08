package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class FCprojectHistory implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1230062537489302198L;

	private int memId;
	private String memNick;		// 닉네임
	private String memTypeKind;
	private String ideStatus;	// 신원확인
	private int phone;			// 번호등록
	private String proImg;
	private int addProject;
	private int stopProject;
	private int ingProject;
	private int allPayment;
	private int avgEagv;		// 
	private int completeProject;
	private int countEagv;
	private double star1;
	private double star2;
	private double star3;
	private double star4;
	private double star5;
	
	public FCprojectHistory() {
		super();
	}

	public FCprojectHistory(int memId, String memNick, String memTypeKind, String ideStatus, int phone, String proImg,
			int addProject, int stopProject, int ingProject, int allPayment, int avgEagv, int completeProject,
			int countEagv, double star1, double star2, double star3, double star4, double star5) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.memTypeKind = memTypeKind;
		this.ideStatus = ideStatus;
		this.phone = phone;
		this.proImg = proImg;
		this.addProject = addProject;
		this.stopProject = stopProject;
		this.ingProject = ingProject;
		this.allPayment = allPayment;
		this.avgEagv = avgEagv;
		this.completeProject = completeProject;
		this.countEagv = countEagv;
		this.star1 = star1;
		this.star2 = star2;
		this.star3 = star3;
		this.star4 = star4;
		this.star5 = star5;
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

	public String getIdeStatus() {
		return ideStatus;
	}

	public void setIdeStatus(String ideStatus) {
		this.ideStatus = ideStatus;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	public int getAddProject() {
		return addProject;
	}

	public void setAddProject(int addProject) {
		this.addProject = addProject;
	}

	public int getStopProject() {
		return stopProject;
	}

	public void setStopProject(int stopProject) {
		this.stopProject = stopProject;
	}

	public int getIngProject() {
		return ingProject;
	}

	public void setIngProject(int ingProject) {
		this.ingProject = ingProject;
	}

	public int getAllPayment() {
		return allPayment;
	}

	public void setAllPayment(int allPayment) {
		this.allPayment = allPayment;
	}

	public int getAvgEagv() {
		return avgEagv;
	}

	public void setAvgEagv(int avgEagv) {
		this.avgEagv = avgEagv;
	}

	public int getCompleteProject() {
		return completeProject;
	}

	public void setCompleteProject(int completeProject) {
		this.completeProject = completeProject;
	}

	public int getCountEagv() {
		return countEagv;
	}

	public void setCountEagv(int countEagv) {
		this.countEagv = countEagv;
	}

	public double getStar1() {
		return star1;
	}

	public void setStar1(double star1) {
		this.star1 = star1;
	}

	public double getStar2() {
		return star2;
	}

	public void setStar2(double star2) {
		this.star2 = star2;
	}

	public double getStar3() {
		return star3;
	}

	public void setStar3(double star3) {
		this.star3 = star3;
	}

	public double getStar4() {
		return star4;
	}

	public void setStar4(double star4) {
		this.star4 = star4;
	}

	public double getStar5() {
		return star5;
	}

	public void setStar5(double star5) {
		this.star5 = star5;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FCprojectHistory [memId=" + memId + ", memNick=" + memNick + ", memTypeKind=" + memTypeKind
				+ ", ideStatus=" + ideStatus + ", phone=" + phone + ", proImg=" + proImg + ", addProject=" + addProject
				+ ", stopProject=" + stopProject + ", ingProject=" + ingProject + ", allPayment=" + allPayment
				+ ", avgEagv=" + avgEagv + ", completeProject=" + completeProject + ", countEagv=" + countEagv
				+ ", star1=" + star1 + ", star2=" + star2 + ", star3=" + star3 + ", star4=" + star4 + ", star5=" + star5
				+ "]";
	}

}

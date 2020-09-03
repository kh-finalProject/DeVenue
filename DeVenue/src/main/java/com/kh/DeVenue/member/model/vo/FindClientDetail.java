package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class FindClientDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5624144924343458403L;
	
	private int memId;
	private String memNick;		// 닉네임
	private String ideStatus;	// 신원확인
	private int phone;			// 번호등록
	private double avgEagv;		// 
	private int countEagv;
	private int countProId;
	private String maxDcType;
	private String memTypeName;
	private double star1;
	private double star2;
	private double star3;
	private double star4;
	private double star5;
	private String memTypeKind;
	private String introduction;
	private String profileImg;
	
	public FindClientDetail() {
		super();
	}

	public FindClientDetail(int memId, String memNick, String ideStatus, int phone, double avgEagv, int countEagv,
			int countProId, String maxDcType, String memTypeName, double star1, double star2, double star3,
			double star4, double star5, String memTypeKind, String introduction, String profileImg) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.ideStatus = ideStatus;
		this.phone = phone;
		this.avgEagv = avgEagv;
		this.countEagv = countEagv;
		this.countProId = countProId;
		this.maxDcType = maxDcType;
		this.memTypeName = memTypeName;
		this.star1 = star1;
		this.star2 = star2;
		this.star3 = star3;
		this.star4 = star4;
		this.star5 = star5;
		this.memTypeKind = memTypeKind;
		this.introduction = introduction;
		this.profileImg = profileImg;
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

	public double getAvgEagv() {
		return avgEagv;
	}

	public void setAvgEagv(double avgEagv) {
		this.avgEagv = avgEagv;
	}

	public int getCountEagv() {
		return countEagv;
	}

	public void setCountEagv(int countEagv) {
		this.countEagv = countEagv;
	}

	public int getCountProId() {
		return countProId;
	}

	public void setCountProId(int countProId) {
		this.countProId = countProId;
	}

	public String getMaxDcType() {
		return maxDcType;
	}

	public void setMaxDcType(String maxDcType) {
		this.maxDcType = maxDcType;
	}

	public String getMemTypeName() {
		return memTypeName;
	}

	public void setMemTypeName(String memTypeName) {
		this.memTypeName = memTypeName;
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

	public String getMemTypeKind() {
		return memTypeKind;
	}

	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FindClientDetail [memId=" + memId + ", memNick=" + memNick + ", ideStatus=" + ideStatus + ", phone="
				+ phone + ", avgEagv=" + avgEagv + ", countEagv=" + countEagv + ", countProId=" + countProId
				+ ", maxDcType=" + maxDcType + ", memTypeName=" + memTypeName + ", star1=" + star1 + ", star2=" + star2
				+ ", star3=" + star3 + ", star4=" + star4 + ", star5=" + star5 + ", memTypeKind=" + memTypeKind
				+ ", introduction=" + introduction + ", profileImg=" + profileImg + "]";
	}
	
	

}

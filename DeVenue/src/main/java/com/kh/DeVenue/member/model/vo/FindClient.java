package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class FindClient implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1751290273972257502L;
	
	private int memId;
	private String memNick;
	private String memEmail;
	private String memTypeName;
	private String memTypeKind;
	private String profileImg;
	private String introduction;
	private String address;
	private double avgEagv;
	private int countEagv;
	private int countProId;
	private String maxDcType;
	private String ideStatus;
	private String phone;
	private String createDate;
	
	public FindClient() {
		super();
	}

	public FindClient(int memId, String memNick, String memEmail, String memTypeName, String memTypeKind,
			String profileImg, String introduction, String address, double avgEagv, int countEagv, int countProId,
			String maxDcType, String ideStatus, String phone, String createDate) {
		super();
		this.memId = memId;
		this.memNick = memNick;
		this.memEmail = memEmail;
		this.memTypeName = memTypeName;
		this.memTypeKind = memTypeKind;
		this.profileImg = profileImg;
		this.introduction = introduction;
		this.address = address;
		this.avgEagv = avgEagv;
		this.countEagv = countEagv;
		this.countProId = countProId;
		this.maxDcType = maxDcType;
		this.ideStatus = ideStatus;
		this.phone = phone;
		this.createDate = createDate;
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

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemTypeName() {
		return memTypeName;
	}

	public void setMemTypeName(String memTypeName) {
		this.memTypeName = memTypeName;
	}

	public String getMemTypeKind() {
		return memTypeKind;
	}

	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getIdeStatus() {
		return ideStatus;
	}

	public void setIdeStatus(String ideStatus) {
		this.ideStatus = ideStatus;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "FindClient [memId=" + memId + ", memNick=" + memNick + ", memEmail=" + memEmail + ", memTypeName="
				+ memTypeName + ", memTypeKind=" + memTypeKind + ", profileImg=" + profileImg + ", introduction="
				+ introduction + ", address=" + address + ", avgEagv=" + avgEagv + ", countEagv=" + countEagv
				+ ", countProId=" + countProId + ", maxDcType=" + maxDcType + ", ideStatus=" + ideStatus + ", phone="
				+ phone + ", createDate=" + createDate + "]";
	}
	
	
}

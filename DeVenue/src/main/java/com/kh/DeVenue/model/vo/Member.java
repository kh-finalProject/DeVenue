package com.kh.DeVenue.model.vo;

import java.io.Serializable;

public class Member implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1813173791747431555L;
	private int mId;
	private String userType;
	private String mEmail;
	private String mNick;
	private String mName;
	private String mPwd;
	private String is_ad;
	public Member() {
		super();
	}
	public Member(int mId, String userType, String mEmail, String mNick, String mName, String mPwd, String is_ad) {
		super();
		this.mId = mId;
		this.userType = userType;
		this.mEmail = mEmail;
		this.mNick = mNick;
		this.mName = mName;
		this.mPwd = mPwd;
		this.is_ad = is_ad;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getIs_ad() {
		return is_ad;
	}
	public void setIs_ad(String is_ad) {
		this.is_ad = is_ad;
	}
	@Override
	public String toString() {
		return "Member [mId=" + mId + ", userType=" + userType + ", mEmail=" + mEmail + ", mNick=" + mNick + ", mName="
				+ mName + ", mPwd=" + mPwd + ", is_ad=" + is_ad + "]";
	}
	
	
}

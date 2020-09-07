package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

// 채팅용 사용자들 간단한 정보 저장 dto 객체
public class ChatUser implements Serializable{
	private int mId;
	private String userType;
	private String typeName;
	private String mEmail;
	private String mNick;
	private String mName;
	private String is_ad;
	private String proImgName;
	
	
	public ChatUser() {
	}
	public ChatUser(int mId, String userType, String typeName, String mEmail, String mNick, String mName, String is_ad, String proImgName) {
		this.mId = mId;
		this.userType = userType;
		this.typeName = typeName;
		this.mEmail = mEmail;
		this.mNick = mNick;
		this.mName = mName;
		this.is_ad = is_ad;
		this.proImgName = proImgName;
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
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
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
	public String getIs_ad() {
		return is_ad;
	}
	public void setIs_ad(String is_ad) {
		this.is_ad = is_ad;
	}
	public String getProImgName() {
		return proImgName;
	}
	public void setProImgName(String proImgName) {
		this.proImgName = proImgName;
	}
	
	
	@Override
	public String toString() {
		return "ChatUser [mId=" + mId + ", userType=" + userType + ", typeName=" + typeName + ", mEmail=" + mEmail + ", mNick=" + mNick + ", mName=" + mName + ", is_ad=" + is_ad + ", proImgName=" + proImgName + "]";
	}
	
	
	
}

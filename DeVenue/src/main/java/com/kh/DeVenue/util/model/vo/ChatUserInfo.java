package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

public class ChatUserInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2875776755232538458L;
	private int mId;
	private String userType;
	private String typeName;
	private String memType;
	private String memTypeKind;
	private String mNick;
	private String mName;
	private String mEmail;
	private String phone;
	private String cellPhone;
	private String memTypeName;
	private String proImgName;
	
	
	public ChatUserInfo() {
	}
	public ChatUserInfo(int mId, String userType, String typeName, String memType, String memTypeKind, String mNick, String mName, String mEmail, String phone, String cellPhone, String memTypeName, String proImgName) {
		this.mId = mId;
		this.userType = userType;
		this.typeName = typeName;
		this.memType = memType;
		this.memTypeKind = memTypeKind;
		this.mNick = mNick;
		this.mName = mName;
		this.mEmail = mEmail;
		this.phone = phone;
		this.cellPhone = cellPhone;
		this.memTypeName = memTypeName;
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
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public String getMemTypeKind() {
		return memTypeKind;
	}
	public void setMemTypeKind(String memTypeKind) {
		this.memTypeKind = memTypeKind;
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
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getMemTypeName() {
		return memTypeName;
	}
	public void setMemTypeName(String memTypeName) {
		this.memTypeName = memTypeName;
	}
	public String getProImgName() {
		return proImgName;
	}
	public void setProImgName(String proImgName) {
		this.proImgName = proImgName;
	}
	
	
	@Override
	public String toString() {
		return "ChatUserInfo [mId=" + mId + ", userType=" + userType + ", typeName=" + typeName + ", memType=" + memType + ", memTypeKind=" + memTypeKind + ", mNick=" + mNick + ", mName=" + mName + ", mEmail=" + mEmail + ", phone=" + phone + ", cellPhone=" + cellPhone + ", memTypeName=" + memTypeName + ", proImgName=" + proImgName + "]";
	}
	
	
}

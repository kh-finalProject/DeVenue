package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class Profile implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8659830098099334225L;
	private int profileId;			// 프로필번호
	private int memId;				// 
	private String introduction;
	private String url;
	private String profileImg;
	
	public Profile() {
		super();
	}
	public Profile(int profileId, int memId, String introduction, String url, String profileImg) {
		super();
		this.profileId = profileId;
		this.memId = memId;
		this.introduction = introduction;
		this.url = url;
		this.profileImg = profileImg;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	@Override
	public String toString() {
		return "Profile [profileId=" + profileId + ", memId=" + memId + ", introduction=" + introduction + ", url="
				+ url + ", profileImg=" + profileImg + "]";
	}
	
	
	
}

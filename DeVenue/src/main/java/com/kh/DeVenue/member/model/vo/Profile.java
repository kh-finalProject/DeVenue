package com.kh.DeVenue.member.model.vo;

public class Profile {
	
	private int profileId;//프로필 id
	private int memId; //멤버 아이디
	private String introduction;//자기소개
	private String url;//홈페이지
	private String proImg;//이미지
	
	public Profile() {
		super();
	}

	public Profile(int profileId, int memId, String introduction, String url, String proImg) {
		super();
		this.profileId = profileId;
		this.memId = memId;
		this.introduction = introduction;
		this.url = url;
		this.proImg = proImg;
	}
	
	/* 회원가입할떄 프로필도 바로 생성 */
	public Profile(int memId) {
		super();
		this.memId = memId;
	}
	
	/* 자기소개 수정 */
	public Profile(int profileId, String introduction) {
		super();
		this.profileId = profileId;
		this.introduction = introduction;
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

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	@Override
	public String toString() {
		return "Profile [profileId=" + profileId + ", memId=" + memId + ", introduction=" + introduction + ", url=" + url
				+ ", proImg=" + proImg + "]";
	}
	
	
	
	
	

}

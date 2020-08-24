package com.kh.DeVenue.member.model.vo;

public class Profile {
	
	private int proId;//프로필 id
	private int memId; //멤버 아이디
	private String introduction;//자기소개
	private String url;//홈페이지
	private String proImg;//이미지
	
	public Profile() {
		super();
	}

	public Profile(int proId, int memId, String introduction, String url, String proImg) {
		super();
		this.proId = proId;
		this.memId = memId;
		this.introduction = introduction;
		this.url = url;
		this.proImg = proImg;
	}

	public int getProId() {
		return proId;
	}

	public void setProId(int proId) {
		this.proId = proId;
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
		return "Profile [proId=" + proId + ", memId=" + memId + ", introduction=" + introduction + ", url=" + url
				+ ", proImg=" + proImg + "]";
	}
	
	
	
	
	

}

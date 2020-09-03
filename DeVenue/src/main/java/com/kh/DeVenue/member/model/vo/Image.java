package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class Image implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8903214854577675308L;
	private int imgId;//이미지 식별자
	private String imgContent;//이미지명, 이미지 내용
	private String imgPath;//이미지경로
	
	public Image() {
		super();
	}

	

	public Image(int imgId, String imgContent, String imgPath) {
		super();
		this.imgId = imgId;
		this.imgContent = imgContent;
		this.imgPath = imgPath;
	}



	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public String getImgContent() {
		return imgContent;
	}

	public void setImgContent(String imgContent) {
		this.imgContent = imgContent;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Image [imgId=" + imgId + ", imgContent=" + imgContent + ", imgPath=" + imgPath + "]";
	} 
	
	
	
	
	

}

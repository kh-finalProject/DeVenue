package com.kh.DeVenue.member.model.vo;

import java.io.Serializable;

public class MemChatSet implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2844752942437822551L;
	
	private int memId;
	private String isTransChat;
	private String isShowPastChat;
	public MemChatSet() {
		super();
	}
	public MemChatSet(int memId, String isTransChat, String isShowPastChat) {
		super();
		this.memId = memId;
		this.isTransChat = isTransChat;
		this.isShowPastChat = isShowPastChat;
	}
	
	// memId를 이용해 memberChatSet 테이블의 기본으로 생성
	public void setMemId(int memId) {
		this.memId = memId;
	}
		
	public int getMemId() {
		return memId;
	}
	public MemChatSet(int memId) {
		super();
		this.memId = memId;
	}
	public String getIsTransChat() {
		return isTransChat;
	}
	public void setIsTransChat(String isTransChat) {
		this.isTransChat = isTransChat;
	}
	public String getIsShowPastChat() {
		return isShowPastChat;
	}
	public void setIsShowPastChat(String isShowPastChat) {
		this.isShowPastChat = isShowPastChat;
	}
	@Override
	public String toString() {
		return "memChatSet [memId=" + memId + ", isTransChat=" + isTransChat + ", isShowPastChat=" + isShowPastChat
				+ "]";
	}
	
	

}

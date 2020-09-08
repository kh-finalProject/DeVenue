package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

// 회원별 채팅 설정 객체
public class MemChatSet implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7714287321812952094L;
	private int mId;
	private String is_transChat;
	private String is_showPastChat;
	
	
	public MemChatSet() {
	}
	public MemChatSet(int mId, String is_transChat, String is_showPastChat) {
		this.mId = mId;
		this.is_transChat = is_transChat;
		this.is_showPastChat = is_showPastChat;
	}
	
	// 회원가입시 자동으로 생성될때 필요함
	public MemChatSet(int mId) {
		super();
		this.mId = mId;
	}
	
	
	
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getIs_transChat() {
		return is_transChat;
	}
	public void setIs_transChat(String is_transChat) {
		this.is_transChat = is_transChat;
	}
	public String getIs_showPastChat() {
		return is_showPastChat;
	}
	public void setIs_showPastChat(String is_showPastChat) {
		this.is_showPastChat = is_showPastChat;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "MemChatSet [mId=" + mId + ", is_transChat=" + is_transChat + ", is_showPastChat=" + is_showPastChat + "]";
	}
	
	
}

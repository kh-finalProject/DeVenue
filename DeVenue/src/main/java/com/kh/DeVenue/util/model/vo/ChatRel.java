package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

// 채팅 관계테이블 객체
public class ChatRel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6391121353677482626L;
	private int chatId;
	private int fromId;
	private int toId;
	private int roomId;
	private String chatStatus;
	
	
	public ChatRel() {
	}
	public ChatRel(int chatId, int fromId, int toId, int roomId, String chatStatus) {
		this.chatId = chatId;
		this.fromId = fromId;
		this.toId = toId;
		this.roomId = roomId;
		this.chatStatus = chatStatus;
	}
	
	
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public int getFromId() {
		return fromId;
	}
	public void setFromId(int fromId) {
		this.fromId = fromId;
	}
	public int getToId() {
		return toId;
	}
	public void setToId(int toId) {
		this.toId = toId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getChatStatus() {
		return chatStatus;
	}
	public void setChatStatus(String chatStatus) {
		this.chatStatus = chatStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "ChatRel [chatId=" + chatId + ", fromId=" + fromId + ", toId=" + toId + ", roomId=" + roomId + ", chatStatus=" + chatStatus + "]";
	}
	
	
}

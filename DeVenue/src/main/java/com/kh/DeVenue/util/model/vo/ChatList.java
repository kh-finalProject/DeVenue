package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;
import java.sql.Date;
// 관리자용 채팅방리스트 뷰 객체(vo)
public class ChatList implements Serializable{
	private int roomId;
	private String roomName;
	private int fromId;
	private int toId;
	private int memId;
	private String proImgName;
	private String chatContent;
	private int unreadCount;
	private String finalDate;
	
	
	public ChatList() {
		
	}
	public ChatList(int roomId, String roomName, int fromId, int toId, int memId, String proImgName, String chatContent, int unreadCount, String finalDate) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.fromId = fromId;
		this.toId = toId;
		this.memId = memId;
		this.proImgName = proImgName;
		this.chatContent = chatContent;
		this.unreadCount = unreadCount;
		this.finalDate = finalDate;
	}
	
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	public int getMemId() {
		return memId;
	}
	public void setMemId(int memId) {
		this.memId = memId;
	}
	public String getProImgName() {
		return proImgName;
	}
	public void setProImgName(String proImgName) {
		this.proImgName = proImgName;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public int getUnreadCount() {
		return unreadCount;
	}
	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}
	public String getFinalDate() {
		return finalDate;
	}
	public void setFinalDate(String finalDate) {
		this.finalDate = finalDate;
	}
	
	
	@Override
	public String toString() {
		return "ChatList [roomId=" + roomId + ", roomName=" + roomName + ", fromId=" + fromId + ", toId=" + toId + ", memId=" + memId + ", proImgName=" + proImgName + ", chatContent=" + chatContent + ", unreadCount=" + unreadCount + ", finalDate=" + finalDate + "]";
	}
	
	
}

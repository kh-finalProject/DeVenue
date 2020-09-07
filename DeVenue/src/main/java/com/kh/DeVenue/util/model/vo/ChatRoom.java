package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

// 각 채팅방 객체
public class ChatRoom implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4225392594208190990L;
	private int roomId;
	private String roomName;
	private String roomStatus;
	
	
	public ChatRoom() {
	}
	public ChatRoom(int roomId, String roomName, String roomStatus) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.roomStatus = roomStatus;
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
	public String getRoomStatus() {
		return roomStatus;
	}
	public void setRoomStatus(String roomStatus) {
		this.roomStatus = roomStatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "ChatRoom [roomId=" + roomId + ", roomName=" + roomName + ", roomStatus=" + roomStatus + "]";
	}
	
	
}

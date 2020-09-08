package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

public class EachChatInfo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 485111329228789890L;
	private int roomId;
	private String roomName;
	private String clientId;
	private String relAdminId;
	private String msgFromId;
	private String chatContent;
	private String oringalFileName;
	private String renameFileName;
	private String read;
	private String msgCreateDate;
	
	
	public EachChatInfo() {
	}
	public EachChatInfo(int roomId, String roomName, String clientId, String relAdminId, String msgFromId, String chatContent, String oringalFileName, String renameFileName, String read, String msgCreateDate) {
		this.roomId = roomId;
		this.roomName = roomName;
		this.clientId = clientId;
		this.relAdminId = relAdminId;
		this.msgFromId = msgFromId;
		this.chatContent = chatContent;
		this.oringalFileName = oringalFileName;
		this.renameFileName = renameFileName;
		this.read = read;
		this.msgCreateDate = msgCreateDate;
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
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getRelAdminId() {
		return relAdminId;
	}
	public void setRelAdminId(String relAdminId) {
		this.relAdminId = relAdminId;
	}
	public String getMsgFromId() {
		return msgFromId;
	}
	public void setMsgFromId(String msgFromId) {
		this.msgFromId = msgFromId;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getOringalFileName() {
		return oringalFileName;
	}
	public void setOringalFileName(String oringalFileName) {
		this.oringalFileName = oringalFileName;
	}
	public String getRenameFileName() {
		return renameFileName;
	}
	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getMsgCreateDate() {
		return msgCreateDate;
	}
	public void setMsgCreateDate(String msgCreateDate) {
		this.msgCreateDate = msgCreateDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	@Override
	public String toString() {
		return "EachChatInfo [roomId=" + roomId + ", roomName=" + roomName + ", clientId=" + clientId + ", relAdminId=" + relAdminId + ", msgFromId=" + msgFromId + ", chatContent=" + chatContent + ", oringalFileName=" + oringalFileName + ", renameFileName=" + renameFileName + ", read=" + read + ", msgCreateDate=" + msgCreateDate + "]";
	}
	
	
}

package com.kh.DeVenue.util.model.vo;

import java.io.Serializable;

// 각 메시지 객체
public class Message implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2100993238295162865L;
	private int msgId;
	private int roomId;
	private int fromId;
	private String chatContent;
	private String originFileName;
	private String renameFileName;
	private String read;
	private String msgCreaetDate;
	
	
	public Message() {
	}
	public Message(int msgId, int roomId, int fromId, String chatContent, String originFileName, String renameFileName, String read, String msgCreaetDate) {
		this.msgId = msgId;
		this.roomId = roomId;
		this.fromId = fromId;
		this.chatContent = chatContent;
		this.originFileName = originFileName;
		this.renameFileName = renameFileName;
		this.read = read;
		this.msgCreaetDate = msgCreaetDate;
	}
	
	
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getFromId() {
		return fromId;
	}
	public void setFromId(int fromId) {
		this.fromId = fromId;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
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
	public String getMsgCreaetDate() {
		return msgCreaetDate;
	}
	public void setMsgCreaetDate(String msgCreaetDate) {
		this.msgCreaetDate = msgCreaetDate;
	}
	
	
	@Override
	public String toString() {
		return "Message [msgId=" + msgId + ", roomId=" + roomId + ", fromId=" + fromId + ", chatContent=" + chatContent + ", originFileName=" + originFileName + ", renameFileName=" + renameFileName + ", read=" + read + ", msgCreaetDate=" + msgCreaetDate + "]";
	}
	
	
}

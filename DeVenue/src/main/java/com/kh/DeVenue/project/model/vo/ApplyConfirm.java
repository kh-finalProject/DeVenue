package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ApplyConfirm implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7722336924897770500L;
	
	private int proAId;
	private int proAPayment;
	private int proADuration;
	private String proAContent;
	private String proReAResume;
	private Date proApplyDate;
	private String memNick;
	private String memIntro;
	private String memImg;
	private int memPId;
	private int portId;
	private int listCount;
	private Project project;
	private int proId;
	public ApplyConfirm() {
		super();
	}
	public ApplyConfirm(int proAId, int proAPayment, int proADuration, String proAContent, String proReAResume,
			Date proApplyDate, String memNick, String memIntro, String memImg, int memPId, int portId, int listCount,
			Project project, int proId) {
		super();
		this.proAId = proAId;
		this.proAPayment = proAPayment;
		this.proADuration = proADuration;
		this.proAContent = proAContent;
		this.proReAResume = proReAResume;
		this.proApplyDate = proApplyDate;
		this.memNick = memNick;
		this.memIntro = memIntro;
		this.memImg = memImg;
		this.memPId = memPId;
		this.portId = portId;
		this.listCount = listCount;
		this.project = project;
		this.proId = proId;
	}
	public int getProAId() {
		return proAId;
	}
	public void setProAId(int proAId) {
		this.proAId = proAId;
	}
	public int getProAPayment() {
		return proAPayment;
	}
	public void setProAPayment(int proAPayment) {
		this.proAPayment = proAPayment;
	}
	public int getProADuration() {
		return proADuration;
	}
	public void setProADuration(int proADuration) {
		this.proADuration = proADuration;
	}
	public String getProAContent() {
		return proAContent;
	}
	public void setProAContent(String proAContent) {
		this.proAContent = proAContent;
	}
	public String getProReAResume() {
		return proReAResume;
	}
	public void setProReAResume(String proReAResume) {
		this.proReAResume = proReAResume;
	}
	public Date getProApplyDate() {
		return proApplyDate;
	}
	public void setProApplyDate(Date proApplyDate) {
		this.proApplyDate = proApplyDate;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemIntro() {
		return memIntro;
	}
	public void setMemIntro(String memIntro) {
		this.memIntro = memIntro;
	}
	public String getMemImg() {
		return memImg;
	}
	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}
	public int getMemPId() {
		return memPId;
	}
	public void setMemPId(int memPId) {
		this.memPId = memPId;
	}
	public int getPortId() {
		return portId;
	}
	public void setPortId(int portId) {
		this.portId = portId;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public int getProId() {
		return proId;
	}
	public void setProId(int proId) {
		this.proId = proId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ApplyConfirm [proAId=" + proAId + ", proAPayment=" + proAPayment + ", proADuration=" + proADuration
				+ ", proAContent=" + proAContent + ", proReAResume=" + proReAResume + ", proApplyDate=" + proApplyDate
				+ ", memNick=" + memNick + ", memIntro=" + memIntro + ", memImg=" + memImg + ", memPId=" + memPId
				+ ", portId=" + portId + ", listCount=" + listCount + ", project=" + project + ", proId=" + proId + "]";
	}
	

}

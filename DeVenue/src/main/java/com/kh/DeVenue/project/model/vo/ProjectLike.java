package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;

import com.kh.DeVenue.member.model.vo.Member;

public class ProjectLike implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8089878476603139523L;
	private int proLId;//관심 프로젝트 고유 아이디
	private Member partner; //파트너스
	private ProjectList pList; //프로젝트 리스트
	
	public ProjectLike() {
		super();
	}

	public ProjectLike(int proLId, Member partner, ProjectList pList) {
		super();
		this.proLId = proLId;
		this.partner = partner;
		this.pList = pList;
	}

	public int getProLId() {
		return proLId;
	}

	public void setProLId(int proLId) {
		this.proLId = proLId;
	}

	public Member getPartner() {
		return partner;
	}

	public void setPartner(Member partner) {
		this.partner = partner;
	}

	public ProjectList getpList() {
		return pList;
	}

	public void setpList(ProjectList pList) {
		this.pList = pList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProjectLike [proLId=" + proLId + ", partner=" + partner + ", pList=" + pList + "]";
	}
	
	
	
	

}

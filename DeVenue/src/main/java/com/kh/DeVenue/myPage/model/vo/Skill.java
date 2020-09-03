package com.kh.DeVenue.myPage.model.vo;

import java.io.Serializable;

public class Skill implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5384804453119229665L;

	private int skillId;
	private int profileId;
	private String skillKind;
	private int skillLevel;
	private String skillYear;
	public Skill() {
		super();
	}
	public Skill(int skillId, int profileId, String skillKind, int skillLevel, String skillYear) {
		super();
		this.skillId = skillId;
		this.profileId = profileId;
		this.skillKind = skillKind;
		this.skillLevel = skillLevel;
		this.skillYear = skillYear;
	}
	
	// 보유기술 insert용
	public Skill(int profileId, String skillKind, int skillLevel, String skillYear) {
		super();
		this.profileId = profileId;
		this.skillKind = skillKind;
		this.skillLevel = skillLevel;
		this.skillYear = skillYear;
	}
	
	public int getSkillId() {
		return skillId;
	}
	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}
	public int getProfileId() {
		return profileId;
	}
	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}
	public String getSkillKind() {
		return skillKind;
	}
	public void setSkillKind(String skillKind) {
		this.skillKind = skillKind;
	}
	public int getSkillLevel() {
		return skillLevel;
	}
	public void setSkillLevel(int skillLevel) {
		this.skillLevel = skillLevel;
	}
	public String getSkillYear() {
		return skillYear;
	}
	public void setSkillYear(String skillYear) {
		this.skillYear = skillYear;
	}
	@Override
	public String toString() {
		return "Skill [skillId=" + skillId + ", profileId=" + profileId + ", skillKind=" + skillKind + ", skillLevel="
				+ skillLevel + ", skillYear=" + skillYear + "]";
	}
	
	
}

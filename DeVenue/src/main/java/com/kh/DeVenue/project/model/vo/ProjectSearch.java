package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;

public class ProjectSearch implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1673685920998462219L;
	private String category;//검색 카테고리
	private String keyword;//검색 키워드
	
	
	
	public ProjectSearch() {
		super();
	}
	public ProjectSearch(String category, String keyword) {
		super();
		this.category = category;
		this.keyword = keyword;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "ProjectSearch [category=" + category + ", keyword=" + keyword + "]";
	}
	
	
	
	

}

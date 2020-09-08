package com.kh.DeVenue.project.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;

public class ProjectFilter implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4166697964551064766L;

	private ArrayList<String> workType;
	private ArrayList<String> mCate;
	private ArrayList<String> dCate;
	private String costMin;
	private String costMax;
	private String costCustom;
	private String rate;
	private String sign;
	private ArrayList<String> location;
	private String recruit;
	private int page;
	
	private ProjectSearch search;
	private String category;
	private String keyword;
	
	private String sorting;

	public ProjectFilter() {
		super();
	}

	public ProjectFilter(ArrayList<String> workType, ArrayList<String> mCate, ArrayList<String> dCate, String costMin,
			String costMax, String costCustom, String rate, String sign, ArrayList<String> location, String recruit,
			int page, ProjectSearch search, String category, String keyword, String sorting) {
		super();
		this.workType = workType;
		this.mCate = mCate;
		this.dCate = dCate;
		this.costMin = costMin;
		this.costMax = costMax;
		this.costCustom = costCustom;
		this.rate = rate;
		this.sign = sign;
		this.location = location;
		this.recruit = recruit;
		this.page = page;
		this.search = search;
		this.category = category;
		this.keyword = keyword;
		this.sorting = sorting;
	}

	public ArrayList<String> getWorkType() {
		return workType;
	}

	public void setWorkType(ArrayList<String> workType) {
		this.workType = workType;
	}

	public ArrayList<String> getmCate() {
		return mCate;
	}

	public void setmCate(ArrayList<String> mCate) {
		this.mCate = mCate;
	}

	public ArrayList<String> getdCate() {
		return dCate;
	}

	public void setdCate(ArrayList<String> dCate) {
		this.dCate = dCate;
	}

	public String getCostMin() {
		return costMin;
	}

	public void setCostMin(String costMin) {
		this.costMin = costMin;
	}

	public String getCostMax() {
		return costMax;
	}

	public void setCostMax(String costMax) {
		this.costMax = costMax;
	}

	public String getCostCustom() {
		return costCustom;
	}

	public void setCostCustom(String costCustom) {
		this.costCustom = costCustom;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public ArrayList<String> getLocation() {
		return location;
	}

	public void setLocation(ArrayList<String> location) {
		this.location = location;
	}

	public String getRecruit() {
		return recruit;
	}

	public void setRecruit(String recruit) {
		this.recruit = recruit;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public ProjectSearch getSearch() {
		return search;
	}

	public void setSearch(ProjectSearch search) {
		this.search = search;
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

	public String getSorting() {
		return sorting;
	}

	public void setSorting(String sorting) {
		this.sorting = sorting;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProjectFilter [workType=" + workType + ", mCate=" + mCate + ", dCate=" + dCate + ", costMin=" + costMin
				+ ", costMax=" + costMax + ", costCustom=" + costCustom + ", rate=" + rate + ", sign=" + sign
				+ ", location=" + location + ", recruit=" + recruit + ", page=" + page + ", search=" + search
				+ ", category=" + category + ", keyword=" + keyword + ", sorting=" + sorting + "]";
	}
	
	
	
	
}

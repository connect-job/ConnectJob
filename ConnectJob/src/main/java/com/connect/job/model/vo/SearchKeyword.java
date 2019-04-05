package com.connect.job.model.vo;

import java.util.Date;

public class SearchKeyword {
	
	private int searchCompany;
	private Date searchDate;
	
	public SearchKeyword() {
	}
	
	public SearchKeyword(int searchCompany, Date searchDate) {
		super();
		this.searchCompany = searchCompany;
		this.searchDate = searchDate;
	}

	public int getSearchCompany() {
		return searchCompany;
	}

	public void setSearchCompany(int searchCompany) {
		this.searchCompany = searchCompany;
	}

	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	@Override
	public String toString() {
		return "SearchKeyword [searchCompany=" + searchCompany + ", searchDate=" + searchDate + "]";
	}
	
}

package com.connect.job.model.vo;

import java.util.Date;

public class SearchKeyword {
	
	private int searchCompany;
	private Date searchDate;
	private String cname;
	private int count;
	
	public SearchKeyword() {
	}
	
	public SearchKeyword(int searchCompany, Date searchDate) {
		super();
		this.searchCompany = searchCompany;
		this.searchDate = searchDate;
	}
	
	

	public SearchKeyword(int searchCompany, Date searchDate, String cname, int count) {
		super();
		this.searchCompany = searchCompany;
		this.searchDate = searchDate;
		this.cname = cname;
		this.count = count;
	}

	public SearchKeyword(int searchCompany, Date searchDate, String cname) {
		super();
		this.searchCompany = searchCompany;
		this.searchDate = searchDate;
		this.cname = cname;
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
	
	

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "SearchKeyword [searchCompany=" + searchCompany + ", searchDate=" + searchDate + ", cname=" + cname
				+ ", count=" + count + "]";
	}

	
	
}

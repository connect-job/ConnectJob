package com.connect.job.model.vo;


public class News {
	private String newsTitle;
	private String newsLink;
	private String newsDate;
	
	public News() {
		// TODO Auto-generated constructor stub
	}
	
	public News(String newsTitle, String newsLink, String newsDate) {
		super();
		this.newsTitle = newsTitle;
		this.newsLink = newsLink;
		this.newsDate = newsDate;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsLink() {
		return newsLink;
	}

	public void setNewsLink(String newsLink) {
		this.newsLink = newsLink;
	}

	public String getNewsDate() {
		return newsDate;
	}

	public void setNewsDate(String newsDate) {
		this.newsDate = newsDate;
	}

	@Override
	public String toString() {
		return "News [newsTitle=" + newsTitle + ", newsLink=" + newsLink + ", newsDate=" + newsDate + "]";
	}
	
	
	
}

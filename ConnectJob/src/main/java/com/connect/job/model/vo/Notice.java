package com.connect.job.model.vo;

import java.sql.Date;

public class Notice {
	private int notice_no;
	private String writer;
	private String title;
	private String content;
	private int read_count;
	private Date notice_date;
	private String status;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int notice_no, String writer, String title, String content, int read_count, Date notice_date,
			String status) {
		super();
		this.notice_no = notice_no;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.notice_date = notice_date;
		this.status = status;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", writer=" + writer + ", title=" + title + ", content=" + content
				+ ", read_count=" + read_count + ", notice_date=" + notice_date + ", status=" + status + "]";
	}
	
	
}

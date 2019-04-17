package com.connect.job.model.vo;

import java.io.Serializable;

public class Faq implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -924727366535421118L;
	
	private int fNo;
	private String fTitle;
	private String fContent;
	private String status;
	
	public Faq() {

	}

	public Faq(int fNo, String fTitle, String fContent, String status) {
		super();
		this.fNo = fNo;
		this.fTitle = fTitle;
		this.fContent = fContent;
		this.status = status;
	}

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getfTitle() {
		return fTitle;
	}

	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Faq [fNo=" + fNo + ", fTitle=" + fTitle + ", fContent=" + fContent + ", status=" + status + "]";
	}
	
	
	
	
}

package com.connect.job.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Inquiry implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2202520330665732767L;
	
	private int iNo;
	private String iType;
	private String iTitle;
	private String iContent;
	private Date iDate;
	private String status;
	private String iWriter;
	private String aContent;
	
	
	public Inquiry() {
		// TODO Auto-generated constructor stub
	}


	public Inquiry(int iNo, String iType, String iTitle, String iContent, Date iDate, String status, String iWriter,
			String aContent) {
		super();
		this.iNo = iNo;
		this.iType = iType;
		this.iTitle = iTitle;
		this.iContent = iContent;
		this.iDate = iDate;
		this.status = status;
		this.iWriter = iWriter;
		this.aContent = aContent;
	}


	public int getiNo() {
		return iNo;
	}


	public void setiNo(int iNo) {
		this.iNo = iNo;
	}


	public String getiType() {
		return iType;
	}


	public void setiType(String iType) {
		this.iType = iType;
	}


	public String getiTitle() {
		return iTitle;
	}


	public void setiTitle(String iTitle) {
		this.iTitle = iTitle;
	}


	public String getiContent() {
		return iContent;
	}


	public void setiContent(String iContent) {
		this.iContent = iContent;
	}


	public Date getiDate() {
		return iDate;
	}


	public void setiDate(Date iDate) {
		this.iDate = iDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getiWriter() {
		return iWriter;
	}


	public void setiWriter(String iWriter) {
		this.iWriter = iWriter;
	}


	public String getaContent() {
		return aContent;
	}


	public void setaContent(String aContent) {
		this.aContent = aContent;
	}


	@Override
	public String toString() {
		return "Inquiry [iNo=" + iNo + ", iType=" + iType + ", iTitle=" + iTitle + ", iContent=" + iContent + ", iDate="
				+ iDate + ", status=" + status + ", iWriter=" + iWriter + ", aContent=" + aContent + "]";
	}


	

	
	
}

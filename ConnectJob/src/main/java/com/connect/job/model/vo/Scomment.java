package com.connect.job.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Scomment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 9046770336507925995L;
	
	private int cNo;
	private int sNo;
	private int cLevel;
	private String cContent;
	private Date cRegdate;
	private String cWriter;
	private String status;
	
	public Scomment() {
		
	}

	public Scomment(int cNo, int sNo, int cLevel, String cContent, Date cRegdate, String cWriter, String status) {
		super();
		this.cNo = cNo;
		this.sNo = sNo;
		this.cLevel = cLevel;
		this.cContent = cContent;
		this.cRegdate = cRegdate;
		this.cWriter = cWriter;
		this.status = status;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getcLevel() {
		return cLevel;
	}

	public void setcLevel(int cLevel) {
		this.cLevel = cLevel;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getcRegdate() {
		return cRegdate;
	}

	public void setcRegdate(Date cRegdate) {
		this.cRegdate = cRegdate;
	}

	public String getcWriter() {
		return cWriter;
	}

	public void setcWriter(String cWriter) {
		this.cWriter = cWriter;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Scomment [cNo=" + cNo + ", sNo=" + sNo + ", cLevel=" + cLevel + ", cContent=" + cContent + ", cRegdate="
				+ cRegdate + ", cWriter=" + cWriter + ", status=" + status + "]";
	}
	
	
	
}

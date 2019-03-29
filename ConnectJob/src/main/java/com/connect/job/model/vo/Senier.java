package com.connect.job.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

public class Senier implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3653406228267432755L;
	
	
	private int sNo;
	private String sJob;
	private String[] qType;
	private String sTitle;
	private String sContent;
	private int sHits;
	private Date sDate;
	private String pId;
	private String status;
	
	public Senier() {
		
	}

	public Senier(int sNo, String sJob, String[] qType, String sTitle, String sContent, int sHits, Date sDate,
			String pId, String status) {
		super();
		this.sNo = sNo;
		this.sJob = sJob;
		this.qType = qType;
		this.sTitle = sTitle;
		this.sContent = sContent;
		this.sHits = sHits;
		this.sDate = sDate;
		this.pId = pId;
		this.status = status;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getsJob() {
		return sJob;
	}

	public void setsJob(String sJob) {
		this.sJob = sJob;
	}

	public String[] getqType() {
		return qType;
	}

	public void setqType(String[] qType) {
		this.qType = qType;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public String getsContent() {
		return sContent;
	}

	public void setsContent(String sContent) {
		this.sContent = sContent;
	}

	public int getsHits() {
		return sHits;
	}

	public void setsHits(int sHits) {
		this.sHits = sHits;
	}

	public Date getsDate() {
		return sDate;
	}

	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Senier [sNo=" + sNo + ", sJob=" + sJob + ", qType=" + Arrays.toString(qType) + ", sTitle=" + sTitle
				+ ", sContent=" + sContent + ", sHits=" + sHits + ", sDate=" + sDate + ", pId=" + pId + ", status="
				+ status + "]";
	}

	
	
	
	
}

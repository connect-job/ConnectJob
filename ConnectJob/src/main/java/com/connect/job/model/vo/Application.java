package com.connect.job.model.vo;

import java.util.Date;

public class Application {
	private int applicationNo;
	private int resumeNo;
	private String pId;
	private int hnSeq;
	private String cMemberId;
	private int companyNo;
	private String companyName;//db테이블에 없음 join해서 가져올것
	private Date applicationDate;
	
	public Application() {
		// TODO Auto-generated constructor stub
	}

	public Application(int applicationNo, int resumeNo, String pId, int hnSeq, String cMemberId, int companyNo,
			String companyName, Date applicationDate) {
		super();
		this.applicationNo = applicationNo;
		this.resumeNo = resumeNo;
		this.pId = pId;
		this.hnSeq = hnSeq;
		this.cMemberId = cMemberId;
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.applicationDate = applicationDate;
	}

	public int getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(int applicationNo) {
		this.applicationNo = applicationNo;
	}

	public int getResumeNo() {
		return resumeNo;
	}

	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public int getHnSeq() {
		return hnSeq;
	}

	public void setHnSeq(int hnSeq) {
		this.hnSeq = hnSeq;
	}

	public String getcMemberId() {
		return cMemberId;
	}

	public void setcMemberId(String cMemberId) {
		this.cMemberId = cMemberId;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	@Override
	public String toString() {
		return "Application [applicationNo=" + applicationNo + ", resumeNo=" + resumeNo + ", pId=" + pId + ", hnSeq="
				+ hnSeq + ", cMemberId=" + cMemberId + ", companyNo=" + companyNo + ", companyName=" + companyName
				+ ", applicationDate=" + applicationDate + "]";
	}

	
	
}

package com.connect.job.model.vo;

import java.util.Date;

public class HireEvent {
	private int eventNo;
	private int hnSeq;
	private int hnTitle;
	private String cMemberId;
	private String seFlag;
	private String eventDate;
	private String companyName;
	
	public HireEvent() {
		// TODO Auto-generated constructor stub
	}

	public HireEvent(int eventNo, int hnSeq, int hnTitle, String cMemberId, String seFlag, String eventDate,
			String companyName) {
		super();
		this.eventNo = eventNo;
		this.hnSeq = hnSeq;
		this.hnTitle = hnTitle;
		this.cMemberId = cMemberId;
		this.seFlag = seFlag;
		this.eventDate = eventDate;
		this.companyName = companyName;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public int getHnSeq() {
		return hnSeq;
	}

	public void setHnSeq(int hnSeq) {
		this.hnSeq = hnSeq;
	}

	public int getHnTitle() {
		return hnTitle;
	}

	public void setHnTitle(int hnTitle) {
		this.hnTitle = hnTitle;
	}

	public String getcMemberId() {
		return cMemberId;
	}

	public void setcMemberId(String cMemberId) {
		this.cMemberId = cMemberId;
	}

	public String getSeFlag() {
		return seFlag;
	}

	public void setSeFlag(String seFlag) {
		this.seFlag = seFlag;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Override
	public String toString() {
		return "HireEvent [eventNo=" + eventNo + ", hnSeq=" + hnSeq + ", hnTitle=" + hnTitle + ", cMemberId="
				+ cMemberId + ", seFlag=" + seFlag + ", eventDate=" + eventDate + ", companyName=" + companyName + "]";
	}

	
	
	
}

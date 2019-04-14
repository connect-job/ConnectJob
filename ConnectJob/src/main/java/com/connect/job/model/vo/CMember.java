package com.connect.job.model.vo;

import java.util.Date;

public class CMember {
	
	private String cMemberId;
	private String cId;
	private String cMemberPw;
	private String cMemberName;
	private String cMemberPhone;
	private String cMemberCPhone;
	private String cMemberBNum;
	private String cMemberDiv;
	private Date cMemberEnroll;
	private String cMemberEmail;

	public CMember() {
		// TODO Auto-generated constructor stub
	}

	public CMember(String cMemberId, String cId, String cMemberPw, String cMemberName, String cMemberPhone,
			String cMemberCPhone, String cMemberBNum, String cMemberDiv, Date cMemberEnroll, String cMemberEmail) {
		super();
		this.cMemberId = cMemberId;
		this.cId = cId;
		this.cMemberPw = cMemberPw;
		this.cMemberName = cMemberName;
		this.cMemberPhone = cMemberPhone;
		this.cMemberCPhone = cMemberCPhone;
		this.cMemberBNum = cMemberBNum;
		this.cMemberDiv = cMemberDiv;
		this.cMemberEnroll = cMemberEnroll;
		this.cMemberEmail = cMemberEmail;
	}

	public String getcMemberId() {
		return cMemberId;
	}

	public void setcMemberId(String cMemberId) {
		this.cMemberId = cMemberId;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getcMemberPw() {
		return cMemberPw;
	}

	public void setcMemberPw(String cMemberPw) {
		this.cMemberPw = cMemberPw;
	}

	public String getcMemberName() {
		return cMemberName;
	}

	public void setcMemberName(String cMemberName) {
		this.cMemberName = cMemberName;
	}

	public String getcMemberPhone() {
		return cMemberPhone;
	}

	public void setcMemberPhone(String cMemberPhone) {
		this.cMemberPhone = cMemberPhone;
	}

	public String getcMemberCPhone() {
		return cMemberCPhone;
	}

	public void setcMemberCPhone(String cMemberCPhone) {
		this.cMemberCPhone = cMemberCPhone;
	}

	public String getcMemberBNum() {
		return cMemberBNum;
	}

	public void setcMemberBNum(String cMemberBNum) {
		this.cMemberBNum = cMemberBNum;
	}

	public String getcMemberDiv() {
		return cMemberDiv;
	}

	public void setcMemberDiv(String cMemberDiv) {
		this.cMemberDiv = cMemberDiv;
	}

	public Date getcMemberEnroll() {
		return cMemberEnroll;
	}

	public void setcMemberEnroll(Date cMemberEnroll) {
		this.cMemberEnroll = cMemberEnroll;
	}

	public String getcMemberEmail() {
		return cMemberEmail;
	}

	public void setcMemberEmail(String cMemberEmail) {
		this.cMemberEmail = cMemberEmail;
	}

	@Override
	public String toString() {
		return "CMember [cMemberId=" + cMemberId + ", cId=" + cId + ", cMemberPw=" + cMemberPw + ", cMemberName="
				+ cMemberName + ", cMemberPhone=" + cMemberPhone + ", cMemberCPhone=" + cMemberCPhone + ", cMemberBNum="
				+ cMemberBNum + ", cMemberDiv=" + cMemberDiv + ", cMemberEnroll=" + cMemberEnroll + ", cMemberEmail="
				+ cMemberEmail + "]";
	}

	
}

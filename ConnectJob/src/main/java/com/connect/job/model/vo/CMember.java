package com.connect.job.model.vo;

public class CMember {
	
	private String CMemberId;
	private String CId;
	private String CMemberPw;
	private String CMemberName;
	private String CMemberPhone;
	private String CMemberCPhone;
	private String CMemberBNum;
	private String CMemberDiv;
	private String CMemberEnroll;
	private String CMemberEmail;

	public CMember() {
		// TODO Auto-generated constructor stub
	}

	public CMember(String cMemberId, String cId, String cMemberPw, String cMemberName, String cMemberPhone,
			String cMemberCPhone, String cMemberBNum, String cMemberDiv, String cMemberEnroll, String cMemberEmail) {
		super();
		CMemberId = cMemberId;
		CId = cId;
		CMemberPw = cMemberPw;
		CMemberName = cMemberName;
		CMemberPhone = cMemberPhone;
		CMemberCPhone = cMemberCPhone;
		CMemberBNum = cMemberBNum;
		CMemberDiv = cMemberDiv;
		CMemberEnroll = cMemberEnroll;
		CMemberEmail = cMemberEmail;
	}

	public String getCMemberId() {
		return CMemberId;
	}

	public void setCMemberId(String cMemberId) {
		CMemberId = cMemberId;
	}

	public String getCId() {
		return CId;
	}

	public void setCId(String cId) {
		CId = cId;
	}

	public String getCMemberPw() {
		return CMemberPw;
	}

	public void setCMemberPw(String cMemberPw) {
		CMemberPw = cMemberPw;
	}

	public String getCMemberName() {
		return CMemberName;
	}

	public void setCMemberName(String cMemberName) {
		CMemberName = cMemberName;
	}

	public String getCMemberPhone() {
		return CMemberPhone;
	}

	public void setCMemberPhone(String cMemberPhone) {
		CMemberPhone = cMemberPhone;
	}

	public String getCMemberCPhone() {
		return CMemberCPhone;
	}

	public void setCMemberCPhone(String cMemberCPhone) {
		CMemberCPhone = cMemberCPhone;
	}

	public String getCMemberBNum() {
		return CMemberBNum;
	}

	public void setCMemberBNum(String cMemberBNum) {
		CMemberBNum = cMemberBNum;
	}

	public String getCMemberDiv() {
		return CMemberDiv;
	}

	public void setCMemberDiv(String cMemberDiv) {
		CMemberDiv = cMemberDiv;
	}

	public String getCMemberEnroll() {
		return CMemberEnroll;
	}

	public void setCMemberEnroll(String cMemberEnroll) {
		CMemberEnroll = cMemberEnroll;
	}

	public String getCMemberEmail() {
		return CMemberEmail;
	}

	public void setCMemberEmail(String cMemberEmail) {
		CMemberEmail = cMemberEmail;
	}

	@Override
	public String toString() {
		return "CMember [CMemberId=" + CMemberId + ", CId=" + CId + ", CMemberPw=" + CMemberPw + ", CMemberName="
				+ CMemberName + ", CMemberPhone=" + CMemberPhone + ", CMemberCPhone=" + CMemberCPhone + ", CMemberBNum="
				+ CMemberBNum + ", CMemberDiv=" + CMemberDiv + ", CMemberEnroll=" + CMemberEnroll + ", CMemberEmail="
				+ CMemberEmail + "]";
	}
	
	
}

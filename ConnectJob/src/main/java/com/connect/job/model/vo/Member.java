package com.connect.job.model.vo;

import java.sql.Date;

public class Member {
	private String pId;
	private String password;
	private String pName;
	private String gender;
	private String phone;
	private String isSns;
	private String finalEdu;
	private String school;
	private String major;
	private String isConfirm;
	private Date enrollDate;
	private int isEmailConfirm;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String pId, String password, String pName, String gender, String phone, String isSns, String finalEdu,
			String school, String major, String isConfirm, Date enrollDate, int isEmailConfirm) {
		super();
		this.pId = pId;
		this.password = password;
		this.pName = pName;
		this.gender = gender;
		this.phone = phone;
		this.isSns = isSns;
		this.finalEdu = finalEdu;
		this.school = school;
		this.major = major;
		this.isConfirm = isConfirm;
		this.enrollDate = enrollDate;
		this.isEmailConfirm = isEmailConfirm;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIsSns() {
		return isSns;
	}

	public void setIsSns(String isSns) {
		this.isSns = isSns;
	}

	public String getFinalEdu() {
		return finalEdu;
	}

	public void setFinalEdu(String finalEdu) {
		this.finalEdu = finalEdu;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getIsConfirm() {
		return isConfirm;
	}

	public void setIsConfirm(String isConfirm) {
		this.isConfirm = isConfirm;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}	

	public int getIsEmailConfirm() {
		return isEmailConfirm;
	}

	public void setIsEmailConfirm(int isEmailConfirm) {
		this.isEmailConfirm = isEmailConfirm;
	}

	@Override
	public String toString() {
		return "Member [pId=" + pId + ", password=" + password + ", pName=" + pName + ", gender=" + gender + ", phone="
				+ phone + ", isSns=" + isSns + ", finalEdu=" + finalEdu + ", school=" + school + ", major=" + major
				+ ", isConfirm=" + isConfirm + ", enrollDate=" + enrollDate + ", isEmailConfirm=" + isEmailConfirm
				+ "]";
	}

	
	
	
	
}

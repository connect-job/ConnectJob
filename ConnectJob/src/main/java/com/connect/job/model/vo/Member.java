package com.connect.job.model.vo;

import java.sql.Date;

public class Member {
	private String p_id;
	private String password;
	private String p_name;
	private String gender;
	private String phone;
	private String is_sns;
	private String final_edu;
	private String school;
	private String major;
	private String is_confirm;
	private Date enroll_date;
	private int kakao_id;
	
	
	public Member() {
		// TODO Auto-generated constructor stub
	}


	public Member(String p_id, String password, String p_name, String gender, String phone, String is_sns,
			String final_edu, String school, String major, String is_confirm, Date enroll_date, int kakao_id) {
		super();
		this.p_id = p_id;
		this.password = password;
		this.p_name = p_name;
		this.gender = gender;
		this.phone = phone;
		this.is_sns = is_sns;
		this.final_edu = final_edu;
		this.school = school;
		this.major = major;
		this.is_confirm = is_confirm;
		this.enroll_date = enroll_date;
		this.kakao_id = kakao_id;
	}


	public String getP_id() {
		return p_id;
	}


	public void setP_id(String p_id) {
		this.p_id = p_id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
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


	public String getIs_sns() {
		return is_sns;
	}


	public void setIs_sns(String is_sns) {
		this.is_sns = is_sns;
	}


	public String getFinal_edu() {
		return final_edu;
	}


	public void setFinal_edu(String final_edu) {
		this.final_edu = final_edu;
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


	public String getIs_confirm() {
		return is_confirm;
	}


	public void setIs_confirm(String is_confirm) {
		this.is_confirm = is_confirm;
	}


	public Date getEnroll_date() {
		return enroll_date;
	}


	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}


	public int getKakao_id() {
		return kakao_id;
	}


	public void setKakao_id(int kakao_id) {
		this.kakao_id = kakao_id;
	}


	@Override
	public String toString() {
		return "Member [p_id=" + p_id + ", password=" + password + ", p_name=" + p_name + ", gender=" + gender
				+ ", phone=" + phone + ", is_sns=" + is_sns + ", final_edu=" + final_edu + ", school=" + school
				+ ", major=" + major + ", is_confirm=" + is_confirm + ", enroll_date=" + enroll_date + ", kakao_id="
				+ kakao_id + "]";
	}

	
}

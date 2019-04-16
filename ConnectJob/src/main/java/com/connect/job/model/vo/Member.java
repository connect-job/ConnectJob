package com.connect.job.model.vo;

import java.sql.Date;

public class Member {
	private String p_id;
	private String password;
	private String p_name;
	private String gender;
	private String phone;
	private String is_sns;
	private Date enroll_date;
	private String email_confirm;
	private int kakao_id;
	private String google_id;
	private int naver_id;
	private String nickname;
	private String alarmStatus;
	
	public Member() {}

	public Member(String p_id, String password, String p_name, String gender, String phone, String is_sns,
			Date enroll_date, String email_confirm, int kakao_id, String google_id, int naver_id, String nickname,
			String alarmStatus) {
		super();
		this.p_id = p_id;
		this.password = password;
		this.p_name = p_name;
		this.gender = gender;
		this.phone = phone;
		this.is_sns = is_sns;
		this.enroll_date = enroll_date;
		this.email_confirm = email_confirm;
		this.kakao_id = kakao_id;
		this.google_id = google_id;
		this.naver_id = naver_id;
		this.nickname = nickname;
		this.alarmStatus = alarmStatus;
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

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getEmail_confirm() {
		return email_confirm;
	}

	public void setEmail_confirm(String email_confirm) {
		this.email_confirm = email_confirm;
	}

	public int getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(int kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getGoogle_id() {
		return google_id;
	}

	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}

	public int getNaver_id() {
		return naver_id;
	}

	public void setNaver_id(int naver_id) {
		this.naver_id = naver_id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAlarmStatus() {
		return alarmStatus;
	}

	public void setAlarmStatus(String alarmStatus) {
		this.alarmStatus = alarmStatus;
	}

	@Override
	public String toString() {
		return "Member [p_id=" + p_id + ", password=" + password + ", p_name=" + p_name + ", gender=" + gender
				+ ", phone=" + phone + ", is_sns=" + is_sns + ", enroll_date=" + enroll_date + ", email_confirm="
				+ email_confirm + ", kakao_id=" + kakao_id + ", google_id=" + google_id + ", naver_id=" + naver_id
				+ ", nickname=" + nickname + ", alarmStatus=" + alarmStatus + "]";
	}

	

	
	
}

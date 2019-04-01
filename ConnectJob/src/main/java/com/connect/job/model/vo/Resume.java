package com.connect.job.model.vo;


import java.util.Arrays;
import java.util.Date;

public class Resume {
	private String pId;
	private String title;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String finalEdu;
	private String career;
	private String hopePosition;
	private String hopeSalary;
	private String[] hopeArea;
	private String[] hopeJobArea;
	private String[] hopeCategory;
	private String isPublic;
	
	public Resume() {
		// TODO Auto-generated constructor stub
	}

	

	public Resume(String pId, String title, String name, String birth, String gender, String email, String phone,
			String finalEdu, String career, String hopePosition, String hopeSalary, String[] hopeArea,
			String[] hopeJobArea, String[] hopeCategory, String isPublic) {
		super();
		this.pId = pId;
		this.title = title;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.finalEdu = finalEdu;
		this.career = career;
		this.hopePosition = hopePosition;
		this.hopeSalary = hopeSalary;
		this.hopeArea = hopeArea;
		this.hopeJobArea = hopeJobArea;
		this.hopeCategory = hopeCategory;
		this.isPublic = isPublic;
	}



	public String getpId() {
		return pId;
	}



	public void setpId(String pId) {
		this.pId = pId;
	}



	public String getIsPublic() {
		return isPublic;
	}



	public void setIsPublic(String isPublic) {
		this.isPublic = isPublic;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFinalEdu() {
		return finalEdu;
	}

	public void setFinalEdu(String finalEdu) {
		this.finalEdu = finalEdu;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getHopePosition() {
		return hopePosition;
	}

	public void setHopePosition(String hopePosition) {
		this.hopePosition = hopePosition;
	}

	public String getHopeSalary() {
		return hopeSalary;
	}

	public void setHopeSalary(String hopeSalary) {
		this.hopeSalary = hopeSalary;
	}

	public String[] getHopeArea() {
		return hopeArea;
	}

	public void setHopeArea(String[] hopeArea) {
		this.hopeArea = hopeArea;
	}

	public String[] getHopeJobArea() {
		return hopeJobArea;
	}

	public void setHopeJobArea(String[] hopeJobArea) {
		this.hopeJobArea = hopeJobArea;
	}

	public String[] getHopeCategory() {
		return hopeCategory;
	}

	public void setHopeCategory(String[] hopeCategory) {
		this.hopeCategory = hopeCategory;
	}



	@Override
	public String toString() {
		return "Resume [pId=" + pId + ", title=" + title + ", name=" + name + ", birth=" + birth + ", gender=" + gender
				+ ", email=" + email + ", phone=" + phone + ", finalEdu=" + finalEdu + ", career=" + career
				+ ", hopePosition=" + hopePosition + ", hopeSalary=" + hopeSalary + ", hopeArea="
				+ Arrays.toString(hopeArea) + ", hopeJobArea=" + Arrays.toString(hopeJobArea) + ", hopeCategory="
				+ Arrays.toString(hopeCategory) + ", isPublic=" + isPublic + "]";
	}

	
}

	
	
	
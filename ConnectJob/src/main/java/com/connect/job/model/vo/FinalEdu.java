package com.connect.job.model.vo;

import java.util.Arrays;
import java.util.Date;

public class FinalEdu {
	private String[] schoolName;
	private String[] schoolArea;
	private String admissionDate;
	private String graduateDate;
	private String highAffiliation;
	private String[] univCategory;
	private String[] major;
	private String[] major2Category;
	private String[] major2;
	private double score;
	private String scoreStandard;
	
	public FinalEdu() {
		// TODO Auto-generated constructor stub
	}



	public FinalEdu(String[] schoolName, String[] schoolArea, String admissionDate, String graduateDate,
			String highAffiliation, String[] univCategory, String[] major, String[] major2Category, String[] major2,
			double score, String scoreStandard) {
		super();
		this.schoolName = schoolName;
		this.schoolArea = schoolArea;
		this.admissionDate = admissionDate;
		this.graduateDate = graduateDate;
		this.highAffiliation = highAffiliation;
		this.univCategory = univCategory;
		this.major = major;
		this.major2Category = major2Category;
		this.major2 = major2;
		this.score = score;
		this.scoreStandard = scoreStandard;
	}



	public String[] getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String[] schoolName) {
		this.schoolName = schoolName;
	}

	public String[] getSchoolArea() {
		return schoolArea;
	}

	public void setSchoolArea(String[] schoolArea) {
		this.schoolArea = schoolArea;
	}

	public String getAdmissionDate() {
		return admissionDate;
	}

	public void setAdmissionDate(String admissionDate) {
		this.admissionDate = admissionDate;
	}

	public String getGraduateDate() {
		return graduateDate;
	}

	public void setGraduateDate(String graduateDate) {
		this.graduateDate = graduateDate;
	}

	public String getHighAffiliation() {
		return highAffiliation;
	}

	public void setHighAffiliation(String highAffiliation) {
		this.highAffiliation = highAffiliation;
	}

	public String[] getUnivCategory() {
		return univCategory;
	}

	public void setUnivCategory(String[] univCategory) {
		this.univCategory = univCategory;
	}

	public String[] getMajor() {
		return major;
	}

	public void setMajor(String[] major) {
		this.major = major;
	}

	public String[] getMajor2Category() {
		return major2Category;
	}

	public void setMajor2Category(String[] major2Category) {
		this.major2Category = major2Category;
	}

	public String[] getMajor2() {
		return major2;
	}

	public void setMajor2(String[] major2) {
		this.major2 = major2;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getScoreStandard() {
		return scoreStandard;
	}

	public void setScoreStandard(String scoreStandard) {
		this.scoreStandard = scoreStandard;
	}



	@Override
	public String toString() {
		return "FinalEdu [schoolName=" + Arrays.toString(schoolName) + ", schoolArea=" + Arrays.toString(schoolArea)
				+ ", admissionDate=" + admissionDate + ", graduateDate=" + graduateDate + ", highAffiliation="
				+ highAffiliation + ", univCategory=" + Arrays.toString(univCategory) + ", major="
				+ Arrays.toString(major) + ", major2Category=" + Arrays.toString(major2Category) + ", major2="
				+ Arrays.toString(major2) + ", score=" + score + ", scoreStandard=" + scoreStandard + "]";
	}

	

	
	
}

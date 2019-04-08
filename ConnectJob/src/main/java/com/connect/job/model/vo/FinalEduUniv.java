package com.connect.job.model.vo;

import java.util.Date;

public class FinalEduUniv {
	private int finalEduUnivNo;
	private int resumeNo;
	private String schoolFlag;
	private String schoolName;
	private String major;
	private String secondMajorCategory;
	private String secondMajor;
	private String score;
	private String scoreStandard;
	private String admissionYM;
	private String graduationYM;
	private String graduateState;
	
	public FinalEduUniv() {
		// TODO Auto-generated constructor stub
	}

	public FinalEduUniv(int finalEduUnivNo, int resumeNo, String schoolFlag, String schoolName, String major,
			String secondMajorCategory, String secondMajor, String score, String scoreStandard, String admissionYM,
			String graduationYM, String graduateState) {
		super();
		this.finalEduUnivNo = finalEduUnivNo;
		this.resumeNo = resumeNo;
		this.schoolFlag = schoolFlag;
		this.schoolName = schoolName;
		this.major = major;
		this.secondMajorCategory = secondMajorCategory;
		this.secondMajor = secondMajor;
		this.score = score;
		this.scoreStandard = scoreStandard;
		this.admissionYM = admissionYM;
		this.graduationYM = graduationYM;
		this.graduateState = graduateState;
	}

	public int getFinalEduUnivNo() {
		return finalEduUnivNo;
	}

	public void setFinalEduUnivNo(int finalEduUnivNo) {
		this.finalEduUnivNo = finalEduUnivNo;
	}

	public int getResumeNo() {
		return resumeNo;
	}

	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}

	public String getSchoolFlag() {
		return schoolFlag;
	}

	public void setSchoolFlag(String schoolFlag) {
		this.schoolFlag = schoolFlag;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSecondMajorCategory() {
		return secondMajorCategory;
	}

	public void setSecondMajorCategory(String secondMajorCategory) {
		this.secondMajorCategory = secondMajorCategory;
	}

	public String getSecondMajor() {
		return secondMajor;
	}

	public void setSecondMajor(String secondMajor) {
		this.secondMajor = secondMajor;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getScoreStandard() {
		return scoreStandard;
	}

	public void setScoreStandard(String scoreStandard) {
		this.scoreStandard = scoreStandard;
	}

	public String getAdmissionYM() {
		return admissionYM;
	}

	public void setAdmissionYM(String admissionYM) {
		this.admissionYM = admissionYM;
	}

	public String getGraduationYM() {
		return graduationYM;
	}

	public void setGraduationYM(String graduationYM) {
		this.graduationYM = graduationYM;
	}

	public String getGraduateState() {
		return graduateState;
	}

	public void setGraduateState(String graduateState) {
		this.graduateState = graduateState;
	}

	@Override
	public String toString() {
		return "FinalEduUniv [finalEduUnivNo=" + finalEduUnivNo + ", resumeNo=" + resumeNo + ", schoolFlag="
				+ schoolFlag + ", schoolName=" + schoolName + ", major=" + major + ", secondMajorCategory="
				+ secondMajorCategory + ", secondMajor=" + secondMajor + ", score=" + score + ", scoreStandard="
				+ scoreStandard + ", admissionYM=" + admissionYM + ", graduationYM=" + graduationYM + ", graduateState="
				+ graduateState + "]";
	}

	
	


	
	
}

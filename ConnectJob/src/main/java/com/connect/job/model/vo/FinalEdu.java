package com.connect.job.model.vo;

import java.util.Arrays;
import java.util.Date;

public class FinalEdu {
	private int finalEduNo;
	private int resumeNo;
	private String schoolFlag;
	private String schoolName;
	private int graduateYear;
	private String graduateState;
	
	public FinalEdu() {
		// TODO Auto-generated constructor stub
	}

	public FinalEdu(int finalEduNo, int resumeNo, String schoolFlag, String schoolName, int graduateYear,
			String graduateState) {
		super();
		this.finalEduNo = finalEduNo;
		this.resumeNo = resumeNo;
		this.schoolFlag = schoolFlag;
		this.schoolName = schoolName;
		this.graduateYear = graduateYear;
		this.graduateState = graduateState;
	}

	public int getFinalEduNo() {
		return finalEduNo;
	}

	public void setFinalEduNo(int finalEduNo) {
		this.finalEduNo = finalEduNo;
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

	public int getGraduateYear() {
		return graduateYear;
	}

	public void setGraduateYear(int graduateYear) {
		this.graduateYear = graduateYear;
	}

	public String getGraduateState() {
		return graduateState;
	}

	public void setGraduateState(String graduateState) {
		this.graduateState = graduateState;
	}

	@Override
	public String toString() {
		return "FinalEdu [finalEduNo=" + finalEduNo + ", resumeNo=" + resumeNo + ", schoolFlag=" + schoolFlag
				+ ", schoolName=" + schoolName + ", graduateYear=" + graduateYear + ", graduateState=" + graduateState
				+ "]";
	}


	

}

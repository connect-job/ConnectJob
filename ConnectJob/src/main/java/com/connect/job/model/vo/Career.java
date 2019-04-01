package com.connect.job.model.vo;

import java.util.Arrays;

public class Career {
	private String[] careerCName;
	private String[] joinDate;
	private String[] resignDate;
	private String[] companyFlag;
	private String[] position;
	private String[] job;
	private String[] occupation;
	
	public Career() {
		// TODO Auto-generated constructor stub
	}

	public Career(String[] careerCName, String[] joinDate, String[] resignDate, String[] companyFlag, String[] position,
			String[] job, String[] occupation) {
		super();
		this.careerCName = careerCName;
		this.joinDate = joinDate;
		this.resignDate = resignDate;
		this.companyFlag = companyFlag;
		this.position = position;
		this.job = job;
		this.occupation = occupation;
	}

	public String[] getCareerCName() {
		return careerCName;
	}

	public void setCareerCName(String[] careerCName) {
		this.careerCName = careerCName;
	}

	public String[] getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String[] joinDate) {
		this.joinDate = joinDate;
	}

	public String[] getResignDate() {
		return resignDate;
	}

	public void setResignDate(String[] resignDate) {
		this.resignDate = resignDate;
	}

	public String[] getCompanyFlag() {
		return companyFlag;
	}

	public void setCompanyFlag(String[] companyFlag) {
		this.companyFlag = companyFlag;
	}

	public String[] getPosition() {
		return position;
	}

	public void setPosition(String[] position) {
		this.position = position;
	}

	public String[] getJob() {
		return job;
	}

	public void setJob(String[] job) {
		this.job = job;
	}

	public String[] getOccupation() {
		return occupation;
	}

	public void setOccupation(String[] occupation) {
		this.occupation = occupation;
	}

	@Override
	public String toString() {
		return "Career [careerCName=" + Arrays.toString(careerCName) + ", joinDate=" + Arrays.toString(joinDate)
				+ ", resignDate=" + Arrays.toString(resignDate) + ", companyFlag=" + Arrays.toString(companyFlag)
				+ ", position=" + Arrays.toString(position) + ", job=" + Arrays.toString(job) + ", occupation="
				+ Arrays.toString(occupation) + "]";
	}
	
}

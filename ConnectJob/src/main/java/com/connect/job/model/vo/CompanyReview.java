package com.connect.job.model.vo;

import java.util.Date;

public class CompanyReview {

	private int reviewNo;
	private String reviewMember;
	private int reviewCompany;
	private String reviewIsCurrent;
	private String reviewJob;
	private String reviewEmployCate;
	private String reviewCareer;
	private String reviewLocation;
	private int reviewTotalScore;
	private String reviewShort;
	private String reviewMerit;
	private String reviewDisMerit;
	private String reviewRequest;
	private int reviewGrade01;
	private int reviewGrade02;
	private int reviewGrade03;
	private int reviewGrade04;
	private int reviewGrade05;
	private int reviewLike;
	private Date reviewDate;
	private String cName;
	
	public CompanyReview() {
		// TODO Auto-generated constructor stub
	}

	public CompanyReview(int reviewNo, String reviewMember, int reviewCompany, String reviewIsCurrent, String reviewJob,
			String reviewEmployCate, String reviewCareer, String reviewLocation, int reviewTotalScore,
			String reviewShort, String reviewMerit, String reviewDisMerit, String reviewRequest, int reviewGrade01,
			int reviewGrade02, int reviewGrade03, int reviewGrade04, int reviewGrade05, int reviewLike, Date reviewDate,
			String cName) {
		super();
		this.reviewNo = reviewNo;
		this.reviewMember = reviewMember;
		this.reviewCompany = reviewCompany;
		this.reviewIsCurrent = reviewIsCurrent;
		this.reviewJob = reviewJob;
		this.reviewEmployCate = reviewEmployCate;
		this.reviewCareer = reviewCareer;
		this.reviewLocation = reviewLocation;
		this.reviewTotalScore = reviewTotalScore;
		this.reviewShort = reviewShort;
		this.reviewMerit = reviewMerit;
		this.reviewDisMerit = reviewDisMerit;
		this.reviewRequest = reviewRequest;
		this.reviewGrade01 = reviewGrade01;
		this.reviewGrade02 = reviewGrade02;
		this.reviewGrade03 = reviewGrade03;
		this.reviewGrade04 = reviewGrade04;
		this.reviewGrade05 = reviewGrade05;
		this.reviewLike = reviewLike;
		this.reviewDate = reviewDate;
		this.cName = cName;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewMember() {
		return reviewMember;
	}

	public void setReviewMember(String reviewMember) {
		this.reviewMember = reviewMember;
	}

	public int getReviewCompany() {
		return reviewCompany;
	}

	public void setReviewCompany(int reviewCompany) {
		this.reviewCompany = reviewCompany;
	}

	public String getReviewIsCurrent() {
		return reviewIsCurrent;
	}

	public void setReviewIsCurrent(String reviewIsCurrent) {
		this.reviewIsCurrent = reviewIsCurrent;
	}

	public String getReviewJob() {
		return reviewJob;
	}

	public void setReviewJob(String reviewJob) {
		this.reviewJob = reviewJob;
	}

	public String getReviewEmployCate() {
		return reviewEmployCate;
	}

	public void setReviewEmployCate(String reviewEmployCate) {
		this.reviewEmployCate = reviewEmployCate;
	}

	public String getReviewCareer() {
		return reviewCareer;
	}

	public void setReviewCareer(String reviewCareer) {
		this.reviewCareer = reviewCareer;
	}

	public String getReviewLocation() {
		return reviewLocation;
	}

	public void setReviewLocation(String reviewLocation) {
		this.reviewLocation = reviewLocation;
	}

	public int getReviewTotalScore() {
		return reviewTotalScore;
	}

	public void setReviewTotalScore(int reviewTotalScore) {
		this.reviewTotalScore = reviewTotalScore;
	}

	public String getReviewShort() {
		return reviewShort;
	}

	public void setReviewShort(String reviewShort) {
		this.reviewShort = reviewShort;
	}

	public String getReviewMerit() {
		return reviewMerit;
	}

	public void setReviewMerit(String reviewMerit) {
		this.reviewMerit = reviewMerit;
	}

	public String getReviewDisMerit() {
		return reviewDisMerit;
	}

	public void setReviewDisMerit(String reviewDisMerit) {
		this.reviewDisMerit = reviewDisMerit;
	}

	public String getReviewRequest() {
		return reviewRequest;
	}

	public void setReviewRequest(String reviewRequest) {
		this.reviewRequest = reviewRequest;
	}

	public int getReviewGrade01() {
		return reviewGrade01;
	}

	public void setReviewGrade01(int reviewGrade01) {
		this.reviewGrade01 = reviewGrade01;
	}

	public int getReviewGrade02() {
		return reviewGrade02;
	}

	public void setReviewGrade02(int reviewGrade02) {
		this.reviewGrade02 = reviewGrade02;
	}

	public int getReviewGrade03() {
		return reviewGrade03;
	}

	public void setReviewGrade03(int reviewGrade03) {
		this.reviewGrade03 = reviewGrade03;
	}

	public int getReviewGrade04() {
		return reviewGrade04;
	}

	public void setReviewGrade04(int reviewGrade04) {
		this.reviewGrade04 = reviewGrade04;
	}

	public int getReviewGrade05() {
		return reviewGrade05;
	}

	public void setReviewGrade05(int reviewGrade05) {
		this.reviewGrade05 = reviewGrade05;
	}

	public int getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	@Override
	public String toString() {
		return "CompanyReview [reviewNo=" + reviewNo + ", reviewMember=" + reviewMember + ", reviewCompany="
				+ reviewCompany + ", reviewIsCurrent=" + reviewIsCurrent + ", reviewJob=" + reviewJob
				+ ", reviewEmployCate=" + reviewEmployCate + ", reviewCareer=" + reviewCareer + ", reviewLocation="
				+ reviewLocation + ", reviewTotalScore=" + reviewTotalScore + ", reviewShort=" + reviewShort
				+ ", reviewMerit=" + reviewMerit + ", reviewDisMerit=" + reviewDisMerit + ", reviewRequest="
				+ reviewRequest + ", reviewGrade01=" + reviewGrade01 + ", reviewGrade02=" + reviewGrade02
				+ ", reviewGrade03=" + reviewGrade03 + ", reviewGrade04=" + reviewGrade04 + ", reviewGrade05="
				+ reviewGrade05 + ", reviewLike=" + reviewLike + ", reviewDate=" + reviewDate + ", cName=" + cName
				+ "]";
	}

	
	
}

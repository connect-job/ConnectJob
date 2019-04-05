package com.connect.job.model.vo;

public class CompanyReviewLike {
	
	private int likeNo;
	private String likeMember;
	private int likeReview;
	private int likeCompany;
	
	public CompanyReviewLike() {
		// TODO Auto-generated constructor stub
	}

	public CompanyReviewLike(int likeNo, String likeMember, int likeReview, int likeCompany) {
		super();
		this.likeNo = likeNo;
		this.likeMember = likeMember;
		this.likeReview = likeReview;
		this.likeCompany = likeCompany;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getLikeMember() {
		return likeMember;
	}

	public void setLikeMember(String likeMember) {
		this.likeMember = likeMember;
	}

	public int getLikeReview() {
		return likeReview;
	}

	public void setLikeReview(int likeReview) {
		this.likeReview = likeReview;
	}

	public int getLikeCompany() {
		return likeCompany;
	}

	public void setLikeCompany(int likeCompany) {
		this.likeCompany = likeCompany;
	}

	@Override
	public String toString() {
		return "CompanyReviewLike [likeNo=" + likeNo + ", likeMember=" + likeMember + ", likeReview=" + likeReview
				+ ", likeCompany=" + likeCompany + "]";
	}
	
	

}

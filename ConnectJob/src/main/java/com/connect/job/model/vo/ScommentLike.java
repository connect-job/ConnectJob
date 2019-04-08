package com.connect.job.model.vo;

public class ScommentLike {
	
	private int likeNo;
	private String likeMember;
	private int likeComment;
	
	public ScommentLike() {
		// TODO Auto-generated constructor stub
	}

	public ScommentLike(int likeNo, String likeMember, int likeComment) {
		super();
		this.likeNo = likeNo;
		this.likeMember = likeMember;
		this.likeComment = likeComment;
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

	public int getLikeComment() {
		return likeComment;
	}

	public void setLikeComment(int likeComment) {
		this.likeComment = likeComment;
	}

	@Override
	public String toString() {
		return "ScommentLike [likeNo=" + likeNo + ", likeMember=" + likeMember + ", likeComment=" + likeComment + "]";
	}
	
	
	
}

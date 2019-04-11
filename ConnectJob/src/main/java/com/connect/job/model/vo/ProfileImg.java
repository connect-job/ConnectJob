package com.connect.job.model.vo;

import java.util.Date;

public class ProfileImg {
	private int profileImgNo;
	private int resumeNo;
	private String originalFileName;
	private String renamedFileName;
	private Date uploadDate;
	private String status;
	
	public ProfileImg() {
		// TODO Auto-generated constructor stub
	}

	public ProfileImg(int profileImgNo, int resumeNo, String originalFileName, String renamedFileName, Date uploadDate,
			String status) {
		super();
		this.profileImgNo = profileImgNo;
		this.resumeNo = resumeNo;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getProfileImgNo() {
		return profileImgNo;
	}

	public void setProfileImgNo(int profileImgNo) {
		this.profileImgNo = profileImgNo;
	}

	public int getResumeNo() {
		return resumeNo;
	}

	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ProfileImg [profileImgNo=" + profileImgNo + ", resumeNo=" + resumeNo + ", originalFileName="
				+ originalFileName + ", renamedFileName=" + renamedFileName + ", uploadDate=" + uploadDate + ", status="
				+ status + "]";
	}


	
	
}

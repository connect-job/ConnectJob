package com.connect.job.model.vo;

import java.util.Date;

public class Message {
	
	private int mNo;
	private String mTo;
	private String mFrom;
	private String mMessage;
	private Date mDate;
	private String mStatus;
	private int mCount;
	private int mHireNo;
	
	public Message() {
		// TODO Auto-generated constructor stub
	}

	public Message(int mNo, String mTo, String mFrom, String mMessage, Date mDate, String mStatus, int mCount,
			int mHireNo) {
		super();
		this.mNo = mNo;
		this.mTo = mTo;
		this.mFrom = mFrom;
		this.mMessage = mMessage;
		this.mDate = mDate;
		this.mStatus = mStatus;
		this.mCount = mCount;
		this.mHireNo = mHireNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmTo() {
		return mTo;
	}

	public void setmTo(String mTo) {
		this.mTo = mTo;
	}

	public String getmFrom() {
		return mFrom;
	}

	public void setmFrom(String mFrom) {
		this.mFrom = mFrom;
	}

	public String getmMessage() {
		return mMessage;
	}

	public void setmMessage(String mMessage) {
		this.mMessage = mMessage;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public int getmCount() {
		return mCount;
	}

	public void setmCount(int mCount) {
		this.mCount = mCount;
	}

	public int getmHireNo() {
		return mHireNo;
	}

	public void setmHireNo(int mHireNo) {
		this.mHireNo = mHireNo;
	}

	@Override
	public String toString() {
		return "Message [mNo=" + mNo + ", mTo=" + mTo + ", mFrom=" + mFrom + ", mMessage=" + mMessage + ", mDate="
				+ mDate + ", mStatus=" + mStatus + ", mCount=" + mCount + ", mHireNo=" + mHireNo + "]";
	}
	
	
	
	
}

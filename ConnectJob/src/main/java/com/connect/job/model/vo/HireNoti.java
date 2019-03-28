package com.connect.job.model.vo;

import java.sql.Timestamp;

public class HireNoti {
	
	private int HNSeq;
	private String CMemberId;
	private String CId;
	private String HNCareer;
	private String HNFinalEdu;
	private String HNWorkForm;
	private String HNRankPosition;
	private String HNWorkPlace;
	private String HNAge;
	private String HNGender;
	private String HNChargeTast;
	private Timestamp HNSDate;
	private Timestamp HNDDate;
	private String HNRequired;
	private String HNPreference;
	private String HNOri;
	private String HNRe;
	private String HNRecruit;
	private int HNCount;
	private String HNSort;
	
	public HireNoti() {
		// TODO Auto-generated constructor stub
	}

	public HireNoti(int hNSeq, String cMemberId, String cId, String hNCareer, String hNFinalEdu, String hNWorkForm,
			String hNRankPosition, String hNWorkPlace, String hNAge, String hNGender, String hNChargeTast,
			Timestamp hNSDate, Timestamp hNDDate, String hNRequired, String hNPreference, String hNOri, String hNRe,
			String hNRecruit, int hNCount, String hNSort) {
		super();
		HNSeq = hNSeq;
		CMemberId = cMemberId;
		CId = cId;
		HNCareer = hNCareer;
		HNFinalEdu = hNFinalEdu;
		HNWorkForm = hNWorkForm;
		HNRankPosition = hNRankPosition;
		HNWorkPlace = hNWorkPlace;
		HNAge = hNAge;
		HNGender = hNGender;
		HNChargeTast = hNChargeTast;
		HNSDate = hNSDate;
		HNDDate = hNDDate;
		HNRequired = hNRequired;
		HNPreference = hNPreference;
		HNOri = hNOri;
		HNRe = hNRe;
		HNRecruit = hNRecruit;
		HNCount = hNCount;
		HNSort = hNSort;
	}

	public int getHNSeq() {
		return HNSeq;
	}

	public void setHNSeq(int hNSeq) {
		HNSeq = hNSeq;
	}

	public String getCMemberId() {
		return CMemberId;
	}

	public void setCMemberId(String cMemberId) {
		CMemberId = cMemberId;
	}

	public String getCId() {
		return CId;
	}

	public void setCId(String cId) {
		CId = cId;
	}

	public String getHNCareer() {
		return HNCareer;
	}

	public void setHNCareer(String hNCareer) {
		HNCareer = hNCareer;
	}

	public String getHNFinalEdu() {
		return HNFinalEdu;
	}

	public void setHNFinalEdu(String hNFinalEdu) {
		HNFinalEdu = hNFinalEdu;
	}

	public String getHNWorkForm() {
		return HNWorkForm;
	}

	public void setHNWorkForm(String hNWorkForm) {
		HNWorkForm = hNWorkForm;
	}

	public String getHNRankPosition() {
		return HNRankPosition;
	}

	public void setHNRankPosition(String hNRankPosition) {
		HNRankPosition = hNRankPosition;
	}

	public String getHNWorkPlace() {
		return HNWorkPlace;
	}

	public void setHNWorkPlace(String hNWorkPlace) {
		HNWorkPlace = hNWorkPlace;
	}

	public String getHNAge() {
		return HNAge;
	}

	public void setHNAge(String hNAge) {
		HNAge = hNAge;
	}

	public String getHNGender() {
		return HNGender;
	}

	public void setHNGender(String hNGender) {
		HNGender = hNGender;
	}

	public String getHNChargeTast() {
		return HNChargeTast;
	}

	public void setHNChargeTast(String hNChargeTast) {
		HNChargeTast = hNChargeTast;
	}

	public Timestamp getHNSDate() {
		return HNSDate;
	}

	public void setHNSDate(Timestamp hNSDate) {
		HNSDate = hNSDate;
	}

	public Timestamp getHNDDate() {
		return HNDDate;
	}

	public void setHNDDate(Timestamp hNDDate) {
		HNDDate = hNDDate;
	}

	public String getHNRequired() {
		return HNRequired;
	}

	public void setHNRequired(String hNRequired) {
		HNRequired = hNRequired;
	}

	public String getHNPreference() {
		return HNPreference;
	}

	public void setHNPreference(String hNPreference) {
		HNPreference = hNPreference;
	}

	public String getHNOri() {
		return HNOri;
	}

	public void setHNOri(String hNOri) {
		HNOri = hNOri;
	}

	public String getHNRe() {
		return HNRe;
	}

	public void setHNRe(String hNRe) {
		HNRe = hNRe;
	}

	public String getHNRecruit() {
		return HNRecruit;
	}

	public void setHNRecruit(String hNRecruit) {
		HNRecruit = hNRecruit;
	}

	public int getHNCount() {
		return HNCount;
	}

	public void setHNCount(int hNCount) {
		HNCount = hNCount;
	}

	public String getHNSort() {
		return HNSort;
	}

	public void setHNSort(String hNSort) {
		HNSort = hNSort;
	}

	@Override
	public String toString() {
		return "CMember [HNSeq=" + HNSeq + ", CMemberId=" + CMemberId + ", CId=" + CId + ", HNCareer=" + HNCareer
				+ ", HNFinalEdu=" + HNFinalEdu + ", HNWorkForm=" + HNWorkForm + ", HNRankPosition=" + HNRankPosition
				+ ", HNWorkPlace=" + HNWorkPlace + ", HNAge=" + HNAge + ", HNGender=" + HNGender + ", HNChargeTast="
				+ HNChargeTast + ", HNSDate=" + HNSDate + ", HNDDate=" + HNDDate + ", HNRequired=" + HNRequired
				+ ", HNPreference=" + HNPreference + ", HNOri=" + HNOri + ", HNRe=" + HNRe + ", HNRecruit=" + HNRecruit
				+ ", HNCount=" + HNCount + ", HNSort=" + HNSort + "]";
	}
	
	

	
}

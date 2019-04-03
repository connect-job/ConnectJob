package com.connect.job.model.vo;

import java.util.Date;

public class HireNoti {
	
	private int HNSeq;
	private String CMemberId;
	private int companyNo;
	private String title;
	private String HNSort;
	private int HNRecruit;
	private String HNCareer;
	private String HNCate;
	private String HNChargeTask;
	private String HNDept;
	private String HNRankPosition;
	private String HNFinalEdu;
	private String HNWorkForm;
	private String HNMajor;
	private String HNPreference;
	private String HNFor;
	private String HNGender;
	private int HNBirth;
	private String HNSal;
	private String HNWorkPlace;
	private String HN_Stime;
	private String HN_Dtime;
	private Date start;
	private Date end;
	private String HNRequired;
	private String HNOri;
	private String HNRe;
	private String HNProcess;
	private String HNDoc;
	private String HNinterview;
	private String HNName;
	private String HNPhone;
	private String HNCelPhone;
	private String HNEMail;
	private String HNFax;
	private String HNTitle;
	private int HNCount;
	
	public HireNoti() {
		// TODO Auto-generated constructor stub
	}

	public HireNoti(int hNSeq, String cMemberId, int companyNo, String title, String hNSort, int hNRecruit,
			String hNCareer, String hNCate, String hNChargeTask, String hNDept, String hNRankPosition,
			String hNFinalEdu, String hNWorkForm, String hNMajor, String hNPreference, String hNFor, String hNGender,
			int hNBirth, String hNSal, String hNWorkPlace, String hN_Stime, String hN_Dtime, Date start, Date end,
			String hNRequired, String hNOri, String hNRe, String hNProcess, String hNDoc, String hNinterview,
			String hNName, String hNPhone, String hNCelPhone, String hNEMail, String hNFax, String hNTitle,
			int hNCount) {
		super();
		HNSeq = hNSeq;
		CMemberId = cMemberId;
		this.companyNo = companyNo;
		this.title = title;
		HNSort = hNSort;
		HNRecruit = hNRecruit;
		HNCareer = hNCareer;
		HNCate = hNCate;
		HNChargeTask = hNChargeTask;
		HNDept = hNDept;
		HNRankPosition = hNRankPosition;
		HNFinalEdu = hNFinalEdu;
		HNWorkForm = hNWorkForm;
		HNMajor = hNMajor;
		HNPreference = hNPreference;
		HNFor = hNFor;
		HNGender = hNGender;
		HNBirth = hNBirth;
		HNSal = hNSal;
		HNWorkPlace = hNWorkPlace;
		HN_Stime = hN_Stime;
		HN_Dtime = hN_Dtime;
		this.start = start;
		this.end = end;
		HNRequired = hNRequired;
		HNOri = hNOri;
		HNRe = hNRe;
		HNProcess = hNProcess;
		HNDoc = hNDoc;
		HNinterview = hNinterview;
		HNName = hNName;
		HNPhone = hNPhone;
		HNCelPhone = hNCelPhone;
		HNEMail = hNEMail;
		HNFax = hNFax;
		HNTitle = hNTitle;
		HNCount = hNCount;
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

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHNSort() {
		return HNSort;
	}

	public void setHNSort(String hNSort) {
		HNSort = hNSort;
	}

	public int getHNRecruit() {
		return HNRecruit;
	}

	public void setHNRecruit(int hNRecruit) {
		HNRecruit = hNRecruit;
	}

	public String getHNCareer() {
		return HNCareer;
	}

	public void setHNCareer(String hNCareer) {
		HNCareer = hNCareer;
	}

	public String getHNCate() {
		return HNCate;
	}

	public void setHNCate(String hNCate) {
		HNCate = hNCate;
	}

	public String getHNChargeTask() {
		return HNChargeTask;
	}

	public void setHNChargeTask(String hNChargeTask) {
		HNChargeTask = hNChargeTask;
	}

	public String getHNDept() {
		return HNDept;
	}

	public void setHNDept(String hNDept) {
		HNDept = hNDept;
	}

	public String getHNRankPosition() {
		return HNRankPosition;
	}

	public void setHNRankPosition(String hNRankPosition) {
		HNRankPosition = hNRankPosition;
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

	public String getHNMajor() {
		return HNMajor;
	}

	public void setHNMajor(String hNMajor) {
		HNMajor = hNMajor;
	}

	public String getHNPreference() {
		return HNPreference;
	}

	public void setHNPreference(String hNPreference) {
		HNPreference = hNPreference;
	}

	public String getHNFor() {
		return HNFor;
	}

	public void setHNFor(String hNFor) {
		HNFor = hNFor;
	}

	public String getHNGender() {
		return HNGender;
	}

	public void setHNGender(String hNGender) {
		HNGender = hNGender;
	}

	public int getHNBirth() {
		return HNBirth;
	}

	public void setHNBirth(int hNBirth) {
		HNBirth = hNBirth;
	}

	public String getHNSal() {
		return HNSal;
	}

	public void setHNSal(String hNSal) {
		HNSal = hNSal;
	}

	public String getHNWorkPlace() {
		return HNWorkPlace;
	}

	public void setHNWorkPlace(String hNWorkPlace) {
		HNWorkPlace = hNWorkPlace;
	}

	public String getHN_Stime() {
		return HN_Stime;
	}

	public void setHN_Stime(String hN_Stime) {
		HN_Stime = hN_Stime;
	}

	public String getHN_Dtime() {
		return HN_Dtime;
	}

	public void setHN_Dtime(String hN_Dtime) {
		HN_Dtime = hN_Dtime;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	public String getHNRequired() {
		return HNRequired;
	}

	public void setHNRequired(String hNRequired) {
		HNRequired = hNRequired;
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

	public String getHNProcess() {
		return HNProcess;
	}

	public void setHNProcess(String hNProcess) {
		HNProcess = hNProcess;
	}

	public String getHNDoc() {
		return HNDoc;
	}

	public void setHNDoc(String hNDoc) {
		HNDoc = hNDoc;
	}

	public String getHNinterview() {
		return HNinterview;
	}

	public void setHNinterview(String hNinterview) {
		HNinterview = hNinterview;
	}

	public String getHNName() {
		return HNName;
	}

	public void setHNName(String hNName) {
		HNName = hNName;
	}

	public String getHNPhone() {
		return HNPhone;
	}

	public void setHNPhone(String hNPhone) {
		HNPhone = hNPhone;
	}

	public String getHNCelPhone() {
		return HNCelPhone;
	}

	public void setHNCelPhone(String hNCelPhone) {
		HNCelPhone = hNCelPhone;
	}

	public String getHNEMail() {
		return HNEMail;
	}

	public void setHNEMail(String hNEMail) {
		HNEMail = hNEMail;
	}

	public String getHNFax() {
		return HNFax;
	}

	public void setHNFax(String hNFax) {
		HNFax = hNFax;
	}

	public String getHNTitle() {
		return HNTitle;
	}

	public void setHNTitle(String hNTitle) {
		HNTitle = hNTitle;
	}

	public int getHNCount() {
		return HNCount;
	}

	public void setHNCount(int hNCount) {
		HNCount = hNCount;
	}

	@Override
	public String toString() {
		return "HireNoti [HNSeq=" + HNSeq + ", CMemberId=" + CMemberId + ", companyNo=" + companyNo + ", title=" + title
				+ ", HNSort=" + HNSort + ", HNRecruit=" + HNRecruit + ", HNCareer=" + HNCareer + ", HNCate=" + HNCate
				+ ", HNChargeTask=" + HNChargeTask + ", HNDept=" + HNDept + ", HNRankPosition=" + HNRankPosition
				+ ", HNFinalEdu=" + HNFinalEdu + ", HNWorkForm=" + HNWorkForm + ", HNMajor=" + HNMajor
				+ ", HNPreference=" + HNPreference + ", HNFor=" + HNFor + ", HNGender=" + HNGender + ", HNBirth="
				+ HNBirth + ", HNSal=" + HNSal + ", HNWorkPlace=" + HNWorkPlace + ", HN_Stime=" + HN_Stime
				+ ", HN_Dtime=" + HN_Dtime + ", start=" + start + ", end=" + end + ", HNRequired=" + HNRequired
				+ ", HNOri=" + HNOri + ", HNRe=" + HNRe + ", HNProcess=" + HNProcess + ", HNDoc=" + HNDoc
				+ ", HNinterview=" + HNinterview + ", HNName=" + HNName + ", HNPhone=" + HNPhone + ", HNCelPhone="
				+ HNCelPhone + ", HNEMail=" + HNEMail + ", HNFax=" + HNFax + ", HNTitle=" + HNTitle + ", HNCount="
				+ HNCount + "]";
	}

	
}

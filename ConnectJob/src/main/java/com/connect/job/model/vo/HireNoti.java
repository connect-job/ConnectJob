package com.connect.job.model.vo;

import java.util.Arrays;
import java.util.Date;

public class HireNoti {
	
	private int hnSeq;
	private String cMemberId;
	private String[] hnSort;
	private String hnCareer;
	private String hnForm;
	private int hnRecruit;
	private String hnCate;
	private String hnChargeTask;
	private String hnDept;
	private String hnRankPosition;
	private String[] hnFinalEdu;
	private String hnMajor;
	private String hnPreference;
	private String hnGender;
	private String[] hnBirth;
	private String hnSal;
	private String hnWorkPlace;
	private String hnDay;
	private String hnStime;
	private String hnDtime;
	private String startDate;
	private String endDate;
	private String[] hnEve;
	private String hnReMethod;
	private String hnProcess;
	private String hnDoc;
	private String hnInterview;
	private String hnTitle;
	private Date addDate;
	private String cName;
	private String[] category;
	private String cMemberPhone;
	private String cMemberEmail;
	private String cMemberName;
	private int companyAllPeople;
	private String companyRegDate;
	private String companyCate;
	private String companyAddressNew;
	private String companyName;
	
	public HireNoti() {
		// TODO Auto-generated constructor stub
	}

	public HireNoti(int hnSeq, String cMemberId, String[] hnSort, String hnCareer, String hnForm, int hnRecruit,
			String hnCate, String hnChargeTask, String hnDept, String hnRankPosition, String[] hnFinalEdu,
			String hnMajor, String hnPreference, String hnGender, String[] hnBirth, String hnSal, String hnWorkPlace,
			String hnDay, String hnStime, String hnDtime, String startDate, String endDate, String[] hnEve,
			String hnReMethod, String hnProcess, String hnDoc, String hnInterview, String hnTitle, Date addDate,
			String cName, String[] category, String cMemberPhone, String cMemberEmail, String cMemberName,
			int companyAllPeople, String companyRegDate, String companyCate, String companyAddressNew,
			String companyName) {
		super();
		this.hnSeq = hnSeq;
		this.cMemberId = cMemberId;
		this.hnSort = hnSort;
		this.hnCareer = hnCareer;
		this.hnForm = hnForm;
		this.hnRecruit = hnRecruit;
		this.hnCate = hnCate;
		this.hnChargeTask = hnChargeTask;
		this.hnDept = hnDept;
		this.hnRankPosition = hnRankPosition;
		this.hnFinalEdu = hnFinalEdu;
		this.hnMajor = hnMajor;
		this.hnPreference = hnPreference;
		this.hnGender = hnGender;
		this.hnBirth = hnBirth;
		this.hnSal = hnSal;
		this.hnWorkPlace = hnWorkPlace;
		this.hnDay = hnDay;
		this.hnStime = hnStime;
		this.hnDtime = hnDtime;
		this.startDate = startDate;
		this.endDate = endDate;
		this.hnEve = hnEve;
		this.hnReMethod = hnReMethod;
		this.hnProcess = hnProcess;
		this.hnDoc = hnDoc;
		this.hnInterview = hnInterview;
		this.hnTitle = hnTitle;
		this.addDate = addDate;
		this.cName = cName;
		this.category = category;
		this.cMemberPhone = cMemberPhone;
		this.cMemberEmail = cMemberEmail;
		this.cMemberName = cMemberName;
		this.companyAllPeople = companyAllPeople;
		this.companyRegDate = companyRegDate;
		this.companyCate = companyCate;
		this.companyAddressNew = companyAddressNew;
		this.companyName = companyName;
	}

	public int getHnSeq() {
		return hnSeq;
	}

	public void setHnSeq(int hnSeq) {
		this.hnSeq = hnSeq;
	}

	public String getcMemberId() {
		return cMemberId;
	}

	public void setcMemberId(String cMemberId) {
		this.cMemberId = cMemberId;
	}

	public String[] getHnSort() {
		return hnSort;
	}

	public void setHnSort(String[] hnSort) {
		this.hnSort = hnSort;
	}

	public String getHnCareer() {
		return hnCareer;
	}

	public void setHnCareer(String hnCareer) {
		this.hnCareer = hnCareer;
	}

	public String getHnForm() {
		return hnForm;
	}

	public void setHnForm(String hnForm) {
		this.hnForm = hnForm;
	}

	public int getHnRecruit() {
		return hnRecruit;
	}

	public void setHnRecruit(int hnRecruit) {
		this.hnRecruit = hnRecruit;
	}

	public String getHnCate() {
		return hnCate;
	}

	public void setHnCate(String hnCate) {
		this.hnCate = hnCate;
	}

	public String getHnChargeTask() {
		return hnChargeTask;
	}

	public void setHnChargeTask(String hnChargeTask) {
		this.hnChargeTask = hnChargeTask;
	}

	public String getHnDept() {
		return hnDept;
	}

	public void setHnDept(String hnDept) {
		this.hnDept = hnDept;
	}

	public String getHnRankPosition() {
		return hnRankPosition;
	}

	public void setHnRankPosition(String hnRankPosition) {
		this.hnRankPosition = hnRankPosition;
	}

	public String[] getHnFinalEdu() {
		return hnFinalEdu;
	}

	public void setHnFinalEdu(String[] hnFinalEdu) {
		this.hnFinalEdu = hnFinalEdu;
	}

	public String getHnMajor() {
		return hnMajor;
	}

	public void setHnMajor(String hnMajor) {
		this.hnMajor = hnMajor;
	}

	public String getHnPreference() {
		return hnPreference;
	}

	public void setHnPreference(String hnPreference) {
		this.hnPreference = hnPreference;
	}

	public String getHnGender() {
		return hnGender;
	}

	public void setHnGender(String hnGender) {
		this.hnGender = hnGender;
	}

	public String[] getHnBirth() {
		return hnBirth;
	}

	public void setHnBirth(String[] hnBirth) {
		this.hnBirth = hnBirth;
	}

	public String getHnSal() {
		return hnSal;
	}

	public void setHnSal(String hnSal) {
		this.hnSal = hnSal;
	}

	public String getHnWorkPlace() {
		return hnWorkPlace;
	}

	public void setHnWorkPlace(String hnWorkPlace) {
		this.hnWorkPlace = hnWorkPlace;
	}

	public String getHnDay() {
		return hnDay;
	}

	public void setHnDay(String hnDay) {
		this.hnDay = hnDay;
	}

	public String getHnStime() {
		return hnStime;
	}

	public void setHnStime(String hnStime) {
		this.hnStime = hnStime;
	}

	public String getHnDtime() {
		return hnDtime;
	}

	public void setHnDtime(String hnDtime) {
		this.hnDtime = hnDtime;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String[] getHnEve() {
		return hnEve;
	}

	public void setHnEve(String[] hnEve) {
		this.hnEve = hnEve;
	}

	public String getHnReMethod() {
		return hnReMethod;
	}

	public void setHnReMethod(String hnReMethod) {
		this.hnReMethod = hnReMethod;
	}

	public String getHnProcess() {
		return hnProcess;
	}

	public void setHnProcess(String hnProcess) {
		this.hnProcess = hnProcess;
	}

	public String getHnDoc() {
		return hnDoc;
	}

	public void setHnDoc(String hnDoc) {
		this.hnDoc = hnDoc;
	}

	public String getHnInterview() {
		return hnInterview;
	}

	public void setHnInterview(String hnInterview) {
		this.hnInterview = hnInterview;
	}

	public String getHnTitle() {
		return hnTitle;
	}

	public void setHnTitle(String hnTitle) {
		this.hnTitle = hnTitle;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String[] getCategory() {
		return category;
	}

	public void setCategory(String[] category) {
		this.category = category;
	}

	public String getcMemberPhone() {
		return cMemberPhone;
	}

	public void setcMemberPhone(String cMemberPhone) {
		this.cMemberPhone = cMemberPhone;
	}

	public String getcMemberEmail() {
		return cMemberEmail;
	}

	public void setcMemberEmail(String cMemberEmail) {
		this.cMemberEmail = cMemberEmail;
	}

	public String getcMemberName() {
		return cMemberName;
	}

	public void setcMemberName(String cMemberName) {
		this.cMemberName = cMemberName;
	}

	public int getCompanyAllPeople() {
		return companyAllPeople;
	}

	public void setCompanyAllPeople(int companyAllPeople) {
		this.companyAllPeople = companyAllPeople;
	}

	public String getCompanyRegDate() {
		return companyRegDate;
	}

	public void setCompanyRegDate(String companyRegDate) {
		this.companyRegDate = companyRegDate;
	}

	public String getCompanyCate() {
		return companyCate;
	}

	public void setCompanyCate(String companyCate) {
		this.companyCate = companyCate;
	}

	public String getCompanyAddressNew() {
		return companyAddressNew;
	}

	public void setCompanyAddressNew(String companyAddressNew) {
		this.companyAddressNew = companyAddressNew;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Override
	public String toString() {
		return "HireNoti [hnSeq=" + hnSeq + ", cMemberId=" + cMemberId + ", hnSort=" + Arrays.toString(hnSort)
				+ ", hnCareer=" + hnCareer + ", hnForm=" + hnForm + ", hnRecruit=" + hnRecruit + ", hnCate=" + hnCate
				+ ", hnChargeTask=" + hnChargeTask + ", hnDept=" + hnDept + ", hnRankPosition=" + hnRankPosition
				+ ", hnFinalEdu=" + Arrays.toString(hnFinalEdu) + ", hnMajor=" + hnMajor + ", hnPreference="
				+ hnPreference + ", hnGender=" + hnGender + ", hnBirth=" + Arrays.toString(hnBirth) + ", hnSal=" + hnSal
				+ ", hnWorkPlace=" + hnWorkPlace + ", hnDay=" + hnDay + ", hnStime=" + hnStime + ", hnDtime=" + hnDtime
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", hnEve=" + Arrays.toString(hnEve)
				+ ", hnReMethod=" + hnReMethod + ", hnProcess=" + hnProcess + ", hnDoc=" + hnDoc + ", hnInterview="
				+ hnInterview + ", hnTitle=" + hnTitle + ", addDate=" + addDate + ", cName=" + cName + ", category="
				+ Arrays.toString(category) + ", cMemberPhone=" + cMemberPhone + ", cMemberEmail=" + cMemberEmail
				+ ", cMemberName=" + cMemberName + ", companyAllPeople=" + companyAllPeople + ", companyRegDate="
				+ companyRegDate + ", companyCate=" + companyCate + ", companyAddressNew=" + companyAddressNew
				+ ", companyName=" + companyName + "]";
	}

					
}

package com.connect.job.model.vo;

import java.util.Arrays;

public class Company {

	private int companyNo;
	private String companyUpdate;
	private String companyName;
	private int companyZipcode;
	private String companyAddressOld;
	private String companyAddressNew;
	private int companyStatus;
	private int companyCode;
	private String companyCate;
	private String companyRegDate;
	private int companyAllPeople;
	private int companyPrice;
	private int companyNewPeople;
	private int companyOutPeople;
	private String[] companyLocations;
	
	public Company() {
		// TODO Auto-generated constructor stub
	}

	public Company(int companyNo, String companyUpdate, String companyName, int companyZipcode,
			String companyAddressOld, String companyAddressNew, int companyStatus, int companyCode, String companyCate,
			String companyRegDate, int companyAllPeople, int companyPrice, int companyNewPeople, int companyOutPeople,
			String[] companyLocations) {
		super();
		this.companyNo = companyNo;
		this.companyUpdate = companyUpdate;
		this.companyName = companyName;
		this.companyZipcode = companyZipcode;
		this.companyAddressOld = companyAddressOld;
		this.companyAddressNew = companyAddressNew;
		this.companyStatus = companyStatus;
		this.companyCode = companyCode;
		this.companyCate = companyCate;
		this.companyRegDate = companyRegDate;
		this.companyAllPeople = companyAllPeople;
		this.companyPrice = companyPrice;
		this.companyNewPeople = companyNewPeople;
		this.companyOutPeople = companyOutPeople;
		this.companyLocations = companyLocations;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getCompanyUpdate() {
		return companyUpdate;
	}

	public void setCompanyUpdate(String companyUpdate) {
		this.companyUpdate = companyUpdate;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getCompanyZipcode() {
		return companyZipcode;
	}

	public void setCompanyZipcode(int companyZipcode) {
		this.companyZipcode = companyZipcode;
	}

	public String getCompanyAddressOld() {
		return companyAddressOld;
	}

	public void setCompanyAddressOld(String companyAddressOld) {
		this.companyAddressOld = companyAddressOld;
	}

	public String getCompanyAddressNew() {
		return companyAddressNew;
	}

	public void setCompanyAddressNew(String companyAddressNew) {
		this.companyAddressNew = companyAddressNew;
	}

	public int getCompanyStatus() {
		return companyStatus;
	}

	public void setCompanyStatus(int companyStatus) {
		this.companyStatus = companyStatus;
	}

	public int getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}

	public String getCompanyCate() {
		return companyCate;
	}

	public void setCompanyCate(String companyCate) {
		this.companyCate = companyCate;
	}

	public String getCompanyRegDate() {
		return companyRegDate;
	}

	public void setCompanyRegDate(String companyRegDate) {
		this.companyRegDate = companyRegDate;
	}

	public int getCompanyAllPeople() {
		return companyAllPeople;
	}

	public void setCompanyAllPeople(int companyAllPeople) {
		this.companyAllPeople = companyAllPeople;
	}

	public int getCompanyPrice() {
		return companyPrice;
	}

	public void setCompanyPrice(int companyPrice) {
		this.companyPrice = companyPrice;
	}

	public int getCompanyNewPeople() {
		return companyNewPeople;
	}

	public void setCompanyNewPeople(int companyNewPeople) {
		this.companyNewPeople = companyNewPeople;
	}

	public int getCompanyOutPeople() {
		return companyOutPeople;
	}

	public void setCompanyOutPeople(int companyOutPeople) {
		this.companyOutPeople = companyOutPeople;
	}

	public String[] getCompanyLocations() {
		return companyLocations;
	}

	public void setCompanyLocations(String[] companyLocations) {
		this.companyLocations = companyLocations;
	}

	@Override
	public String toString() {
		return "Company [companyNo=" + companyNo + ", companyUpdate=" + companyUpdate + ", companyName=" + companyName
				+ ", companyZipcode=" + companyZipcode + ", companyAddressOld=" + companyAddressOld
				+ ", companyAddressNew=" + companyAddressNew + ", companyStatus=" + companyStatus + ", companyCode="
				+ companyCode + ", companyCate=" + companyCate + ", companyRegDate=" + companyRegDate
				+ ", companyAllPeople=" + companyAllPeople + ", companyPrice=" + companyPrice + ", companyNewPeople="
				+ companyNewPeople + ", companyOutPeople=" + companyOutPeople + ", companyLocations="
				+ Arrays.toString(companyLocations) + "]";
	}

	
	
	
}

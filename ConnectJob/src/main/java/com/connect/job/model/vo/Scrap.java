package com.connect.job.model.vo;

public class Scrap {
	private int scrapNo;
	private String sCategory;
	private int companyNo;
	private String companyName;
	private String pId;
	private String isDelete;
	
	public Scrap() {
		// TODO Auto-generated constructor stub
	}

	public Scrap(int scrapNo, String sCategory, int companyNo, String companyName, String pId, String isDelete) {
		super();
		this.scrapNo = scrapNo;
		this.sCategory = sCategory;
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.pId = pId;
		this.isDelete = isDelete;
	}

	public int getScrapNo() {
		return scrapNo;
	}

	public void setScrapNo(int scrapNo) {
		this.scrapNo = scrapNo;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "Scrap [scrapNo=" + scrapNo + ", sCategory=" + sCategory + ", companyNo=" + companyNo + ", companyName="
				+ companyName + ", pId=" + pId + ", isDelete=" + isDelete + "]";
	}

	

	

	
}

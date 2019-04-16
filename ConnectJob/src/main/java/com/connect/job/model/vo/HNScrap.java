package com.connect.job.model.vo;

public class HNScrap {
	private int scrapNo;
	private String sCategory;
	private int hnSeq;//공고페이지로 전환시 필요
	private int companyNo; //기업페이지로 전환시 필요
	private String companyName; //db에 없음. join해서 가져오기
	private String hnTitle; //db에 없음. join해서 가져오기
	private String pId;
	private String isDelete;
	
	public HNScrap() {
		// TODO Auto-generated constructor stub
	}

	public HNScrap(int scrapNo, String sCategory, int hnSeq, int companyNo, String companyName, String hnTitle,
			String pId, String isDelete) {
		super();
		this.scrapNo = scrapNo;
		this.sCategory = sCategory;
		this.hnSeq = hnSeq;
		this.companyNo = companyNo;
		this.companyName = companyName;
		this.hnTitle = hnTitle;
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

	public int getHnSeq() {
		return hnSeq;
	}

	public void setHnSeq(int hnSeq) {
		this.hnSeq = hnSeq;
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

	public String getHnTitle() {
		return hnTitle;
	}

	public void setHnTitle(String hnTitle) {
		this.hnTitle = hnTitle;
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
		return "HNScrap [scrapNo=" + scrapNo + ", sCategory=" + sCategory + ", hnSeq=" + hnSeq + ", companyNo="
				+ companyNo + ", companyName=" + companyName + ", hnTitle=" + hnTitle + ", pId=" + pId + ", isDelete="
				+ isDelete + "]";
	}

	



	
	
	
}

package com.connect.job.model.vo;

public class CompanyAvgScore {

	private int avgTotal;
	private int avgGrade1;
	private int avgGrade2;
	private int avgGrade3;
	private int avgGrade4;
	private int avgGrade5;
	
	public CompanyAvgScore() {
	}
	
	public CompanyAvgScore(int avgTotal, int avgGrade1, int avgGrade2, int avgGrade3, int avgGrade4, int avgGrade5) {
		super();
		this.avgTotal = avgTotal;
		this.avgGrade1 = avgGrade1;
		this.avgGrade2 = avgGrade2;
		this.avgGrade3 = avgGrade3;
		this.avgGrade4 = avgGrade4;
		this.avgGrade5 = avgGrade5;
	}

	public int getAvgTotal() {
		return avgTotal;
	}

	public void setAvgTotal(int avgTotal) {
		this.avgTotal = avgTotal;
	}

	public int getAvgGrade1() {
		return avgGrade1;
	}

	public void setAvgGrade1(int avgGrade1) {
		this.avgGrade1 = avgGrade1;
	}

	public int getAvgGrade2() {
		return avgGrade2;
	}

	public void setAvgGrade2(int avgGrade2) {
		this.avgGrade2 = avgGrade2;
	}

	public int getAvgGrade3() {
		return avgGrade3;
	}

	public void setAvgGrade3(int avgGrade3) {
		this.avgGrade3 = avgGrade3;
	}

	public int getAvgGrade4() {
		return avgGrade4;
	}

	public void setAvgGrade4(int avgGrade4) {
		this.avgGrade4 = avgGrade4;
	}

	public int getAvgGrade5() {
		return avgGrade5;
	}

	public void setAvgGrade5(int avgGrade5) {
		this.avgGrade5 = avgGrade5;
	}

	@Override
	public String toString() {
		return "CompanyAvgScore [avgTotal=" + avgTotal + ", avgGrade1=" + avgGrade1 + ", avgGrade2=" + avgGrade2
				+ ", avgGrade3=" + avgGrade3 + ", avgGrade4=" + avgGrade4 + ", avgGrade5=" + avgGrade5 + "]";
	}
	
	
	
}

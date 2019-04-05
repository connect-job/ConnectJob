package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.CompanyAvgScore;
import com.connect.job.model.vo.SearchKeyword;

public interface CompanyDao {

	int insertCompany(Company com);
	int selectCompanyCount();
	List<Company> searchCompany(String keyword);
	List<Company> companyList(Company com, int cPage, int numPerPage);
	Company companyOne(int no);
	List<Company> selectAll(int cPage, int numPerPage);
	int selectAjaxCount(Company com);
	CompanyAvgScore selectScore(int no);
	int searchKeyword(int keyword);
	List<SearchKeyword> selectSearchKeyword();
	

}

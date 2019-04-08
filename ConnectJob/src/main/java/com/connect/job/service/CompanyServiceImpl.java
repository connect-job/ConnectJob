package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.CompanyDao;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.CompanyAvgScore;
import com.connect.job.model.vo.SearchKeyword;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDao dao;
	
	@Override
	public int insertCompany(Company com) {
		return dao.insertCompany(com);
	}

	@Override
	public int selectCompanyCount() {
		return dao.selectCompanyCount();
	}

	@Override
	public List<Company> searchCompany(String keyword) {
		return dao.searchCompany(keyword);
	}

	@Override
	public List<Company> companyList(Company com, int cPage, int numPerPage) {
		return dao.companyList(com, cPage, numPerPage);
	}

	@Override
	public Company selectOne(int no) {
		return dao.companyOne(no);
	}

	@Override
	public List<Company> selectAll(int cPage, int numPerPage) {
		return dao.selectAll(cPage, numPerPage);
	}

	@Override
	public int selectAjaxCount(Company com) {
		return dao.selectAjaxCount(com);
	}

	@Override
	public CompanyAvgScore selectScore(int no) {
		return dao.selectScore(no);
	}

	@Override
	public int searchKeyword(int keyword) {
		return dao.searchKeyword(keyword);
	}

	@Override
	public List<SearchKeyword> selectKeyword() {
		return dao.selectKeyword();
	}

	

	
	
}

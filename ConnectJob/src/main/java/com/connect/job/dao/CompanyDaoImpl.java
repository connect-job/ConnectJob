package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.CompanyAvgScore;
import com.connect.job.model.vo.HireNoti;
import com.connect.job.model.vo.SearchKeyword;

@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertCompany(Company com) {
		return session.insert("company.insertCompany", com);
	}

	@Override
	public int selectCompanyCount() {
		return session.selectOne("company.selectCompanyCount");
	}

	@Override
	public List<Company> searchCompany(String keyword) {
		return session.selectList("company.searchCompany", keyword);
	}

	@Override
	public List<Company> companyList(Company com, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("company.companyList", com, row);
	}

	@Override
	public Company companyOne(int no) {
		return session.selectOne("company.companyOne", no);
	}

	@Override
	public List<Company> selectAll(int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("company.selectAll", null, row);
	}

	@Override
	public int selectAjaxCount(Company com) {
		return session.selectOne("company.selectAjaxCount", com);
	}

	@Override
	public CompanyAvgScore selectScore(int no) {
		return session.selectOne("review.reviewTotalAvg", no);
	}

	@Override
	public int searchKeyword(int keyword) {
		return session.insert("company.insertSearchKeyword", keyword);
	}

	@Override
	public List<SearchKeyword> selectKeyword() {
		return session.selectList("company.selectSearchKeyword");
	}

	@Override
	public List<Company> latestSalary() {
		return session.selectList("company.latestSalary");
	}

	@Override
	public List<Company> latestReview() {
		return session.selectList("company.latestReview");
	}

	@Override
	public List<Company> latestScore() {
		return session.selectList("company.latestScore");
	}

	@Override
	public List<HireNoti> latestHire(int no) {
		return session.selectList("company.latestHire", no);
	}
	
	
	
}

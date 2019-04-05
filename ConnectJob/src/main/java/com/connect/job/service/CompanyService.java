package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.CompanyAvgScore;
import com.connect.job.model.vo.SearchKeyword;

public interface CompanyService {

	// 기업등록
	int insertCompany(Company com);
	
	// 전체 등록된 기업의 수
	int selectCompanyCount();

	// 기업검색
	List<Company> searchCompany(String keyword);

	// 기업리스트 (지역에 따른)
	List<Company> companyList(Company com, int cPage, int numPerPage);

	// 기업상세 페이지
	Company selectOne(int no);
	
	// 기업 전체 리스트
	List<Company> selectAll(int cPage, int numPerPage);

	// Ajax 기업 수
	int selectAjaxCount(Company com);

	// 기업 총평점 및 기타 점수 가져가기
	CompanyAvgScore selectScore(int no);
	
	// 검색어 순위용
	int searchKeyword(int keyword);

	// 검색어 순위 불러오기
	List<SearchKeyword> selectSearchKeyword();

	
}

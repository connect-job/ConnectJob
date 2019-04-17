package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.Resume;

public interface BusinessPageService {
	
	List<Resume> selectAllResume(int cPage, int numPerPage);
	
	int selectResumeCount();

	List<CompanyReview> selectReviewList(int cPage, int numPerPage, String id);
	int selectReviewCount(String id);
	// 기업페이지 진입 시 기업정보 담아오기
	Company selectOne(CMember member);

	
	
	
	
}

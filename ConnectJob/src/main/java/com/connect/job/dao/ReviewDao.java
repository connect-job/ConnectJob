package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.CompanyReview;

public interface ReviewDao {

	int reviewWrite(CompanyReview review);
	int reviewCount(CompanyReview cr);
	List<CompanyReview> reviewList(CompanyReview cr, int cPage, int numPerPage);
	List<CompanyReview> reviewAll(int cPage, int numPerPage);
	int reviewCountAll();
	CompanyReview reviewOne(int reviewNo);

}
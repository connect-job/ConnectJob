package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.CompanyReviewLike;

public interface ReviewService {

	int reviewWrite(CompanyReview review);
	int reviewCount(CompanyReview cr);
	List<CompanyReview> reviewList(CompanyReview cr, int cPage, int numPerPage);
	List<CompanyReview> reviewAll(int cPage, int numPerPage);
	int reviewCountAll();
	CompanyReview reviewOne(int reviewNo);
	int reviewLike(CompanyReviewLike like);
	int reviewUpdate(CompanyReview r);
	List<CompanyReviewLike> reviewLikeAll(int reviewNo);
	List<CompanyReview> reviewLatest();
	int reviewDelete(int num);
	List<CompanyReview> reviewAjaxAll(int cPage, int numPerPage, CompanyReview review);
	int reviewCountAjaxAll(CompanyReview review);

}

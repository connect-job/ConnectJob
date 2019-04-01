package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.ReviewDao;
import com.connect.job.model.vo.CompanyReview;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao dao;

	@Override
	public int reviewWrite(CompanyReview review) {
		return dao.reviewWrite(review);
	}

	@Override
	public int reviewCount(CompanyReview cr) {
		return dao.reviewCount(cr);
	}

	@Override
	public List<CompanyReview> reviewList(CompanyReview cr, int cPage, int numPerPage) {
		return dao.reviewList(cr, cPage, numPerPage);
	}

	@Override
	public List<CompanyReview> reviewAll(int cPage, int numPerPage) {
		return dao.reviewAll(cPage, numPerPage);
	}

	@Override
	public int reviewCountAll() {
		return dao.reviewCountAll();
	}

	@Override
	public CompanyReview reviewOne(int reviewNo) {
		return dao.reviewOne(reviewNo);
	}
	
	

	
	
}

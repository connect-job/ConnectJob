package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.Resume;

@Repository
public class BusinessPageDaoImpl implements BusinessPageDao {

	@Autowired
	private SqlSessionTemplate session;
	
	
	

	@Override
	public List<CompanyReview> selectReviewList(int cPage, int numPerPage, String id) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("Review.selectReviewList", id, row);
	}

	@Override
	public int selectReviewCount(String id) {
		return session.selectOne("Review.selectReviewCount",id);
	}

	@Override
	public List<Resume> selectAllResume(int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("Review.selectAllResume", null, row);
	}

	@Override
	public int selectResumeCount() {
		return session.selectOne("Review.selectResumeCount");
	}

	@Override
	public Company selectOne(CMember member) {
		return session.selectOne("Review.selectOneCompany", member);
	}
	
	

	
}

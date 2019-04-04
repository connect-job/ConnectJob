package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.CompanyReviewLike;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int reviewWrite(CompanyReview review) {
		return session.insert("review.reviewWrite", review);
	}

	@Override
	public int reviewCount(CompanyReview cr) {
		return session.selectOne("review.reviewCount", cr);
	}

	@Override
	public List<CompanyReview> reviewList(CompanyReview cr, int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("review.reviewList", cr, row);
	}

	@Override
	public List<CompanyReview> reviewAll(int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("review.reviewAll", null, row);
	}

	@Override
	public int reviewCountAll() {
		return session.selectOne("review.reviewCountAll");
	}

	@Override
	public CompanyReview reviewOne(int reviewNo) {
		return session.selectOne("review.reviewOne", reviewNo);
	}

	@Override
	public int reviewLike(CompanyReviewLike like) {
		List<CompanyReviewLike> list = session.selectList("review.isLike", like);
		int result = 0;
		if(list.size()>0) {
			// 이미 좋아요 눌렀음, 좋아요 취소
			result = -1;
			session.delete("review.deleteLike", like);
			return result;
		} else {
			// 좋아요 기록 없음, 좋아요 추가
			session.insert("review.reviewLike", like);
			result = 1;
			return result;
		}
		
	}

	@Override
	public int reviewUpdate(CompanyReview r) {
		return session.update("review.reviewUpdate", r);
	}

	@Override
	public List<CompanyReviewLike> reviewLikeAll(int reviewNo) {
		return session.selectList("review.reviewLikeAll", reviewNo);
	}

	
	
}

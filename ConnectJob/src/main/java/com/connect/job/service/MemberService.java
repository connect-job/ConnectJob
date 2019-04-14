package com.connect.job.service;

import java.util.List;
import java.util.Map;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.Member;

public interface MemberService {

	
	int insertMemberSns(Member m);
	
	Member selectOne(Member m);
	Member findId(Member m);
	int deleteMember(Member m);
	int updateMember(Member m);
	
	int updatePw(Member m);
	
	List<Member> selectList();
	
	Member selectOneSns(Member m);
	int emailConfirm(Member m);
	int selectCount(String p_id);
	Member findPw(Member m);
	
	
	int updateStatus(String p_id);
	void insertMember(Member m, StringBuffer sb) throws Exception;

	List<CompanyReview> selectReviewList(CompanyReview review);

	int deleteReview(int review_no);
	
	
}

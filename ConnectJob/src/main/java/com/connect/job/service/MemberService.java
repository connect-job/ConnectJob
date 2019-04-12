package com.connect.job.service;

import java.util.List;
import java.util.Map;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.Member;

public interface MemberService {

	
	int insertMemberKakao(Member m);
	
	Member selectOne(Member m);
	Member findId(Member m);
	int deleteMember(Member m);
	int updateMember(Member m);
	
	int updatePw(Member m);
	
	List<Member> selectList();
	
	Member selectOneKakao(Member m);
	int emailConfirm(Member m);
	
	int selectIdCount(String p_id);
	int selectNickCount(String nickname);
	Member findPw(Member m);
	
	
	int updateStatus(String p_id);
	void insertMember(Member m, StringBuffer sb) throws Exception;

	List<CompanyReview> selectReviewList(CompanyReview review);

	int deleteReview(int review_no);

	
	
	
}

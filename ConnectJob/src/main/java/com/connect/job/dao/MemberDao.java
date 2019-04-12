package com.connect.job.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.Member;

public interface MemberDao {

	/*int insertMember(Member m);*/
	int insertMemberKako(Member m);
	
	Member selectOne(Member m);	
	Member findId(Member m);
	int deleteMember(Member m);
	int updateMember(Member m);
	int updatePw(Member m);
	
	Member selectOneKakao(Member m);
	int emailConfirm(Member m);
	int selectIdCount(String p_id);
	int selectNickCount(String nickname);
	Member findPw(Member m);

	int updateStatus(String p_id);
	void insertMember(Member m) throws Exception;

	List<CompanyReview> selectReviewList(CompanyReview review);
	int deleteReview(int review_no);

	int selectCount();
	List<Member> selectList(int cPage, int numPerPage);

	int searchCount(Map<String, String> map);
	List<Member> searchList(int cPage, int numPerPage, Map<String, String> map);
	
	
	

}

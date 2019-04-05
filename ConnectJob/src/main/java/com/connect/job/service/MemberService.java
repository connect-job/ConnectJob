package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Member;

public interface MemberService {

	int insertMember(Member m) throws Exception;
	Member selectOne(Member m);
	Member findId(Member m);
	int deleteMember(Member m);
	int updateMember(Member m);
	int updatePw(Member m);
	List<Member> selectList();
	Member selectOneKakao(Member m);
	int insertMemberKakao(Member m);
	int checkId(String p_id);
	int emailConfirm(Member m);
	
}

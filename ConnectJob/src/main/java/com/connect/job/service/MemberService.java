package com.connect.job.service;

import com.connect.job.model.vo.Member;

public interface MemberService {

	int insertMember(Member m) throws Exception;
	Member selectOne(Member m);
	Member findId(Member m);
	int deleteMember(Member m);
	int updateMember(Member m);
	int updatePw(Member m);
}

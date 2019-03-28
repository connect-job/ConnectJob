package com.connect.job.service;

import com.connect.job.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectOne(Member m);
	
}

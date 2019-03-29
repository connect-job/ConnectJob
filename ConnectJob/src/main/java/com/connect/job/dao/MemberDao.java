package com.connect.job.dao;

import com.connect.job.model.vo.Member;

public interface MemberDao {

	int insertMember(Member m);
	Member selectOne(Member m);
	int updateEmailConfirm(Member m);

}

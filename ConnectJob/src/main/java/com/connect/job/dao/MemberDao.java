package com.connect.job.dao;

import java.util.HashMap;
import java.util.List;

import com.connect.job.model.vo.Member;

public interface MemberDao {

	int insertMember(Member m);
	Member selectOne(Member m);	
	HashMap<String, Object> kakaoLogin(HashMap<String, Object> userInfo);	
	Member findId(Member m);
	int deleteMember(Member m);
	int updateMember(Member m);
	int updatePw(Member m);
	List<Member> selectList();
	Member selectOneKakao(Member m);
	int insertMemberKakao(Member m);

}

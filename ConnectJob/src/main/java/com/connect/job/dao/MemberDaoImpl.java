package com.connect.job.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertMember(Member m) {
		
		return session.insert("member.insertMember", m);
	}

	@Override
	public Member selectOne(Member m) {
		
		return session.selectOne("member.selectOne", m);
	}

	@Override
	public int updateEmailConfirm(Member m) {
		
		return session.update("member.updateEmailConfirm", m);
	}

	
	
	
}

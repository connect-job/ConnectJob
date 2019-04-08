package com.connect.job.dao;

import java.util.HashMap;
import java.util.List;

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
	public HashMap<String, Object> kakaoLogin(HashMap<String, Object> userInfo) {
		
		return session.selectOne("member.kakaoLogin", userInfo);
	}

	@Override
	public Member findId(Member m) {	
		
		return session.selectOne("member.findId", m);
	}

	@Override
	public int deleteMember(Member m) {
		
		return session.delete("member.deleteMember", m);
	}

	@Override
	public int updateMember(Member m) {
		
		return session.update("member.updateMember", m);
	}

	@Override
	public int updatePw(Member m) {
		
		return session.update("member.updatePw", m);
	}

	@Override
	public List<Member> selectList() {
		return session.selectList("member.selectList");
	}

	@Override
	public Member selectOneKakao(Member m) {
		return session.selectOne("member.selectOneKakao", m);
	}

	@Override
	public int insertMemberKakao(Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.insertMemberKakao", m);
	}

	@Override
	public int selectCount(String p_id) {
	
		return session.selectOne("member.selectCount", p_id);
	}

	@Override
	public int emailConfirm(Member m) {
		
		return session.update("member.emailConfirm", m);
	}

	@Override
	public Member findPw(Member m) {
		// TODO Auto-generated method stub
		
		
		return session.selectOne("member.findPw", m);
	}
	
	
}

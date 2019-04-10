package com.connect.job.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertMemberKako(Member m) {
		
		return session.insert("member.insertMemberKakao", m);
	}

	@Override
	public Member selectOne(Member m) {
		
		return session.selectOne("member.selectOne", m);
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
	public int selectCount(String p_id) {
	
		return session.selectOne("member.selectCount", p_id);
	}

	@Override
	public int emailConfirm(Member m) {
		
		return session.update("member.emailConfirm", m);
	}

	@Override
	public Member findPw(Member m) {
		
		return session.selectOne("member.findPw", m);
	}

	@Override
	public int updateStatus(String p_id) {
		// TODO Auto-generated method stub
		return session.update("member.mailStatus", p_id);
	}

	@Override
	public void insertMember(Member m) throws Exception {
		// TODO Auto-generated method stub
		session.insert("member.insertMember", m);
	}

	@Override
	public List<CompanyReview> selectReviewList(CompanyReview review) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectReviewList", review);
	}

	@Override
	public int deleteReview(int review_no) {
		// TODO Auto-generated method stub
		return session.delete("member.deleteReview", review_no);
	}

	
	
	
}

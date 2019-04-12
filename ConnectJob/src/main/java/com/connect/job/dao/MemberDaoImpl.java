package com.connect.job.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public Member selectOneKakao(Member m) {
		return session.selectOne("member.selectOneKakao", m);
	}

	@Override
	public int selectIdCount(String p_id) {
	
		return session.selectOne("member.selectIdCount", p_id);
	}	

	@Override
	public int selectNickCount(String nickname) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectNickCount", nickname);
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
		
		return session.update("member.mailStatus", p_id);
	}

	@Override
	public void insertMember(Member m) throws Exception {
		
		session.insert("member.insertMember", m);
	}

	@Override
	public List<CompanyReview> selectReviewList(CompanyReview review) {
		
		return session.selectList("member.selectReviewList", review);
	}

	@Override
	public int deleteReview(int review_no) {
		
		return session.delete("member.deleteReview", review_no);
	}

	@Override
	public int selectCount() {
		
		return session.selectOne("member.selectCount");
	}

	@Override
	public List<Member> selectList(int cPage, int numPerPage) {
		
		return session.selectList("member.selectList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int searchCount(Map<String, String> map) {
		
		return session.selectOne("member.searchCount", map);
	}

	@Override
	public List<Member> searchList(int cPage, int numPerPage, Map<String, String> map) {
		return session.selectList("member.searchList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	
	
	
}

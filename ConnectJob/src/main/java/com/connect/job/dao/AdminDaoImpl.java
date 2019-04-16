package com.connect.job.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Inquiry;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Notice;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Inquiry> helpPageInquiryList(int cPage, int numPerPage/*, String id*/) {
		return session.selectList("helpAdmin.helpPageInquiryList",/*id,*/ null,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount(/*String id*/) {
		return session.selectOne("helpAdmin.selectCount"/*,id*/);
	}

	@Override
	public Inquiry helpPageInquiryView(int no) {
		return session.selectOne("helpAdmin.helpPageInquiryView",no);
	}

	@Override
	public int helpInquiryUpdate(Inquiry i) {
		return session.update("helpAdmin.helpInquiryUpdate",i);
	}
	//회원관리
	@Override
	public List<Member> memberList(int cPage, int numPerPage) {
		
		return session.selectList("helpAdmin.memberList", null, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int searchMemberCount(Map<String, String> map) {
		
		return session.selectOne("helpAdmin.memberCount", map);
	}

	@Override
	public List<Member> searchMemberList(int cPage, int numPerPage, Map<String, String> map) {
		
		return session.selectList("helpAdmin.searchMemberList", map, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return session.selectOne("helpAdmin.memberCount");
	}

	@Override
	public int deleteMember(String p_id) {
		// TODO Auto-generated method stub
		return session.delete("helpAdmin.deleteMember", p_id);
	}

	@Override
	public List<Notice> noticeList(int cPage, int numPerPage) {
		
		return session.selectList("helpAdmin.noticeList", null, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int noticeCount() {
		
		return session.selectOne("helpAdmin.noticeCount");
	}

	@Override
	public List<Notice> searchNoticeList(int cPage, int numPerPage, Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectList("helpAdmin.searchNoticeList", map, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int searchNoticeCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectOne("helpAdmin.searchNoticeCount", map);
	}

	@Override
	public int deleteNotice(int notice_no) {
		// TODO Auto-generated method stub
		return session.delete("helpAdmin.deleteNotice", notice_no);
	}

	@Override
	public Notice selectNoticeOne(int notice_no) {
		// TODO Auto-generated method stub
		return session.selectOne("helpAdmin.selectNoticeOne", notice_no);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return session.update("helpAdmin.updateNotice", n);
	}
	
	

	
	
}

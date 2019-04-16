package com.connect.job.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.AdminDao;
import com.connect.job.model.vo.Faq;
import com.connect.job.model.vo.Inquiry;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Notice;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao dao;
	
	@Override
	public List<Inquiry> helpPageInquiryList(int cPage, int numPerPage) {
		return dao.helpPageInquiryList(cPage, numPerPage);
	}

	@Override
	public int selectCount() {
		return dao.selectCount();
	}

	@Override
	public Inquiry helpPageInquiryView(int no) {

		return dao.helpPageInquiryView(no);
	}

	@Override
	public int helpInquiryUpdate(Inquiry i) {

		return dao.helpInquiryUpdate(i);
	}

	@Override
	public List<Faq> faq(int cPage, int numPerPage) {

		return dao.faq(cPage, numPerPage);
	}

	@Override
	public int selectFaqCount() {

		return dao.selectFaqCount();
	}

	@Override
	public Faq faqView(int no) {

		return dao.faqView(no);
	}

	@Override
	public int faqUpdate(Faq f) {

		return dao.faqUpdate(f);
	}
	
	
	//회원관리
	@Override
	public List<Member> memberList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.memberList(cPage, numPerPage);
	}

	@Override
	public int searchMemberCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchMemberCount(map);
	}

	@Override
	public List<Member> searchMemberList(int cPage, int numPerPage, Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchMemberList(cPage, numPerPage, map);
	}

	@Override
	public int memberCount() {
		// TODO Auto-generated method stub
		return dao.memberCount();
	}

	@Override
	public int deleteMember(String p_id) {
		// TODO Auto-generated method stub
		return dao.deleteMember(p_id);
	}	

	//공지사항 관리
	@Override
	public List<Notice> noticeList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.noticeList(cPage, numPerPage);
	}

	@Override
	public int noticeCount() {
		// TODO Auto-generated method stub
		return dao.noticeCount();
	}

	@Override
	public List<Notice> searchNoticeList(int cPage, int numPerPage, Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchNoticeList(cPage, numPerPage, map);
	}

	@Override
	public int searchNoticeCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchNoticeCount(map);
	}

	@Override
	public int deleteNotice(int notice_no) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(notice_no);
	}

	@Override
	public Notice selectNoticeOne(int notice_no) {
		// TODO Auto-generated method stub
		return dao.selectNoticeOne(notice_no);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return dao.updateNotice(n);
	}
	
	
	
}

package com.connect.job.service;

import java.util.List;
import java.util.Map;

import com.connect.job.model.vo.Inquiry;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Notice;

public interface AdminService {

	List<Inquiry> helpPageInquiryList(int cPage, int numPerPage/*, String id*/);
	int selectCount(/*String id*/);
	Inquiry helpPageInquiryView(int no);
	int helpInquiryUpdate(Inquiry i);
	List<Member> memberList(int cPage, int numPerPage);
	int searchMemberCount(Map<String, String> map);
	List<Member> searchMemberList(int cPage, int numPerPage, Map<String, String> map);
	int memberCount();
	int deleteMember(String p_id);
	List<Notice> noticeList(int cPage, int numPerPage);
	int noticeCount();
	List<Notice> searchNoticeList(int cPage, int numPerPage, Map<String, String> map);
	int searchNoticeCount(Map<String, String> map);
	int deleteNotice(int notice_no);
	Notice selectNoticeOne(int notice_no);
	int updateNotice(Notice n);

}

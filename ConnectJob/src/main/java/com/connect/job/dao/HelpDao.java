package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Inquiry;

public interface HelpDao {

	int insertInquiry(Inquiry i);
	
	List<Inquiry> inquiryView(int no);
	List<Inquiry> inquiryList(int cPage, int numPerPage, String id);
	int selectCount(String id);
	
}

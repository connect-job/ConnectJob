package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Inquiry;

public interface HelpAdminDao {

	List<Inquiry> helpPageInquiryList(int cPage, int numPerPage, String id);
	int selectCount(String id);

}

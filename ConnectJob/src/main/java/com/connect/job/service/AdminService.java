package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Inquiry;

public interface AdminService {

	List<Inquiry> helpPageInquiryList(int cPage, int numPerPage, String id);
	int selectCount(String id);
	Inquiry helpPageInquiryView(int no);
	int helpInquiryUpdate(Inquiry i);

}

package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Faq;
import com.connect.job.model.vo.Inquiry;

public interface HelpService {

	int insertInquiry(Inquiry i);
	
	Inquiry inquiryView(int no);
	List<Inquiry> inquiryList(int cPage, int numPerPage, String id);
	int selectCount(String id);
	int insertFaq(Faq f);

	List<Faq> faqView(int cPage, int numPerPage);
	int selectFaqCountOne();

}

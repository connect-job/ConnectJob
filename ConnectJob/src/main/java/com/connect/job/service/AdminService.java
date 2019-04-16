package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Faq;
import com.connect.job.model.vo.Inquiry;

public interface AdminService {

	List<Inquiry> helpPageInquiryList(int cPage, int numPerPage);
	int selectCount();
	Inquiry helpPageInquiryView(int no);
	int helpInquiryUpdate(Inquiry i);
	List<Faq> faq(int cPage, int numPerPage);
	int selectFaqCount();
	Faq faqView(int no);
	int faqUpdate(Faq f);

}

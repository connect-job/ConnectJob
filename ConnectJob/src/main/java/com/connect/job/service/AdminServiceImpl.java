package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.AdminDao;
import com.connect.job.model.vo.Faq;
import com.connect.job.model.vo.Inquiry;

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
	
	
	
}

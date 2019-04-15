package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.HelpAdminDao;
import com.connect.job.model.vo.Inquiry;

@Service
public class HelpAdminServiceImpl implements HelpAdminService {

	@Autowired
	private HelpAdminDao dao;
	
	@Override
	public List<Inquiry> helpPageInquiryList(int cPage, int numPerPage, String id) {
		return dao.helpPageInquiryList(cPage, numPerPage, id);
	}

	@Override
	public int selectCount(String id) {
		return dao.selectCount(id);
	}

	@Override
	public Inquiry helpPageInquiryView(int no) {

		return dao.helpPageInquiryView(no);
	}

	@Override
	public int helpInquiryUpdate(Inquiry i) {

		return dao.helpInquiryUpdate(i);
	}
	
	
}

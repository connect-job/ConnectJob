package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.HelpDao;
import com.connect.job.model.vo.Inquiry;

@Service
public class HelpServiceImpl implements HelpService {

	@Autowired
	private HelpDao dao;
	
	@Override
	public int insertInquiry(Inquiry i) {

		return dao.insertInquiry(i);
	}

	

	@Override
	public List<Inquiry> inquiryView(int no) {

		return dao.inquiryView(no);
	}

	@Override
	public List<Inquiry> inquiryList(int cPage, int numPerPage, String id) {
		return dao.inquiryList(cPage, numPerPage, id);
	}

	@Override
	public int selectCount(String id) {
		return dao.selectCount(id);
	}
	
	
	

}


package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.dao.BusinessPageDao;
import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.Resume;

@Repository
public class BusinessPageServiceImpl implements BusinessPageService {

	@Autowired
	private BusinessPageDao dao;

	@Override
	public List<Resume> selectAllResume(int cPage, int numPerPage) {
		return dao.selectAllResume(cPage,numPerPage);
	}

	@Override
	public int selectResumeCount() {
		return dao.selectResumeCount();
	}

	@Override
	public Company selectOne(CMember member) {
		return dao.selectOne(member);
	}
	
	
	
}

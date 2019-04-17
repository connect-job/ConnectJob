package com.connect.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.ApplicationDao;
import com.connect.job.model.vo.Application;

@Service
public class ApplicationServiceImpl implements ApplicationService {
	@Autowired
	private ApplicationDao dao;

	@Override
	public int insertApplication(Application a) {
		return dao.insertApplication(a);
	}

	@Override
	public int selectAllCnt(String pId) {
		return dao.selectAllCnt(pId);
	}


	
	
}

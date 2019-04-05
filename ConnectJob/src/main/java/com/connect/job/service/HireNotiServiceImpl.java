package com.connect.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.HireNotiDao;
import com.connect.job.model.vo.HireNoti;

@Service
public class HireNotiServiceImpl implements HireNotiService {

	@Autowired
	private HireNotiDao dao;

	@Override
	public int insertNoti(HireNoti h) {

		return dao.insertNoti(h);
	}
	
	
}

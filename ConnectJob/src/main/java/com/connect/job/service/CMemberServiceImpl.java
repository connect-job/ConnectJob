package com.connect.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.CMemberDao;
import com.connect.job.model.vo.CMember;

@Service
public class CMemberServiceImpl implements CMemberService {

	@Autowired
	private CMemberDao dao;
	
	@Override
	public int insertMember(CMember m) {
		
		return dao.insertCMember(m);
	}

	@Override
	public CMember selectOne(CMember m) {
		// TODO Auto-generated method stub
		return dao.selectOne(m);
	}

	
	
}

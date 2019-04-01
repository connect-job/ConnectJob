package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.model.vo.Senier;

@Service
public class SenierServiceImpl implements SenierService {

	@Autowired
	private SenierDao dao;
	
	@Override
	public int insertSenier(Senier s) {
		
		return dao.insertSenier(s);
	}

	@Override
	public List<Senier> senierList(int cPage, int numPerPage) {
		
		return dao.senierList(cPage, numPerPage);
	}

	@Override
	public int selectCount() {
		
		return dao.selectCount();
	}
	
	
	
	
}

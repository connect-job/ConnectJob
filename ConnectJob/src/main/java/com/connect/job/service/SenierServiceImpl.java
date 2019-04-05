package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.SenierDao;
import com.connect.job.model.vo.Scomment;
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

	

	@Override
	public List<Senier> senierOneList(int no) {
		
		return dao.senierOneList(no);
	}

	@Override
	public int insertComWrite(Scomment sco) {
		return dao.insertComWrite(sco);
	}

	@Override
	public List<Scomment> comList(Scomment sco) {

		return dao.comList(sco);
	}

	@Override
	public List<Scomment> selectAll(int cPage, int numPerPage) {

		return dao.selectAll(cPage, numPerPage);
	}

	@Override
	public int selectcomCount() {

		return dao.selectcomCount();
	}

	
	
	
	
	
	
	
	
}

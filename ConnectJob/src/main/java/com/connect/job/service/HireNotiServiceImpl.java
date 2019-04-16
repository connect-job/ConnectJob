package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.HireNotiDao;
import com.connect.job.model.vo.HireNoti;

@Service
public class HireNotiServiceImpl implements HireNotiService {

	@Autowired
	private HireNotiDao dao;
	
	
	

	@Override
	public List<HireNoti> selectAllList(int cPage, int numPerPage) {
		return dao.selectAllList(cPage, numPerPage);
	}


	@Override
	public HireNoti selectOne(int no) {
		return dao.selectOne(no);
	}


	@Override
	public int insertNoti(HireNoti h) {
		
		return dao.insertNoti(h);
	}

	@Override
	public List<HireNoti> selectAll(int cPage, int numPerPage) {
		return dao.selectAll(cPage, numPerPage);
	}
	

	@Override
	public List<HireNoti> selectAllAjax(int cPage, int numPerPage, HireNoti h) {
		return dao.selectAllAjax(cPage, numPerPage, h);
	}

	@Override
	public int selectHireNotiCount() {

		return dao.selectHireNotiCount();
	}

	@Override
	public int selectHireNotiCountAjax(HireNoti h) {
		return dao.selectHireNotiCountAjax(h);
	}

	@Override
	public List<HireNoti> selectLatest() {
		return dao.selectLatest();
	}

	
	
	
	
	

	
	
	
}

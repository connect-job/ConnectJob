package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.NoticeDao;
import com.connect.job.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao dao;

	@Override
	public int insertNotice(Notice n) {
		
		return dao.insertNotice(n);
	}

	@Override
	public List<Notice> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public Notice selectOne(int notice_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(notice_no);
	}

	@Override
	public int deleteNotice(int notice_no) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(notice_no);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return dao.updateNotice(n);
	}
	
	
	
	
}

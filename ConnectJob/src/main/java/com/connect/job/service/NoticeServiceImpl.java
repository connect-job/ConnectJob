package com.connect.job.service;

import java.util.List;
import java.util.Map;

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
	public List<Notice> selectList(int cPage, int numPerPage) {
		
		return dao.selectList(cPage, numPerPage);
	}

	@Override
	public Notice selectOne(int notice_no) {
		
		return dao.selectOne(notice_no);
	}

	@Override
	public int deleteNotice(int notice_no) {
		
		return dao.deleteNotice(notice_no);
	}

	@Override
	public int updateNotice(Notice n) {
		
		return dao.updateNotice(n);
	}

	@Override
	public int selectCount() {
		
		return dao.selectCount();
	}

	@Override
	public Notice selectOne(int notice_no, boolean hasRead) {
		
		if(notice_no!=0 && !hasRead) {
			int result=dao.updateCount(notice_no);			
		}
		return dao.selectOne(notice_no, hasRead);
	}

	@Override
	public int searchCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchCount(map);
	}

	@Override
	public List<Notice> searchList(int cPage, int numPerPage, Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.searchList(cPage, numPerPage, map);
	}

	@Override
	public List<Notice> selectTopList() {
		return dao.selectTopList();
	}

	@Override
	public List<Notice> latestNotice() {
		return dao.latestNotice();
	}

	
	
	
	
	
}

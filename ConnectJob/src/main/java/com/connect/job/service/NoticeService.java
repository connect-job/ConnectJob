package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Notice;

public interface NoticeService {

	int insertNotice(Notice n);

	List<Notice> selectList();

	Notice selectOne(int notice_no);

	int deleteNotice(int notice_no);

	int updateNotice(Notice n);
	
}

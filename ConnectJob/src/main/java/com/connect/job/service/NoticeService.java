package com.connect.job.service;

import java.util.List;
import java.util.Map;

import com.connect.job.model.vo.Notice;

public interface NoticeService {

	int insertNotice(Notice n);

	List<Notice> selectList(int cPage, int numPerPage);

	Notice selectOne(int notice_no);

	int deleteNotice(int notice_no);

	int updateNotice(Notice n);

	int selectCount();

	Notice selectOne(int notice_no, boolean hasRead);

	//검색
	int searchCount(Map<String, String> map); 

	List<Notice> searchList(int cPage, int numPerPage, Map<String, String> map);

	List<Notice> selectTopList();
	
}

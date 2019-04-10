package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Notice;

public interface NoticeDao {

	int insertNotice(Notice n);

	List<Notice> selectList(int cPage, int numPerPage);

	Notice selectOne(int notice_no);

	int deleteNotice(int notice_no);

	int updateNotice(Notice n);

	int selectCount();

	Notice selectOne(int notice_no, boolean hasRead);

	int updateCount(int notice_no);

}

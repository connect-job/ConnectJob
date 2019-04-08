package com.connect.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertNotice(Notice n) {
		
		return session.insert("notice.insertNotice", n);
	}

	@Override
	public List<Notice> selectList() {
		
		return session.selectList("notice.selectList");
	}

	@Override
	public Notice selectOne(int notice_no) {
		
		return session.selectOne("notice.selectOne", notice_no);
	}

	@Override
	public int deleteNotice(int notice_no) {
		
		return session.delete("notice.deleteNotice", notice_no);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return session.update("notice.updateNotice", n);
	}
	
	
	
}

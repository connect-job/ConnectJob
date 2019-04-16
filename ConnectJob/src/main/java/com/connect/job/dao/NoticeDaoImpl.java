package com.connect.job.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Notice> selectList(int cPage, int numPerPage) {
		
		return session.selectList("notice.selectList", null, new RowBounds((cPage-1)*numPerPage,numPerPage));
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
		
		return session.update("notice.updateNotice", n);
	}

	@Override
	public int selectCount() {		
		return session.selectOne("notice.selectCount");
	}


	@Override
	public Notice selectOne(int notice_no, boolean hasRead) {
		
		return session.selectOne("notice.selectOne", notice_no);
	}

	@Override
	public int updateCount(int notice_no) {
		
		return session.update("notice.updateCount", notice_no);
	}

	@Override
	public int searchCount(Map<String, String> map) {
		
		return session.selectOne("notice.searchCount", map);
	}

	@Override
	public List<Notice> searchList(int cPage, int numPerPage, Map<String, String> map) {
		
		return session.selectList("notice.searchList", map, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public List<Notice> selectTopList() {
		return session.selectList("notice.selectTopList");
	}

	@Override
	public List<Notice> latestNotice() {
		return session.selectList("notice.latestNotice");
	}
	
	
	
}

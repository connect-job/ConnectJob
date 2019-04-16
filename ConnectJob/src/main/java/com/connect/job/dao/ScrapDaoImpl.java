package com.connect.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Scrap;

@Repository
public class ScrapDaoImpl implements ScrapDao {
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertScrap(Scrap s) {
		return session.insert("scrap.insertScrap", s);
	}

	@Override
	public List<Scrap> selectCPScrapList(Scrap s) {
		return session.selectList("scrap.selectCPScrapList",s);
	}

	@Override
	public int selectAllScrapCnt(Scrap s) {
		return session.selectOne("scrap.selectAllScrapCnt",s);
	}

	@Override
	public int selectCPScrapCnt(Scrap s) {
		return session.selectOne("scrap.selectCPScrapCnt",s);
	}

	@Override
	public int selectHNScrapCnt(Scrap s) {
		return session.selectOne("scrap.selectHNScrapCnt",s);
	}

	@Override
	public List<Scrap> selectAllScrapList(Scrap s) {
		return session.selectList("scrap.selectAllScrapList",s);
	}

	@Override
	public List<Scrap> selectHNScrapList(Scrap s) {
		return session.selectList("scrap.selectHNScrapList",s);
	}

	@Override
	public int deleteScrap(int scrapNo) {
		return session.update("scrap.deleteScrap", scrapNo);
	}

	@Override
	public Scrap selectScrap(Scrap s) {
		return session.selectOne("scrap.selectScrap", s);
	}
	
	

}

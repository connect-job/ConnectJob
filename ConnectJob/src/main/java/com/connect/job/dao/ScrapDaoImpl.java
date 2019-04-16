package com.connect.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.CPScrap;
import com.connect.job.model.vo.HNScrap;

@Repository
public class ScrapDaoImpl implements ScrapDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertCPScrap(CPScrap cp) {
		return session.insert("scrap.insertCPScrap", cp);
	}

	@Override
	public int insertHNScrap(HNScrap hn) {
		return session.insert("scrap.insertHNScrap", hn);
	}

	@Override
	public List<CPScrap> selectCPScrapList(CPScrap cp) {
		return session.selectList("scrap.selectCPScrapList", cp);
	}

	@Override
	public List<HNScrap> selectHNScrapList(HNScrap hn) {
		return session.selectList("scrap.selectHNScrapList", hn);
	}

	@Override
	public int selectCPScrapCnt(CPScrap cp) {
		return session.selectOne("scrap.selectCPScrapCnt", cp);
	}

	@Override
	public int selectHNScrapCnt(HNScrap hn) {
		return session.selectOne("scrap.selectHNScrapCnt", hn);
	}

	@Override
	public CPScrap selectCPScrap(CPScrap cp) {
		return session.selectOne("scrap.selectCPScrap", cp);
	}

	@Override
	public HNScrap selectHNScrap(HNScrap hn) {
		return session.selectOne("scrap.selectHNScrap", hn);
	}

	@Override
	public int deleteCPScrap(int cpScrapNo) {
		return session.delete("scrap.deleteCPScrap", cpScrapNo);
	}

	@Override
	public int deleteHNScrap(int hnScrapNo) {
		return session.delete("scrap.deleteHNScrap", hnScrapNo);
	}
	
	
	

}

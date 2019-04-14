package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.ScrapDao;
import com.connect.job.model.vo.Scrap;

@Service
public class ScrapServiceImpl implements ScrapService {
	@Autowired
	private ScrapDao dao;

	@Override
	public int insertCPScrap(Scrap s) {
		return dao.insertCPScrap(s);
	}

	@Override
	public List<Scrap> selectCPScrapList(Scrap s) {
		return dao.selectCPScrapList(s);
	}

	@Override
	public int selectAllScrapCnt(Scrap s) {
		return dao.selectAllScrapCnt(s);
	}

	@Override
	public int selectCPScrapCnt(Scrap s) {
		return dao.selectCPScrapCnt(s);
	}

	@Override
	public int selectHNScrapCnt(Scrap s) {
		return dao.selectHNScrapCnt(s);
	}

	@Override
	public List<Scrap> selectAllScrapList(Scrap s) {
		return dao.selectAllScrapList(s);
	}

	@Override
	public List<Scrap> selectHNScrapList(Scrap s) {
		return dao.selectHNScrapList(s);
	}

	@Override
	public int deleteScrap(int scrapNo) {
		return dao.deleteScrap(scrapNo);
	}
	
	
	
	
	
}

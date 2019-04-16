package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.ScrapDao;
import com.connect.job.model.vo.CPScrap;
import com.connect.job.model.vo.HNScrap;

@Service
public class ScrapServiceImpl implements ScrapService {
	@Autowired
	private ScrapDao dao;

	@Override
	public int insertCPScrap(CPScrap cp) {
		return dao.insertCPScrap(cp);
	}

	@Override
	public int insertHNScrap(HNScrap hn) {
		return dao.insertHNScrap(hn);
	}

	@Override
	public List<CPScrap> selectCPScrapList(CPScrap cp) {
		return dao.selectCPScrapList(cp);
	}

	@Override
	public List<HNScrap> selectHNScrapList(HNScrap hn) {
		return dao.selectHNScrapList(hn);
	}

	@Override
	public int selectCPScrapCnt(CPScrap cp) {
		return dao.selectCPScrapCnt(cp);
	}

	@Override
	public int selectHNScrapCnt(HNScrap hn) {
		return dao.selectHNScrapCnt(hn);
	}

	@Override
	public CPScrap selectCPScrap(CPScrap cp) {
		return dao.selectCPScrap(cp);
	}

	@Override
	public HNScrap selectHNScrap(HNScrap hn) {
		return dao.selectHNScrap(hn);
	}

	@Override
	public int deleteCPScrap(int cpScrapNo) {
		return dao.deleteCPScrap(cpScrapNo);
	}

	@Override
	public int deleteHNScrap(int hnScrapNo) {
		return dao.deleteHNScrap(hnScrapNo);
	}

	
	
	
	
	
}

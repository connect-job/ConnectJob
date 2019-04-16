package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Scrap;

public interface ScrapDao {
	int insertScrap(Scrap s);
	
	List<Scrap> selectCPScrapList(Scrap s);
	List<Scrap> selectAllScrapList(Scrap s);
	List<Scrap> selectHNScrapList(Scrap s);
	
	int selectAllScrapCnt(Scrap s);
	int selectCPScrapCnt(Scrap s);
	int selectHNScrapCnt(Scrap s);
	Scrap selectScrap(Scrap s);
	
	int deleteScrap(int scrapNo);
}

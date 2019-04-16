package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.CPScrap;
import com.connect.job.model.vo.HNScrap;

public interface ScrapService {
	int insertCPScrap(CPScrap cp);
	int insertHNScrap(HNScrap hn);
	
	List<CPScrap> selectCPScrapList(CPScrap cp);
	List<HNScrap> selectHNScrapList(HNScrap hn);
	
	int selectCPScrapCnt(CPScrap cp);
	int selectHNScrapCnt(HNScrap hn );
	CPScrap selectCPScrap(CPScrap cp);
	HNScrap selectHNScrap(HNScrap hn);
	
	int deleteCPScrap(int cpScrapNo);
	int deleteHNScrap(int hnScrapNo);
}

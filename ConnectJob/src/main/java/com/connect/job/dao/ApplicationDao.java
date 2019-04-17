package com.connect.job.dao;

import com.connect.job.model.vo.Application;

public interface ApplicationDao {
	int insertApplication(Application a);
	int selectAllCnt(String pId);
}

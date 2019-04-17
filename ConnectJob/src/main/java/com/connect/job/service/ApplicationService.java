package com.connect.job.service;

import com.connect.job.model.vo.Application;

public interface ApplicationService {
	int insertApplication(Application a);
	int selectAllCnt(String pId);
}

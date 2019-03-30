package com.connect.job.service;

import com.connect.job.model.vo.CMember;

public interface CMemberService {
	
	int insertMember(CMember m);

	CMember selectOne(CMember m);

}

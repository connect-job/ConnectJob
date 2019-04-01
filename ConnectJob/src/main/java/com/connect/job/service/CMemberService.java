package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.CMember;

public interface CMemberService {
	
	int insertMember(CMember m);

	CMember selectOne(CMember m);
	
	int deleteMember(CMember m);
	
	int updateMember(CMember m);
	
	List<CMember> selectList();

}

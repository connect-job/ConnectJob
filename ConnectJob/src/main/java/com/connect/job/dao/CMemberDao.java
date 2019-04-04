package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.CMember;

public interface CMemberDao {
	
	int insertCMember(CMember m);
	
	CMember selectOne(CMember m);
	
	int deleteMember(CMember m);
	
	int updateMember(CMember m);
	
	List<CMember> selectList();

}

package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.Resume;

public interface BusinessPageDao {

	List<Resume> selectAllResume(int cPage, int numPerPage);

	int selectResumeCount();

	Company selectOne(CMember member);
	
	

}

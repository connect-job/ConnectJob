package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Resume;

public interface BusinessPageService {
	
	List<Resume> selectAllResume(int cPage, int numPerPage);
	
	int selectResumeCount();

	
	
	
	
}

package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.HireNoti;


public interface HireNotiService {
	
	//채용공고 등록
	int insertNoti(HireNoti h);
	
	//채용공고 전체리스트
	List<HireNoti> selectAll(int cPage, int numPerPage);
	
	//채용공고 전체리스트 (Ajax)
	List<HireNoti> selectAllAjax(int cPage, int numPerPage, HireNoti h);
	
	//전체 등록된 채용공고의 수
	int selectHireNotiCount();
	
	//채용공고 상세페이지
	HireNoti selectOne(int no);

	
	int selectHireNotiCountAjax(HireNoti h);

	List<HireNoti> selectLatest();
	List<HireNoti> selectAllList(); //달력에서 쓸 리스트
	

	
}

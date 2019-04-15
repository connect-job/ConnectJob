package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.HireNoti;

public interface HireNotiDao {

	int insertNoti(HireNoti h);
	List<HireNoti> selectAll(int cPage, int numPerPage);
	int selectHireNotiCount();
	HireNoti selectOne(int no);

}

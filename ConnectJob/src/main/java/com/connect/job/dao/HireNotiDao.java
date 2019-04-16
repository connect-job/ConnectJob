package com.connect.job.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.connect.job.model.vo.HireNoti;

public interface HireNotiDao {

	int insertNoti(HireNoti h);
	List<HireNoti> selectAll(int cPage, int numPerPage);
	List<HireNoti> selectAllAjax(int cPage, int numPerPage, HireNoti h);
	int selectHireNotiCount();
	int selectHireNotiCountAjax(HireNoti h);
	List<HireNoti> selectLatest();
	HireNoti selectOne(int no);
	
	List<HireNoti> selectAllList(int cPage,int numPerPage);

}

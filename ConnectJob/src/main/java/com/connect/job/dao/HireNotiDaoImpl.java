package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.connect.job.model.vo.HireNoti;

@Repository
public class HireNotiDaoImpl implements HireNotiDao {

	@Autowired
	private SqlSessionTemplate session;

	
	

	@Override
	public List<HireNoti> selectWaitList(int cPage, int numPerPage, HireNoti h) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("hireNoti.selectWaitList", h, row);
	}

	@Override
	public int selectHireNotiWaitCount(String id) {
		return session.selectOne("hireNoti.selectNotiWaitCount",id);
	}

	@Override
	public List<HireNoti> selectDoList(int cPage, int numPerPage, String id) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("hireNoti.selectDoList", id, row);
	}

	@Override
	public int selectHireNotiDoCount(String id) {
		return session.selectOne("hireNoti.selectNotiDoCount",id);
	}

	@Override
	public int selectHireNotiCount(String id) {
		return session.selectOne("hireNoti.selectNotiCount",id);
	}

	@Override
	public HireNoti selectOne(int no) {
		return session.selectOne("hireNoti.selectOne",no);
	}

	@Override
	public int insertNoti(HireNoti h) {

		return session.insert("hireNoti.insertNoti",h);
	}
	
	@Override
	public List<HireNoti> selectAll(int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("hireNoti.selectAll", null, row);
	}
	
	@Override
	public List<HireNoti> selectAllAjax(int cPage, int numPerPage, HireNoti h) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("hireNoti.selectAllAjax", h, row);
	}
	
	@Override
	public int selectHireNotiCount() {

		return session.selectOne("hireNoti.selectHireNotiCount");
	}

	@Override
	public int selectHireNotiCountAjax(HireNoti h) {
		return session.selectOne("hireNoti.selectHireNotiCountAjax", h);
	}

	@Override
	public List<HireNoti> selectLatest() {
		return session.selectList("hireNoti.selectAll");
	}

	@Override
	public List<HireNoti> selectAllList(int cPage, int numPerPage, String id) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("hireNoti.selectAllCompanyList", id, row);
	}

	@Override
	public List<HireNoti> selectAllList() {

		return session.selectList("hireNoti.selectAllList");
	}
	
	
	
	
}

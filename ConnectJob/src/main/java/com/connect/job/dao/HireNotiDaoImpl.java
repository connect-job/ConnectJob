package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.HireNoti;

@Repository
public class HireNotiDaoImpl implements HireNotiDao {

	@Autowired
	private SqlSessionTemplate session;

	
	
	@Override
	public HireNoti selectOne(int no) {

		return session.selectOne("HireNoti.selectOne",no);
	}
	
	@Override
	public int insertNoti(HireNoti h) {

		return session.insert("HireNoti.insertNoti",h);
	}
	
	@Override
	public List<HireNoti> selectAll(int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("HireNoti.selectAll", null, row);
	}
	
	@Override
	public List<HireNoti> selectAllAjax(int cPage, int numPerPage, HireNoti h) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("HireNoti.selectAllAjax", h, row);
	}
	
	@Override
	public int selectHireNotiCount() {

		return session.selectOne("HireNoti.selectHireNotiCount");
	}

	@Override
	public int selectHireNotiCountAjax(HireNoti h) {
		return session.selectOne("HireNoti.selectHireNotiCountAjax", h);
	}

	@Override
	public List<HireNoti> selectLatest() {
		return session.selectList("HireNoti.selectAll");
	}

	@Override
	public List<HireNoti> selectAllList() {
		return session.selectList("HireNoti.selectAllList");
	}
	
	
	
	
}

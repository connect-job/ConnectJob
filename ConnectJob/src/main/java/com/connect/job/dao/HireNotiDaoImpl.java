package com.connect.job.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.HireNoti;

@Repository
public class HireNotiDaoImpl implements HireNotiDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertNoti(HireNoti h) {

		return session.insert("HireNoti.insertNoti",h);
	}
	
	
}

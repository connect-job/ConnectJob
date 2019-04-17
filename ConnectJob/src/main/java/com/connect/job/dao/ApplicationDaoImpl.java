package com.connect.job.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Application;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertApplication(Application a) {
		return session.insert("application.insertApplication", a);
	}

	@Override
	public int selectAllCnt(String pId) {
		return session.selectOne("application.selectAllCnt",pId);
	}
	
	
}

package com.connect.job.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.CMember;

@Repository
public class CMemberDaoImpl implements CMemberDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertCMember(CMember m) {
		return session.insert("cmemeber.insertCMember",m);
	}

	@Override
	public CMember selectOne(CMember m) {
		return session.selectOne("cmember.selectOne",m);
	}
	
	

}

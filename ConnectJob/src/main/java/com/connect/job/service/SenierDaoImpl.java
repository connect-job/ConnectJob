package com.connect.job.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Senier;

@Repository
public class SenierDaoImpl implements SenierDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertSenier(Senier s) {

		return session.insert("senier.insertSenier",s);
	}

	@Override
	public List<Senier> senierList() {

		return session.selectList("senier.senierList");
	}
	
	

}

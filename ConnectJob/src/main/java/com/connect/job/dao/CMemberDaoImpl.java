package com.connect.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.CMember;

@Repository
public class CMemberDaoImpl implements CMemberDao {

	@Autowired
	private SqlSessionTemplate session;
	
	
	
	@Override
	public List<CMember> selectList() {
		
		return session.selectList("cmember.selectList");
	}

	@Override
	public int updateMember(CMember m) {

		return session.update("cmember.updateMember",m);
	}

	@Override
	public int deleteMember(CMember m) {
		
		return session.delete("cmember.deleteMember",m);
	}

	@Override
	public int insertCMember(CMember m) {
		return session.insert("cmember.insertCMember",m);
	}

	@Override
	public CMember selectOne(CMember m) {
		return session.selectOne("cmember.selectOne",m);
	}
	
	

}

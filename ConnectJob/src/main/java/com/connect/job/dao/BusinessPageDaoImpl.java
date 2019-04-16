package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Resume;

@Repository
public class BusinessPageDaoImpl implements BusinessPageDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Resume> selectAllResume(int cPage, int numPerPage) {
		RowBounds row = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("Resume.selectAllResume", null, row);
	}

	@Override
	public int selectResumeCount() {
		return session.selectOne("Resume.selectResumeCount");
	}
	


	
}

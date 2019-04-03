package com.connect.job.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	public List<Senier> senierList(int cPage, int numPerPage) {

		return session.selectList("senier.senierList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount() {

		return session.selectOne("senier.selectCount");
	}

	

	@Override
	public List<Senier> senierOneList(int no) {

		return session.selectList("senier.senierOneList",no);
	}
	
	

}

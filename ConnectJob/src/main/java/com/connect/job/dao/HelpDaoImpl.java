package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Inquiry;

@Repository
public class HelpDaoImpl implements HelpDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertInquiry(Inquiry i) {

		return session.insert("help.insertInquiry",i);
	}



	@Override
	public List<Inquiry> inquiryView(int no) {

		return session.selectList("help.inquiryView",no);
	}

	@Override
	public List<Inquiry> inquiryList(int cPage, int numPerPage, String id) {
		return session.selectList("help.inquiryList", id, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount(String id) {
		return session.selectOne("help.selectCount",id);
	}
	
	

}

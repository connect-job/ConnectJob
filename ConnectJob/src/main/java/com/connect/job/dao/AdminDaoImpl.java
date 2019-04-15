package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Inquiry;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Inquiry> helpPageInquiryList(int cPage, int numPerPage, String id) {
		return session.selectList("helpAdmin.helpPageInquiryList",id, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount(String id) {
		return session.selectOne("helpAdmin.selectCount",id);
	}

	@Override
	public Inquiry helpPageInquiryView(int no) {
		return session.selectOne("helpAdmin.helpPageInquiryView",no);
	}

	@Override
	public int helpInquiryUpdate(Inquiry i) {
		return session.update("helpAdmin.helpInquiryUpdate",i);
	}

	
	
}

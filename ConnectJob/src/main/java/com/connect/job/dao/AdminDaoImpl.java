package com.connect.job.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Faq;
import com.connect.job.model.vo.Inquiry;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Inquiry> helpPageInquiryList(int cPage, int numPerPage) {
		return session.selectList("helpAdmin.helpPageInquiryList",null,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCount(/*String id*/) {
		return session.selectOne("helpAdmin.selectCount");
	}

	@Override
	public Inquiry helpPageInquiryView(int no) {
		return session.selectOne("helpAdmin.helpPageInquiryView",no);
	}

	@Override
	public int helpInquiryUpdate(Inquiry i) {
		return session.update("helpAdmin.helpInquiryUpdate",i);
	}

	@Override
	public List<Faq> faq(int cPage, int numPerPage) {

		return session.selectList("helpAdmin.faq",null,new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectFaqCount() {

		return session.selectOne("helpAdmin.selectFaqCount");
	}

	@Override
	public Faq faqView(int no) {

		return session.selectOne("helpAdmin.faqView",no);
	}

	@Override
	public int faqUpdate(Faq f) {

		return session.update("helpAdmin.faqUpdate",f);
	}

	
	
}

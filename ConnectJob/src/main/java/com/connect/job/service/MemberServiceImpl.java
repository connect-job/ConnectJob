package com.connect.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.MemberDao;
import com.connect.job.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(m);
	}

	@Override
	public Member selectOne(Member m) {
		
		return dao.selectOne(m);
	}
	
	
}

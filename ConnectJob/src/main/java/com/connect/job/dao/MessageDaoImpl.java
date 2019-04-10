package com.connect.job.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDaoImpl implements MessageDao {
	
		@Autowired
		private SqlSessionTemplate session;
		
		public int messageCount(String member) {
			return session.selectOne("message.messageCount", member);
		}
	
}

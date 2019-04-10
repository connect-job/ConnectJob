package com.connect.job.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {
	
		@Autowired
		private SqlSessionTemplate session;
		
		@Override
		public Message messageCount(Message m) {
			return session.selectOne("message.messageCount", m);
		}
	
}

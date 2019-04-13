package com.connect.job.dao;

import java.util.List;

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
			System.out.println("sqlsession 값 : " + session);
			return session.selectOne("message.messageCount", m);
		}

		@Override
		public List<Message> selectMessage(String id) {
			return session.selectList("message.selectMessage", id);
		}
		
		
	
}

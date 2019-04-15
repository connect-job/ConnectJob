package com.connect.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Member;
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

		@Override
		public int updateAlarmOn(String id) {
			return session.update("message.updateAlarmOn", id);
		}

		@Override
		public int updateAlarmOff(String id) {
			return session.update("message.updateAlarmOff", id);
		}

		@Override
		public Member selectMemberOne(String id) {
			return session.selectOne("message.selectMemberOne", id);
		}

		@Override
		public int updateMessageRead(Message m) {
			return session.update("message.updateMessageRead", m);
		}

		@Override
		public int alarmDelete(Message m) {
			return session.delete("message.deleteMessage", m);
		}

		@Override
		public int alarmCount(String id) {
			return session.selectOne("message.selectMessageCount", id);
		}
		
		
	
}

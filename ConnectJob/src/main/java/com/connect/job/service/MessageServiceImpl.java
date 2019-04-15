package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.MessageDao;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao dao;
	
	@Override
	public Message messageCount(Message m) {
		return dao.messageCount(m);
	}

	@Override
	public List<Message> selectMessage(String id) {
		return dao.selectMessage(id);	
	}

	@Override
	public int updateAlarmOn(String id) {
		return dao.updateAlarmOn(id);
	}

	@Override
	public int updateAlarmOff(String id) {
		return dao.updateAlarmOff(id);
	}

	@Override
	public Member selectMemberOne(String id) {
		return dao.selectMemberOne(id);
	}

	@Override
	public int updateMessageRead(Message m) {
		return dao.updateMessageRead(m);
	}

	@Override
	public int alarmDelete(Message m) {
		return dao.alarmDelete(m);
	}

	
	
}

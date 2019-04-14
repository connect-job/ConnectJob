package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.MessageDao;
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

	
	
}

package com.connect.job.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.dao.MessageDao;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao dao;
	
	@Override
	public int messageCount(String member) {
		return dao.messageCount(member);
	}

	
}

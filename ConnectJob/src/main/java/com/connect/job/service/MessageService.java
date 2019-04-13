package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Message;

public interface MessageService {

	Message messageCount(Message m);
	List<Message> selectMessage(String id);

}

package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Message;

public interface MessageDao {

	Message messageCount(Message m);
	List<Message> selectMessage(String id);

}

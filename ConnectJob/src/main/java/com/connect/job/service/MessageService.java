package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Message;

public interface MessageService {

	Message messageCount(Message m);
	List<Message> selectMessage(String id);
	int updateAlarmOn(String id);
	int updateAlarmOff(String id);
	Member selectMemberOne(String id);
	int updateMessageRead(Message m);
	int alarmDelete(Message m);
	int selectAlarmCount(String id);

}

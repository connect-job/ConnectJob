package com.connect.job.common.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.connect.job.dao.MessageDaoImpl;
import com.connect.job.model.vo.Message;

// Socket Handler 객체는 두 개의 상속 객체를 가질 수 있다
// 1. TextWebSocketHandler : 문자만 전송할 때 사용 ( 채팅전용, 알람 기타 문자 )
// 2. BinaryWebSocketHandler : 문자, 파일까지 받을 수 있음

public class SocketHandler extends TextWebSocketHandler {
	
	private SqlSessionTemplate sessionTem;
	
	private Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	
	// 접속한 객체들을 관리하기 위해 컬렉션을 이용하는게 좋다 (List, HashMap등)
	private List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	
	public SqlSessionTemplate getSessionTem() {
		return sessionTem;
	}

	public void setSessionTem(SqlSessionTemplate sessionTem) {
		this.sessionTem = sessionTem;
	}


	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.debug("세션아이디 (Session ID) : " + session.getId());
		System.out.println("세션아이디 (Session ID) : " + session.getId());
		list.add(session);
	}
	

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) {
		logger.debug("메시지 (Message) : " + message);
		String member = message.getPayload();     // 가공처리
		logger.debug("들어온 메세지 : " + member);
		
		Message m = new Message();
		m.setmTo(member);
		System.out.println(m);
		
		Message ms = sessionTem.selectOne("message.messageCount",m);
		
		System.out.println("메세지 서비스 주입 : " + ms);
		
			for(WebSocketSession s : list) {
				if(s==session) {
					continue;
				}
				try {
					s.sendMessage(new TextMessage(String.valueOf(ms.getmCount())));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	}

	
	// 소켓을 관리하는 객체를 만들어야함
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.debug("Close : " + session.getId());
		list.remove(session);
	}
	
}

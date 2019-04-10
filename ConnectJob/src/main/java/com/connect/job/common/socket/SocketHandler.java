package com.connect.job.common.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.connect.job.service.MessageService;

// Socket Handler 객체는 두 개의 상속 객체를 가질 수 있다
// 1. TextWebSocketHandler : 문자만 전송할 때 사용 ( 채팅전용, 알람 기타 문자 )
// 2. BinaryWebSocketHandler : 문자, 파일까지 받을 수 있음

public class SocketHandler extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	// 접속한 객체들을 관리하기 위해 컬렉션을 이용하는게 좋다 (List, HashMap등)
	private List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	// private List<Message> mlist = new ArrayList<Message>();
	
	// DB에서 메세지를 가져오기 위해
	@Autowired
	private MessageService service;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.debug("세션아이디 (Session ID) : " + session.getId());
		System.out.println("세션아이디 (Session ID) : " + session.getId());
		list.add(session);
	}
	

	/*@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) {
		logger.debug("메시지 (Message) : " + message);
		String member = message.getPayload();     // 가공처리
		System.out.println("들어온 메세지 : " + member);
		logger.debug(member);
		
		
		 * // 메세지 파싱처리하기 Map<String, String> map = new HashMap(); ObjectMapper mapper =
		 * new ObjectMapper(); try { // 담겨있는 String (Json 형식)으로 넘어온 문자열을 // 해쉬맵에 담아
		 * 변환해주는 것 map = mapper.readValue(msg, HashMap.class); } catch (IOException e) {
		 * e.printStackTrace(); }
		 
		
		
		
		 * System.out.println("메세지 변환 후 사용자 아이디 : " + map.get("nickName"));
		 * logger.debug("메세지 변환 후 내용 : " + map.get("msg"));
		 
		
		// session.sendMessage() : 세션에 메세지를 보내는 메소드
		// 전달된 메소드는 페이지의 onmessage함수를 호출!
		
		//DB에 해당 아이디로온 쪽지 갯수 긁어오잡
		int count = service.messageCount(member);
		logger.debug("쪽지가 몇개나 있니? : " + count + "개");
		
			for(WebSocketSession s : list) {
				if(s==session) {
					continue;
				}
				try {
					s.sendMessage(new TextMessage(String.valueOf(count)));
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}*/

	
	// 소켓을 관리하는 객체를 만들어야함
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.debug("Close : " + session.getId());
		list.remove(session);
	}
	
}

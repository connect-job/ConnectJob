package com.connect.job.common.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.connect.job.model.vo.HireNoti;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Resume;

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
		
		
		// 웹소켓 동작
		// 회원의 알림 설정 여부 확인하기 (ON/OFF)
		Member m = sessionTem.selectOne("message.memberStatus", member);
		
		
		// 알림 설정 ON일때
		if(m.getAlarmStatus().equals("Y")) {
			
			// 1. 작성한 이력서가 있는지 DB조회
			List<Resume> rList = sessionTem.selectList("message.messageResumeCount", member);
			System.out.println("몇개있니?" + rList.size());
			
			// 2. 이력서 직종 담기 -> , 붙여서 -> 또 잘라서 이력서 새로운 이력서 객체에 담아줌
			String hopeJob_temp = "";
			if(!rList.isEmpty()) {
				for(int i=0; i<rList.size(); i++) {
					for(String s : rList.get(i).getHopeJobArea()) {
						hopeJob_temp += s + ",";
					}
				}
			}
			String[] hopeJob = hopeJob_temp.split(",");
		
			Resume r = new Resume();
			r.setHopeJobs(hopeJob);
			
			// 3. DB로 보내 -> 채용공고 직종조회
			if(rList.size()>0) {
				for(WebSocketSession s : list) {
					if(s==session) {
						continue;
					}
					try {
						// 4. 이력서가 있고 -> 희망직종과 일치하는 -> 채용공고 불러오기
						List<HireNoti> list = sessionTem.selectList("message.messageHireNoti", r);
						System.out.println(list.toString());
						System.out.println("리스트 사이즈 : " + list.size());
						session.sendMessage(new TextMessage("회원님의 이력서 " + rList.size() + "건 에 대한<br> 추천 채용공고 " + list.size() + "건 이 매칭되었습니다! <br> <button onclick=\"location.href='/job/alarm/alarm.do?id=" + member+ "\'\">알림센터 바로가기</button>"));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else {
				for(WebSocketSession s : list) {
					if(s==session) {
						continue;
					}
					try {
						session.sendMessage(new TextMessage("작성한 이력서가 없으시네요!<br><button onclick=\"location.href='/job/resume.do'\">지금 이력서 작성하러 가기</button>"));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		// 알림설정 OFF 했을때
		} else {
			
		}

		
	}

	
	// 소켓을 관리하는 객체를 만들어야함
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.debug("Close : " + session.getId());
		list.remove(session);
	}
	
}

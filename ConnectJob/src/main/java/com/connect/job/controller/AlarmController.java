package com.connect.job.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Message;
import com.connect.job.service.MessageService;

@Controller
public class AlarmController {

	@Autowired
	private MessageService service;
	
	// 알림 ON
	@RequestMapping("alarm/alarmOn.do")
	public String alarmOn(Model model, String id, HttpSession session, HttpServletRequest request) {
		int result = service.updateAlarmOn(id);
		
		String msg = "";
		String loc  = "/alarm/alarm.do?id=" + id;
		
		Member m = service.selectMemberOne(id);
		
		if(result>0) {
			msg = "알림 설정이 ON으로 변경되었습니다";
			session.invalidate();
			HttpSession newSession = request.getSession();
			newSession.setAttribute("loginMember", m);
		} else {
			msg = "알림 설정 오류";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	// 알림 OFF
		@RequestMapping("alarm/alarmOff.do")
		public String alarmOff(Model model, String id, HttpSession session, HttpServletRequest request) {
			int result = service.updateAlarmOff(id);
			String msg = "";
			String loc  = "/alarm/alarm.do?id=" + id;
			
			Member m = service.selectMemberOne(id);
			
			if(result>0) {
				msg = "알림 설정이 OFF으로 변경되었습니다";
				session.invalidate();
				HttpSession newSession = request.getSession();
				newSession.setAttribute("loginMember", m);
			} else {
				msg = "알림 설정 오류";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			
			return "common/msg";
		}
	
	@RequestMapping("alarm/alarm.do")
	public String alarm(Model model, String id) {
		List<Message> list = service.selectMessage(id);
		model.addAttribute("list", list);
		return "alarm/alarmList";
	}
	
	// 알림 읽음 처리
	@RequestMapping("alarm/alarmStatus.do")
	public String alarmStatus(Model model, Message m) {
		int result = service.updateMessageRead(m);
		
		List<Message> list = service.selectMessage(m.getmTo());
		model.addAttribute("list", list);
		return "alarm/alarmList";
	}
	
}

package com.connect.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.Message;
import com.connect.job.service.MessageService;

@Controller
public class AlarmController {

	@Autowired
	private MessageService service;
	
	@RequestMapping("alarm/alarm.do")
	public String alarm(Model model, String id) {
		List<Message> list = service.selectMessage(id);
		model.addAttribute("list", list);
		return "alarm/alarmList";
	}
	
}

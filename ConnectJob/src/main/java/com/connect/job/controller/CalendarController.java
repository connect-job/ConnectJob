package com.connect.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.CalendarService;
import com.connect.job.service.HireNotiService;

@Controller
public class CalendarController {
	@Autowired
	private	CalendarService service;
	@Autowired
	private HireNotiService hService;
	
	@RequestMapping("/calendar.do")
	public String connectCalendar() {
		List<HireNoti> list=hService.selectAllList();
		return "calendar/calendar";
	}
}

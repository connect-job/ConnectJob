package com.connect.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.service.CalendarService;

@Controller
public class CalendarController {
	@Autowired
	private	CalendarService service;
	
	@RequestMapping("/calendar.do")
	public String connectCalendar() {
		return "calendar/calendar";
	}
}

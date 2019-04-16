package com.connect.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.CalendarService;

@Controller
public class CalendarController {
	@Autowired
	private	CalendarService service;
	
	@RequestMapping("/calendar.do")
	public String connectCalendar() {
		/*List<HireNoti> list=service.select*/
		return "calendar/calendar";
	}
}

package com.connect.job.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ApplicationController {
	@Autowired
	private ApplicationService service;
	
	@ReqeustMapping("/application/insertapp.do")
	public ModelAndView insertApplication(HttpSession session, int resumeNo) {
		
	}
}

package com.connect.job.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.service.HireNotiService;

@Controller
public class HireNotiController {

	@Autowired
	private HireNotiService service;
	
	private Logger logger=LoggerFactory.getLogger(CMemberController.class);
	
	//헤더 채용공고로 페이지로 이동
	@RequestMapping("/hireNotiAll.do")
	public String hireNotiAll()
	{
		return "hireNoti/hireNoti-List";
	} 
	
}

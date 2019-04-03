package com.connect.job.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.HireNotiService;

@Controller
public class HireNotiController {

	@Autowired
	private HireNotiService service;
	
	private Logger logger=LoggerFactory.getLogger(CMemberController.class);
	
	@RequestMapping("/insertNoti.do")
	public String insertNoti(HireNoti h, Model model)
	{
		int result=service.insertNoti(h);
		
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="채용공고 등록완료";
		}
		else
		{
			msg="채용공고 등록 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "HireNoti/HireNotiAdd";
	}
	
}

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
public class BusinessPageController {
	
	@Autowired
	private HireNotiService service;
	
	private Logger logger=LoggerFactory.getLogger(CMemberController.class);
	
	//기업페이지로 이동
	@RequestMapping("/cmemberBizPage")
	public String BizMain()
	{
		return "businessPage/businessPage-main";
	}
	//채용공고 등록페이지로 이동
	@RequestMapping("/hireNotiAdd.do")
	public String hireNotiAdd()
	{
		return "businessPage/businessPage-hireNotiAdd";
	}
	
	//기업페이지 채용공고 등록
	@RequestMapping("/insertNoti.do")
	public String insertNoti(HireNoti h, Model model)
	{
		logger.info(h+"h1");
		int result=service.insertNoti(h);
		logger.info(h+"h2");
		
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
		
		return "businessPage/businessPage-main";
	}
	
	
	
	

}

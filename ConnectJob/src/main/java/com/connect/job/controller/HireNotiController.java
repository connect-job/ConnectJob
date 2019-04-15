package com.connect.job.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.HireNotiService;

@Controller
public class HireNotiController {

	@Autowired
	private HireNotiService service;
	
	private Logger logger=LoggerFactory.getLogger(CMemberController.class);
	
	//헤더 채용공고로 페이지로 이동
	@RequestMapping("/hireNotiAll.do")
	public String hireNotiList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model)
	{
		int numPerPage = 10;
		List<HireNoti> list = service.selectAll(cPage, numPerPage);
		int total = service.selectHireNotiCount();
		
		model.addAttribute("pageBar", PageBarFactory.getPageBar(total, cPage, numPerPage));
		model.addAttribute("hireNoti",list);
		return "hireNoti/hireNoti-List";
	} 
	
	//채용공고 상세 페이지로 이동
	@RequestMapping("/hireNotiView.do")
	public String hireNotiView(int no, Model model)
	{
		HireNoti hn = service.selectOne(no);
		
		model.addAttribute("list",hn);
		return "hireNoti/hireNoti-selectOne";
	}
	
		
}

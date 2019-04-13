package com.connect.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.Inquiry;
import com.connect.job.service.HelpService;

@Controller
public class HelpController {
	
	
	@Autowired
	private HelpService service;
	
	@RequestMapping("/help/inquiry.do")
	public String inquiry(Model model)
	{
		
		
		return "help/inquiry";//1:1문의첫화면
	}
	
	@RequestMapping("/help/myInquiry.do")//페이징처리필요
	public ModelAndView inquiryList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, String id)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		List<Inquiry>list=service.inquiryList(cPage, numPerPage, id);
		int total=service.selectCount(id);
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total, cPage, numPerPage)); 
		mv.setViewName("help/myInquiry");//문의리스트 시작페이지
		return mv;

	}
	
	@RequestMapping("/help/inquiryWriteEnd.do")
	public String inquiryWriteEnd(Inquiry i, Model model)
	{
		int result=service.insertInquiry(i);
		
		String msg="";
		String loc="/help/myInquiry.do?id="+i.getiWriter(); //문의리스트시작페이지
		
		
		
		
		if(result>0 )
		{
			msg="문의등록완료";
			
		}
		else//로그인 안되면 실패
		{
			msg="문의등록실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
		
		
		
	}
	
	@RequestMapping("/help/myInquiryView.do")
	public String inquiryView(Model model, int no, HttpSession session)
	{
		List<Inquiry> list=service.inquiryView(no);
		model.addAttribute("list",list);
		
		
		return "help/myInquiryView";//나의문의내역상세
	}
	
	@RequestMapping("/help/fag.do")
	public String fag()
	{
		return "help/fag";
	}
	
}

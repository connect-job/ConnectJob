package com.connect.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.Inquiry;
import com.connect.job.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	

	@RequestMapping("/admin/inquiry/inquiry.do")
	public ModelAndView helpPageInquiry(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, String id) {
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		List<Inquiry>list=service.helpPageInquiryList(cPage, numPerPage, id);
		int total=service.selectCount(id);
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total, cPage, numPerPage)); 
		mv.setViewName("admin/inquiry/inquiry"); //문의리스트 시작페이지
		return mv;
	}
	
	@RequestMapping("/admin/inquiry/InquiryView.do")
	public String helpPageInquiryView(Model model, int no)
	{
		Inquiry inq = service.helpPageInquiryView(no);
		model.addAttribute("inq",inq);
		return "admin/inquiry/inquiryView";
	}
	
	@RequestMapping("/admin/inquiry/InquiryUpdate.do")
	public String helpInquiryUpdate(Model model, Inquiry i) 
	{
		int result=service.helpInquiryUpdate(i);
		
		String msg="";
		String loc="/admin/inquiry/inquiry.do?id="+i.getiWriter(); //문의리스트시작페이지
		
		if(result>0 ) {
			msg="답변등록완료";
		} else {
			msg="답변등록실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
		
		//return "helpPage/helpPage-inquiry";
	}
	
	
	
}

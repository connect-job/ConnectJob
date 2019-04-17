package com.connect.job.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.Application;
import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.Member;
import com.connect.job.service.ApplicationService;
import com.connect.job.service.CMemberService;
import com.connect.job.service.CompanyService;

@Controller
public class ApplicationController {
	@Autowired
	private ApplicationService service;
	@Autowired
	private CMemberService cmService;
	@Autowired
	private CompanyService cService;
	
	@RequestMapping("/application/insertApplication.do")
	public ModelAndView insertApplication(HttpSession session, Application a) {
		ModelAndView mv=new ModelAndView();
		Member m=(Member)session.getAttribute("loginMember");
		a.setpId(m.getP_id());
		CMember cm=new CMember();
		cm.setcMemberId(a.getcMemberId());
		CMember cmResult=cmService.selectOne(cm);
		a.setCompanyNo(Integer.parseInt(cmResult.getcId()));
		Company c=cService.selectOne(Integer.parseInt(cmResult.getcId()));
		a.setCompanyName(c.getCompanyName());
		
		System.out.println(a);
		int result=service.insertApplication(a);

		if(result>0) {
			mv.addObject("msg","지원이 완료되었습니다.");
		}else {
			mv.addObject("msg", "지원하는 도중 오류가 발생하였습니다.");
		}
		mv.addObject("loc", "/hireNotiView.do?no="+a.getHnSeq());
		mv.setViewName("common/msg");
		return mv;
	}
}

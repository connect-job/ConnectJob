package com.connect.job.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.HireEvent;
import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.CMemberService;
import com.connect.job.service.CompanyService;
import com.connect.job.service.HireEventService;
import com.connect.job.service.HireNotiService;

@Controller
public class HireEventController {
	@Autowired
	private	HireEventService service;
	@Autowired
	private HireNotiService hService;
	@Autowired
	private CMemberService cmService;
	@Autowired
	private CompanyService cService;
	
	
	@RequestMapping("/calendar.do")
	public ModelAndView connectCalendar() throws ParseException {
		ModelAndView mv=new ModelAndView();
		List<HireNoti> list=hService.selectAllList();
		List<HireEvent> eList=new ArrayList<HireEvent>();
		for(HireNoti h:list) {
			System.out.println(h);
			HireEvent e=new HireEvent();
			CMember cm=new CMember();
			cm.setcMemberId(h.getcMemberId());
			CMember rcm=cmService.selectOne(cm); //cMember에서 cMemberId가져옴
			Company cp=cService.selectOne(Integer.parseInt(rcm.getcId()));
			e.setcMemberId(h.getcMemberId());
			e.setCompanyName(cp.getCompanyName());
			e.setEventDate(h.getStartDate());
			e.setSeFlag("시작");
			e.setHnSeq(h.getHnSeq());
			
			HireEvent e2=new HireEvent();
			e2.setcMemberId(h.getcMemberId());
			e2.setEventDate(h.getEndDate());
			e2.setSeFlag("마감");
			e2.setHnSeq(h.getHnSeq());
			e2.setCompanyName(cp.getCompanyName());
			eList.add(e);
			eList.add(e2);
		}
		
		mv.addObject("eventList",eList);
		mv.setViewName("calendar/calendar");
		return mv;
	}
}

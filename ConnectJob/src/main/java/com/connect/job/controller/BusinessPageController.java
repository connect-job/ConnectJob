package com.connect.job.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.HireNoti;
import com.connect.job.model.vo.Resume;
import com.connect.job.service.BusinessPageService;
import com.connect.job.service.HireNotiService;


@Controller
public class BusinessPageController {
	
	@Autowired
	private HireNotiService service;
	
	@Autowired
	private BusinessPageService bService;
	
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
	
	//전체 이력서 페이지로 이동
	@RequestMapping("/AllResume.do")
	public String AllResume(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model)
	{
		int numPerPage = 10;
		List<Resume> list = bService.selectAllResume(cPage, numPerPage);
		int total = bService.selectResumeCount();
		
		model.addAttribute("pageBar", PageBarFactory.getPageBar(total, cPage, numPerPage));
		model.addAttribute("resume",list);
		return "businessPage/businessPage-resumeAllList";
	} 
	
	
	//자사지원 이력서 페이지로 이동
	@RequestMapping("/comResume.do")
	public String comResume()
	{
		return "businessPage/businessPage-resumeComList";
	}
	
	//공개이력서 페이지로 이동
	@RequestMapping("/openResume.do")
	public String openResume()
	{
		return "businessPage/businessPage-resumeOpenList";
	}
	
	//매칭페이지로 이동
	@RequestMapping("/matchResume.do")
	public String matchResume()
	{
		return "businessPage/businessPage-resumeMatchList";
	}
	
	//기업정보수정페이지로 이동
	@RequestMapping("/updateI.do")
	public String updateInfo()
	{
		return "businessPage/businessPage-comIUpdate";
	}
	
	//담당자 정보 수정페이지로 이동
	@RequestMapping("/updateM.do")
	public String updateManager()
	{
		return "businessPage/businessPage-comMUpdate";
	}
	
	//리뷰 페이지로 이동
	@RequestMapping("/review.do")
	public String review()
	{
		return "businessPage/businessPage-review";
	}
	
	
	
	

}

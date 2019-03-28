package com.connect.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SenierController {

	@Autowired
	//private SenierService service;
	
	@RequestMapping("/senierWrite.do")
	public String write()
	{
		return "senier/senierWrite";//선배에게 질문하기
	}
	
	
	@RequestMapping("/senierAnswer.do")
	public String answer()
	{
		return "senier/senierAnswer";//후배에게 답변하기
	}
	
	@RequestMapping("/senierConversation.do")
	public String senierList()
	{
		return "senier/senierList";//동문Q&A리스트 시작페이지
	}
	
	
}

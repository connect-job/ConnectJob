package com.connect.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.Senier;


@Controller
public class SenierController {

	@Autowired
	//private SenierService service;
	
	@RequestMapping("/senierWrite.do")
	public String write()
	{
		return "senier/senierWrite";//선배에게 질문하기
	}
	
	@RequestMapping("/senierWriteEnd.do")
	public String writeEnd(Senier s, Model model)
	{
		
		
		
		return "senier/senierList"; //리스트시작페이지
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

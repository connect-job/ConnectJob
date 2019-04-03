package com.connect.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.Scomment;
import com.connect.job.model.vo.Senier;
import com.connect.job.service.SenierService;
import com.connect.job.common.PageBarFactory;


@Controller
public class SenierController {

	@Autowired
	private SenierService service;
	
	@RequestMapping("/senierWrite.do")
	public String write()
	{
		return "senier/senierWrite";//선배에게 질문하기
	}
	
	@RequestMapping("/senierWriteEnd.do")
	public String writeEnd(Senier s, Model model)
	{
		
		int result=service.insertSenier(s);
		
		String msg="";
		String loc="/senierConversation.do"; //리스트시작페이지
		if(result>0)
		{
			msg="질문등록완료";
			
		}
		else
		{
			msg="질문등록실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
		/*return "senier/senierList"; //리스트시작페이지*/
		
	}
	
	@RequestMapping("/senierAnswer.do")
	public String answer(Model model, int no)
	{
		
		List<Senier> list=service.senierOneList(no);
		model.addAttribute("list",list);
		return "senier/senierAnswer";//후배에게 답변하기
	}
	
	@RequestMapping("/senierConversation.do")
	public ModelAndView senierList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		List<Senier> list=service.senierList(cPage,numPerPage);
		int total=service.selectCount();
		
		System.out.println(list);
		System.out.println(total);
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total, cPage, numPerPage)); /*"senier/senierList"*/
		mv.setViewName("senier/senierList");//동문Q&A리스트 시작페이지
		return mv;

		
	}
	
	
	@RequestMapping("/senier/comWrite.do") //댓글등록
	@ResponseBody
	public String comWrite(@RequestParam(defaultValue="1")int cNo, String cContent,String cWriter, Model model) /*Scomment sco*/
	{
		Scomment sco=new Scomment();
		sco.setsNo(cNo);
		sco.setcContent(cContent);
		sco.setcWriter(cWriter);
		
		int result=service.insertComWrite(sco);
		
		System.out.println(result);
		
		
		
		return "redirect:/senier/comList.do";
	}
	
	@RequestMapping("/senier/comList.do") //댓글등록 조회
	@ResponseBody
	public List<Scomment> comList(@RequestParam(defaultValue="1")int cNo, Model model) 
	{
		Scomment sco=new Scomment();
		sco.setsNo(cNo);
		
		List<Scomment> list=service.comList(sco);
		System.out.println(list);

		return list;
	}
	
	
}

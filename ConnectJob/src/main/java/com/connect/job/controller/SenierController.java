package com.connect.job.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.connect.job.common.AjaxPageBarFactory;
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
		
	
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total, cPage, numPerPage)); /*"senier/senierList"*/
		mv.setViewName("senier/senierList");//동문Q&A리스트 시작페이지
		return mv;

		
	}
	
	
	@RequestMapping(value="/senier/comWrite.do")//댓글등록
	@ResponseBody
	public String comWrite(@RequestParam(defaultValue="1")int cNo, String cContent,String cWriter, Model model) throws UnsupportedEncodingException /*Scomment sco*/
	{
		Scomment sco=new Scomment();
		sco.setsNo(cNo);
		sco.setcContent(cContent);
		sco.setcWriter(cWriter);
		
		int count = service.insertComWrite(sco);
		String result_temp = "";
		
		if(count>0) {
			result_temp = "댓글이 등록되었습니다";
		} else {
			result_temp = "댓글 등록 실패";
		}
		
		String result = URLEncoder.encode(result_temp, "UTF-8");
		return result;
	}
	
	@RequestMapping("/senier/comList.do") //댓글등록 조회
	@ResponseBody
	public List<Scomment> comList(@RequestParam(defaultValue="1")int cNo, Model model) 
	{
		Scomment sco=new Scomment();
		sco.setsNo(cNo);
		
		List<Scomment> list=service.comList(sco);
		

		return list;
	}
	
	@RequestMapping(value="/senier/comAjaxList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String comAjaxList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, Model model, HttpSession session) {
		
		int numPerPage=10;
		
		
		String html = "";
		List<Scomment> list = service.selectAll(cPage,numPerPage);
		int total=service.selectcomCount();

	
		
		String pageBar=AjaxPageBarFactory.getPageBar(total, cPage, numPerPage);
		

		
		
		html += "<div class=\"comment-item\">";
			for(int i=0; i<list.size();i++) {
				html += "<div class=\"writer\">";
				html += list.get(i).getcName();
				html += "</div>";
				
				html += "<div class=\"content\">";
				html += list.get(i).getcContent();
				html += "</div>";
				
				html += "<div class=\"date\">";
				html += list.get(i).getcRegdate();
				html += "</div>";
			}
			html += "<div id=\"pageBar\">";
			html += pageBar;
			html += "</div>";
			html += "</div>";

		return html;
	}
	
	
	/*// 댓글 좋아요
		@RequestMapping("senier/senierLike.do")
		@ResponseBody
		public String SenierLike(String member, int reviewNo, int companyNo) throws UnsupportedEncodingException {
			
			ScommentLike like = new ScommentLike();
			like.setLikeMember(member);
			like.setLikeReview(reviewNo);
			like.setLikeCompany(companyNo);
			
			String message = "";
			
			int result = service.scommentLike(like);
			
			if(result>0) {
				message = "좋아요";
			} else {
				message = "좋아요 취소";
			}
			
			String msg = URLEncoder.encode(message, "UTF-8");
			return msg;
		}*/
	
}

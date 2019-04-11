package com.connect.job.controller;

import java.io.UnsupportedEncodingException;
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
		
		Senier  s =service.senierOneList(no);
		model.addAttribute("s",s);
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
	public String comWrite(Scomment s, Model model) throws UnsupportedEncodingException /*Scomment sco*/
	{
		int count = service.insertComWrite(s);
		
		String msg = "";
		String loc = "/senierAnswer.do?no=" + s.getsNo();
		
		if(count>0) {
			msg = "댓글이 등록되었습니다";
		} else {
			msg = "댓글 등록 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
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
	public String comAjaxList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, int no, Model model, HttpSession session) {
		
		int numPerPage=10;
		
		
		String html = "";
		List<Scomment> list = service.selectAll(cPage,numPerPage, no);
		int total=service.selectcomCount(no);

		String pageBar=AjaxPageBarFactory.getPageBar(total, cPage, numPerPage);
		
		html += "<div class=\"comment-item\">";
			for(int i=0; i<list.size();i++) {
				html += "<div class=\"writer\">";
				html += list.get(i).getcName();
				html += "</div>";
				
				html += "<div class=\"content\">";
				html += "<input type=\"hidden\" id=\"cNo\" value=\"" + list.get(i).getcNo() + "\"/>";
				html += "<div class=\"content-container\">";
				html += list.get(i).getcContent();
				html += "</div>";
				html += "<button class='updateBtn'>수정</button>";
				html += "<button class='deleteBtn'>삭제</button>";
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
	
	@RequestMapping("/senierUpdate.do")
	public String update(Model model, int no)
	{
		Senier  s =service.senierOneList(no);
		model.addAttribute("s",s);
		return "senier/senierUpdate";//선배에게 질문하기
	}
	
	@RequestMapping("/senierUpdateEnd.do")
	public String updateEnd(Senier s, Model model)
	{
		
		int result=service.updateSenier(s);
		
		String msg="";
		String loc="/senierConversation.do"; //리스트시작페이지
		if(result>0)
		{
			msg="질문수정완료";
			
		}
		else
		{
			msg="질문수정실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	
		
	}
	
	@RequestMapping("/senierDelete.do")
	public String Delete(Senier s, Model model)
	{
		
		int result=service.deleteSenier(s);
		
		String msg="";
		String loc="/senierConversation.do"; //리스트시작페이지
		if(result>0)
		{
			msg="질문삭제완료";
			
		}
		else
		{
			msg="질문삭제실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	
		
	}
	
	@RequestMapping("sCommentUpdate.do")//댓글수정
	public String commentUpdate(Scomment sc, Model model) {
		
		int result=service.commentUpdate(sc);
		
		
		String msg="";
		String loc = "/senierAnswer.do?no=" + sc.getsNo();
		
		if(result>0)
		{
			msg="수정이 완료 되었습니다";
			
		}
		else
		{
			msg="수정 실패 하였습니다";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	@RequestMapping("sCommentDelete.do")//댓글삭제
	public String commentDelete(Scomment sc, Model model) {
		
		int result=service.commentDelete(sc);
		
		
		String msg="";
		String loc = "/senierAnswer.do?no=" + sc.getsNo();
		
		if(result>0)
		{
			msg="삭제가 완료 되었습니다";
			
		}
		else
		{
			msg="삭제 실패 하였습니다";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
}

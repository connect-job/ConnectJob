package com.connect.job.controller;

import java.net.ResponseCache;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.Notice;
import com.connect.job.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	//공지사항 페이지 이동
	@RequestMapping("/notice.do")
	public ModelAndView selectNoticeList(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage) {
		
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		List<Notice> list=service.selectList(cPage,numPerPage);
		int total=service.selectCount();
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total,cPage,numPerPage));
		
		mv.setViewName("/notice/notice");
		
		return mv;
	}
	
	//검색
	@RequestMapping("/notice/noticeSearch")
	public ModelAndView noticeFind(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage, String searchType, String searchKey) {
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=10;
		
		List<Notice> list=service.selectList(cPage,numPerPage, searchType, searchKey);
		int total=service.selectCount(searchType, searchKey);
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("searchType", searchType);
		mv.addObject("searchKey", searchKey);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total,cPage,numPerPage));
		
		mv.setViewName("/notice/notice");
		
		return mv;
	}
	
	//공지사항 글쓰기 페이지 이동
	@RequestMapping("/notice/noticeForm")
	public String noticeForm() {
		
		return "notice/noticeForm";
	}
	
	//공지사항 글쓰기
	@RequestMapping("/notice/insertNotice")
	public String insertNotice(Notice n, Model model) {
		
		int result=service.insertNotice(n);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="공지사항 등록 성공";
			loc="/notice/noticeView?notice_no="+result;
		}else {
			msg="등록 실패";
			loc="/";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		System.out.println(result);
		return "common/msg";
	}
	
	//공지사항 view 이동
	@RequestMapping("/notice/noticeView")
	public String noticeView(int notice_no, Model model, HttpServletRequest request, HttpServletResponse response) {	
		
		Cookie cookie[]=request.getCookies();
		String boardCookie="";
		boolean hasRead=false;
		
		if(cookie!=null) {
			output :
			for(Cookie c : cookie) {
				String name=c.getName();
				String value=c.getValue();
				
				if("boardCookie".equals(name)) {
					boardCookie=value;
					if(value.contains("|" + notice_no + "|")) {
						hasRead=true;
						break output;
					}
				}
			}
		}
		
		if(!hasRead) {
			Cookie c=new Cookie("boardCookie", boardCookie+"|"+notice_no+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		
		Notice result=service.selectOne(notice_no, hasRead);
		model.addAttribute("notice", result);
		
		return "notice/noticeView";
	}
	
	//공지사항 삭제
	@RequestMapping("/notice/deleteNotice")
	public String deleteNotice(int notice_no, Model model) {
		int result=service.deleteNotice(notice_no);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="공지사항 삭제 성공";
		}else {
			msg="공지사항 삭제 실패";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	//공지사항 수정 이동
	@RequestMapping("/notice/updateForm")
	public String updateForm(int notice_no, Model model) {
		Notice result=service.selectOne(notice_no);
		
		model.addAttribute("notice", result);
		return "notice/noticeUpdate";
	}
	
	//수정
	@RequestMapping("/notice/updateNotice")
	public String updateNotice(Notice n, Model model) {
		int result=service.updateNotice(n);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="수정 성공";
			loc="/notice/noticeView?notice_no="+n.getNotice_no();
			
		}else {
			msg="수정 실패";
			loc="/";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	
	
}

package com.connect.job.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.Notice;
import com.connect.job.service.NoticeService;

@Controller
public class NoticeController {
	
	private Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService service;
	
	// 메인페이지 상단 공지사항
	@RequestMapping("/notice/latestNoticeOne.do")
	@ResponseBody
	public String latestNoticeOne(HttpServletRequest request) throws UnsupportedEncodingException {
		String html = "";
			
		List<Notice> list = service.latestNotice();

		if(list.size()>1) {
			for(int i=0; i<1; i++) {
				html += "<a class=\"wow fadeInUp\"  data-wow-delay=\"0.1s\" href=\"" + request.getContextPath() + "/notice/noticeView?notice_no=" + list.get(i).getNotice_no() + "'\">" + list.get(i).getNotice_date() + "　" +  list.get(i).getTitle() + "</a>";
			}
		}
			
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 메인페이지 최근 공지사항
	@RequestMapping("/notice/latestNotice.do")
	@ResponseBody
	public String latestNotice(HttpServletRequest request) throws UnsupportedEncodingException {
		String html = "";
		
		List<Notice> list = service.latestNotice();
		
		html += "<ul>";
		if(list.size()>5) {
			for(int i=0; i<5; i++) {
				html += "<li class=\"wow fadeInUp\"  data-wow-delay=\"0.1s\" onclick=\"location.href='" + request.getContextPath() + "/notice/noticeView?notice_no=" + list.get(i).getNotice_no() + "'\">·　" + list.get(i).getNotice_date() + "　" +  list.get(i).getTitle() + "</li>";
			}
		} else {
			html += "<li>등록된 리뷰가 없습니다</li>";
		}
		html += "</ul>";
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	//공지사항 페이지 이동
	@RequestMapping("/notice.do")
	public ModelAndView selectNoticeList(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage) {
		
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		List<Notice> topList = service.selectTopList();
		List<Notice> list=service.selectList(cPage,numPerPage);
		int total=service.selectCount();
	
		mv.addObject("topList", topList);
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
		
		Map<String, String> map=new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);	
		
		
		List<Notice> searchList=service.searchList(cPage,numPerPage, map);
		int total=service.searchCount(map);
		
		System.out.println("검색 리스트: " + searchList);
		System.out.println("map: " + map);
		
		mv.addObject("list",searchList);
		mv.addObject("total",total);
		mv.addObject("map", map);
		
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
			loc="/notice.do";
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

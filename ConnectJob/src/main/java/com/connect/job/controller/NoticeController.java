package com.connect.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.Notice;
import com.connect.job.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	//공지사항 페이지 이동
	@RequestMapping("/notice.do")
	public String selectNoticeList(Model model) {
		
		List<Notice> list=service.selectList();
		model.addAttribute("list", list);
		System.out.println(list);
		
		return "notice/notice";
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
	public String noticeView(int notice_no, Model model) {
		
		Notice result=service.selectOne(notice_no);
		
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

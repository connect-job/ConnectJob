package com.connect.job.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.Faq;
import com.connect.job.model.vo.Inquiry;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Notice;
import com.connect.job.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	

	@RequestMapping("/admin/inquiry/inquiry.do")
	public ModelAndView helpPageInquiry(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		List<Inquiry>list=service.helpPageInquiryList(cPage, numPerPage);
		int total=service.selectCount();
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total, cPage, numPerPage)); 
		mv.setViewName("admin/inquiry/inquiry"); 
		return mv;
	}
	
	@RequestMapping("/admin/inquiry/InquiryView.do")
	public String helpPageInquiryView(Model model, int no)
	{
		Inquiry inq = service.helpPageInquiryView(no);
		model.addAttribute("inq",inq);
		return "admin/inquiry/inquiryView";
	}
	
	@RequestMapping("/admin/inquiry/InquiryUpdate.do")
	public String helpInquiryUpdate(Model model, Inquiry i) 
	{
		int result=service.helpInquiryUpdate(i);
		
		String msg="";
		String loc="/admin/inquiry/inquiry.do?id="+i.getiWriter(); 
		
		if(result>0 ) {
			msg="답변등록완료";
		} else {
			msg="답변등록실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	
	}
	
	@RequestMapping("/admin/faq/faq.do")
	public ModelAndView faq(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		List<Faq>list=service.faq(cPage, numPerPage);
		int total=service.selectFaqCount();
		System.out.println(list);
		
		mv.addObject("list",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total, cPage, numPerPage)); 
		mv.setViewName("admin/faq/faq"); 
		return mv;
		
	}
	
	@RequestMapping("/admin/faq/faqView.do")
	public String faqView(Model model, int no)
	{
		Faq faq = service.faqView(no);
		model.addAttribute("faq",faq);
		return "admin/faq/faqView";
	}
	
	@RequestMapping("/admin/faq/FaqUpdate.do")
	public String faqUpdate(Model model, Faq f)
	{
		int result=service.faqUpdate(f);
		
		String msg="";
		String loc="/admin/faq/faq.do"; 
		
		if(result>0 ) {
			msg="질문수정완료";
		} else {
			msg="질문수정실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	
	//회원관리	
	@RequestMapping("/admin/member/memberList")
	public ModelAndView memberList(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage) {
		
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		
		int total=service.memberCount();
		List<Member> list=service.memberList(cPage, numPerPage);
		
		String pageBar=PageBarFactory.getPageBar(total, cPage, numPerPage);
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.setViewName("/admin/member/memberList");
		
		return mv;
	}
	
	@RequestMapping("/admin/member/searchMember")
	public ModelAndView searchMember(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage, String searchType, String searchKey) {
		
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		
		Map<String, String> map=new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchType", searchType);
		
		int total=service.searchMemberCount(map);
		List<Member> searchList=service.searchMemberList(cPage, numPerPage, map);
		
		String pageBar=PageBarFactory.getPageBar(total, cPage, numPerPage);
		
		mv.addObject("list", searchList);
		mv.addObject("map", map);
		mv.setViewName("/admin/inquiry/memberList");
		
		return mv;
	}
	
	@RequestMapping("/admin/deleteMember")
	public String deleteMember(String p_id, Model model) {
		
		int result=service.deleteMember(p_id);
		String msg="";
		String loc="/admin/member/memberList";
		
		if(result>0) {msg="삭제 완료";}
		else {msg="삭제 실패";}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	//공지사항 관리
	@RequestMapping("/admin/notice")
	public ModelAndView noticeList(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage, Model model) {
		
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		
		List<Notice> list=service.noticeList(cPage,numPerPage);
		int total=service.noticeCount();
	
		mv.addObject("noticeList",list);
		mv.addObject("total",total);
		mv.addObject("pageBar",PageBarFactory.getPageBar(total,cPage,numPerPage));		
		
		mv.setViewName("/admin/notice/adNotice");
		
		return mv;
	}
	
	@RequestMapping("/admin/noticeSearch")
	public ModelAndView noticeFind(@RequestParam(value="cPage",required=false, defaultValue="1")int cPage, String searchType, String searchKey) {
		ModelAndView mv=new ModelAndView();
		
		int numPerPage=10;
		
		Map<String, String> map=new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);	
		
		
		List<Notice> searchList=service.searchNoticeList(cPage,numPerPage, map);
		int total=service.searchNoticeCount(map);
		
		System.out.println("검색 리스트: " + searchList);
		System.out.println("map: " + map);
		
		mv.addObject("noticeList",searchList);
		mv.addObject("total",total);
		mv.addObject("map", map);
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(total,cPage,numPerPage));
		
		mv.setViewName("/admin/notice/adNotice");
		
		return mv;
	}
	
	//공지사항 삭제
	@RequestMapping("/admin/deleteNotice")
	public String deleteNotice(int notice_no, Model model) {
		int result=service.deleteNotice(notice_no);
			
		String msg="";
		String loc="/";
		if(result>0) {msg="공지사항 삭제 성공";}
		else {msg="공지사항 삭제 실패";}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
			
		return "common/msg";
	}
	
	//공지사항 수정 이동
	@RequestMapping("/admin/updateForm")
	public String updateForm(int notice_no, Model model) {
		Notice result=service.selectNoticeOne(notice_no);
			
		model.addAttribute("notice", result);
		return "admin/notice/noticeUpdate";
	}
		
	//수정
	@RequestMapping("/admin/updateNotice")
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

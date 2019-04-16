package com.connect.job.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.HireNotiService;

@Controller
public class HireNotiController {

	@Autowired
	private HireNotiService service;
	
	private Logger logger=LoggerFactory.getLogger(CMemberController.class);
	
	// 메인페이지 -> 최신 채용공고
	@RequestMapping("/hireLatest.do")
	@ResponseBody
	public String hireLatest(HttpServletRequest request) throws UnsupportedEncodingException {
		String html = "";
		
		List<HireNoti> list = service.selectLatest();
		
		for(int i=0; i<5; i++) {
			html += "<div class=\"hire-item\" onclick=\"location.href=\'" + request.getContextPath() + "/hireNotiView.do?no=" + list.get(i).getHnSeq() + "\'\">";
			html += "<div class=\"item-title\">";
			if(list.get(i).getHnTitle().length()>12) {
				html += list.get(i).getHnTitle().substring(0, 12) + "...</div>";
			} else {
				html += list.get(i).getHnTitle() + "</div>";
			}
			html += "<div class=\"item-sub-title\">" + list.get(i).getcName() + "</div>";
			html += "<div class=\"item\">모집부분 : " + list.get(i).getHnCareer() + "</div>"; 
			html += "<div class=\"item\">경력 : " + list.get(i).getHnForm() + "</div>"; 
			html += "<div class=\"item\">경력 : " + list.get(i).getHnCareer() + "</div>"; 
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy년 MM월 dd일");
			String regDate = sdf.format(list.get(i).getAddDate());
			
			html +="<div class=\"item\">등록일 : " + regDate + "</div>";
			html += "<div class=\"item-btn\"><button>지원하기</button></div>";
			html += "</div>";
		}
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	
	//헤더 채용공고로 페이지로 이동
	@RequestMapping("/hireNotiAll.do")
	public String hireNotiList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model)
	{
		int numPerPage = 10;
		List<HireNoti> list = service.selectAll(cPage, numPerPage);
		int total = service.selectHireNotiCount();
		
		model.addAttribute("pageBar", PageBarFactory.getPageBar(total, cPage, numPerPage));
		model.addAttribute("hireNoti",list);
		return "hireNoti/hireNoti-List";
	} 
	
	//헤더 채용공고로 페이지로 이동 (Ajax 용)
		@RequestMapping("/hireNotiAllAjax.do")
		@ResponseBody
		public String hireNotiListAjax(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model, String category) throws UnsupportedEncodingException
		{	
			String html = "";
			HireNoti h = new HireNoti();
			h.setCategory(category.split(","));
			
			int numPerPage = 10;
			List<HireNoti> list = service.selectAllAjax(cPage, numPerPage, h);
			int total = service.selectHireNotiCountAjax(h);
			
			if(!list.isEmpty()) {
			for(int i=0; i<list.size(); i++) {
				html += "<div class=\"hire-item\">";
				html += "<div class=\"cname\">" + list.get(i).getcName() + "</div>";
				html += "<div class=\"subject\">";
				html += "<div class=\"h-title\">" + list.get(i).getHnTitle() + "</div>";
				html += "<div class=\"h-subtitle\">모집부문 : ";
				for(String sort : list.get(i).getHnSort()) {
					html += sort + "　";
				}
				html += " </div>";
				html += "</div>";
				html += "<div class=\"career\">";
				html += "<div class=\"c-career\">" + list.get(i).getHnCareer() + "</div>";
				html += "<div class=\"c-finaledu\">";
				for(String edu : list.get(i).getHnFinalEdu()) {
					html += edu + "　";
				}
				html += "</div>";
				html += "</div>";
				html += "<div class=\"form\">";
				html += "<div class=\"f-form\">" + list.get(i).getHnForm() + "</div>";
				html += "<div class=\"f-location\">" + list.get(i).getHnWorkPlace() + "</div>";
				html += "</div>";
				html += "<div class=\"date\">";
				html += "<div class=\"d-submit\"><button class=\"submit\">즉시지원</button></div>";
				html += "<div class=\"d-date\">";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
				String regDate = sdf.format(list.get(i).getAddDate());
				
				html += regDate;
				
				html += "</div>";
				html += "</div>";
				html += "<div class=\"option\">";
				html += "<button>스크랩</button>";
				html += "</div>";
				html += "</div>";
			}
			} else {
				html += "검색 결과가 존재하지 않습니다";
			}
			String result = URLEncoder.encode(html, "UTF-8");
			return result;
		} 
	
	//채용공고 제목 누르고 상세 페이지로 이동
	@RequestMapping("/hireNotiView.do")
	public String hireNotiView(int no, Model model)
	{
		HireNoti hn=service.selectOne(no);
		model.addAttribute("hireNoti",hn);
		return "hireNoti/hireNoti-selectOne";
	}
	
		
}

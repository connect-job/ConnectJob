package com.connect.job.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.CMemberService;

@Controller
public class CMemberController {

	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private CMemberService service;
	
	/*@RequestMapping("/CMemberEnroll.do")
	public String CMemberEnroll() {
		
		return "CMember/CMemberEnroll";
	}
	
	@RequestMapping("/CMemberEnrollEnd.do")
	public String insertCMember(CMember m, Model model) {
		
		String pw=m.getCMemberPw();
		logger.debug(pw);
		String enPw=encoder.encode(pw);
		logger.debug(enPw);
		m.setCMemberPw(enPw);
		
		int result=service.insertMember(m);
		
		return "member/loginMember";
	}*/
	
	//기업회원로그인
	@RequestMapping("/cMemberLogin.do")
	public String CMemberlogin() {
		
		return "redirect:/";
	}
	
	@RequestMapping("/cMemberLogin")
	public String selectOne(CMember m, HttpSession session, Model model) {
		CMember result = service.selectOne(m);		
		
		String msg="";
		String loc = "/";
		
		if(result!=null) {
			if(encoder.matches(m.getCMemberPw(), result.getCMemberPw())) {
				msg = "로그인 성공!";
				 session.setAttribute("loginMember", result); 
				 logger.debug("클라이언트에게 넘어온 값" + result);
			} else {
				msg = "비밀번호가 일치하지 않습니다!";
			}
		} else {
			msg = "존재하지 않는 아이디 입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	/*@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/member/findMember")
	public String findMember() {
		
		return "member/findMember";
	}*/
}


package com.connect.job.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.Member;
import com.connect.job.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	
	@RequestMapping("/member/memberEnrollPage.do")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String insertMember(Member m, Model model) {
		
		String pw=m.getPassword();
		logger.debug(pw);
		String enPw=encoder.encode(pw);
		logger.debug(enPw);
		m.setPassword(enPw);
		
		int result=service.insertMember(m);
		
		return "member/loginMember";
	}
	
	@RequestMapping("/member/login.do")
	public String login() {
		return "member/loginMember";
	}
	
	@RequestMapping("/member/loginMember.do")
	public String selectOne(Member m, HttpSession session, Model model) {
		Member result = service.selectOne(m);		
		
		String msg="";
		String loc = "/";
		
		if(result!=null) {
			if(encoder.matches(m.getPassword(), result.getPassword())) {
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
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/member/findMember")
	public String findMember() {
		
		return "member/findMember";
	}
	
}

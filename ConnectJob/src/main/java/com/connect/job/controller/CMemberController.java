package com.connect.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.CMember;
import com.connect.job.service.CMemberService;


@Controller
public class CMemberController {

	private Logger logger=LoggerFactory.getLogger(CMemberController.class);
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private CMemberService service;
	
	/*@RequestMapping("/member/memberEnroll.do")
	public String cmemberEnroll() {
		
		return "member/memberEnroll";
	}*/
	
	@RequestMapping("/cMemberEnrollEnd.do")
	public String insertCMember(CMember m, Model model) {
		
		String pw=m.getCMemberPw();
		logger.debug(pw);
		String enPw=encoder.encode(pw);
		logger.debug(enPw);
		m.setCMemberPw(enPw);
		
		int result=service.insertMember(m);
		
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="회원가입완료";
		}
		else
		{
			msg="회원가입실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "member/loginMember";
	}
	
	//기업회원 로그인
	@RequestMapping("/cMemberLogin.do")
	public String selectOne(CMember m, HttpSession session, Model model) {
		
		CMember result = service.selectOne(m);		
		
		String msg="";
		String loc = "/";
		
		if(result!=null) {
			if(encoder.matches(m.getCMemberPw(), result.getCMemberPw())) {
				 msg = "로그인 성공!";
				 session.setAttribute("loginCMember", result); 
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
	
	/*@RequestMapping("")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("")
	public String findMember() {
		
		return "member/findMember";
	}*/
	
	//회원삭제
	@RequestMapping("/cMemberdelete.do")
	public String deleteCMember(CMember m, Model model, HttpSession session)
	{
		int result=service.deleteMember(m);
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			session.invalidate();
			msg="기업회원탈퇴가 완료되었습니다.";
		}else {
			msg="기업회원탈퇴에 실패하셨습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "common/msg";
	}
	
	//회원 수정
	@RequestMapping("/cMemberUpdate.do")
	public ModelAndView updateMember(CMember m, Model model)
	{
		CMember re=service.selectOne(m);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("member/");
		mv.addObject("m",re);
		return mv;
	}
	
	@RequestMapping("/member/updateEnd.do")
	public ModelAndView updateEnd(CMember m)
	{
		int result=service.updateMember(m);
		String msg="";
		String loc="/member/cMemberUpdate.do?CMemberId="+m.getCMemberId();
		if(result>0)
		{
			msg="수정완료";
		}
		else
		{
			msg="수정실패";
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/msg");
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		return mv;
	}
	
	//기업회원조회
	@RequestMapping("/cmemberList.do")
	public String selectList(Model model)
	{
		List<CMember> list=service.selectList();
		System.out.println(list);
		model.addAttribute("list",list);
		
		return "/cmember/cMemberList";
	}
}

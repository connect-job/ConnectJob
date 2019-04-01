package com.connect.job.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.connect.job.model.vo.Member;
import com.connect.job.service.KakaoAPI;
import com.connect.job.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private KakaoAPI kakao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private MemberService service;
	
	//회원가입 페이지 이동
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
	
	//회원가입
	@RequestMapping(value="/member/memberEnrollEnd.do", method=RequestMethod.POST)
	public String insertMember(Member m, Model model) throws Exception {
		
		String pw=m.getPassword();
		logger.debug(pw);
		String enPw=encoder.encode(pw); //암호화
		logger.debug(enPw);
		m.setPassword(enPw);
		
		int result=service.insertMember(m);
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="가입시 등록한 이메일로 인증해주세요";
			loc="/";
			
		}else {
			msg="가입 실패";
			loc="/";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@RequestMapping(value="/member/emailConfirm", method=RequestMethod.GET)
	public String emailConfirm(String pId, Model model) {
		
		/*Member m=new Member();
		m.setpId(pId);
		m.setIsEmailConfirm(1);*/
		
		/*int result=service.updateEmailConfirm(m);*/	
		
		return "member/emailConfirm";
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
				msg = "로그인 성공";
				 session.setAttribute("loginMember", result); 
				 logger.debug("클라이언트에게 넘어온 값: " + result);
			} else {
				msg = "비밀번호가 일치하지 않습니다.!";
			}
		} else {
			msg = "존재하지 않는 아이디입니다.";
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
	
	@RequestMapping(value="/kakaoLogin", produces="application/json")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		
		System.out.println("kakaoCode: " + code);	
		String access_token=kakao.getAccessToken(code);			
		
		//사용자 정보 불러오기
		HashMap<String, Object> userInfo=kakao.getUserInfo(access_token);
		System.out.println("userInfo: " + userInfo);
		
		/*if(userInfo.get("email")!=null) {
			session.setAttribute("loginMember", userInfo.get("email"));
			session.setAttribute("access_token", access_token);
		}
		*/
		return "member/loginMember";
	}
	
	/*@RequestMapping(value="/kakaoLogout")
	public String kakaoLogout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_token"));
		session.removeAttribute("access_token");
		session.removeAttribute("pId");
		
		return "redirect:/";
	}*/
	
	@RequestMapping("/member/findMember")
	public String findMember() {
		
		return "member/findMember";
	}
	
	@RequestMapping("/member/mypage.do")
	public String mypage() {
		
		return "member/mypage";
	}
}

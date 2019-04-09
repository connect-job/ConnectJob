package com.connect.job.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.common.MailHandler;
import com.connect.job.common.TempKey;
import com.connect.job.model.vo.Member;

import com.connect.job.service.MemberService;

@Controller
public class MemberController {
	
	private Logger logger=LoggerFactory.getLogger(MemberController.class);	

	@Inject
	private JavaMailSender sender;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private MemberService service;
	
	//회원가입 페이지 이동
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}

	@RequestMapping("/member/memberEnrollPage.do")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	//카카오 회원일때 회원가입 페이지 이동
	@RequestMapping("/member/memberEnrollKakao.do")
	public String memberEnroll(Member m, Model model) {
		model.addAttribute("Member", m);

		return "member/memberEnrollForm";

	}
	
	// 카카오 회원이고, 커넥트잡 회원일 때 로그인처리 세션부여
	@RequestMapping("/member/memberLoginKakao.do")
	public String memberLoginKakao(Member m, HttpSession session, Model model) {
		Member result = service.selectOneKakao(m);
		
		String msg = "";
		String loc = "/";
		
		if(result!=null) {
			msg = "카카오 로그인 성공";
			session.setAttribute("loginMember", result);
		} else {
			msg = "카카오 로그인 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}	

	//카카오 회원가입
	@RequestMapping("/member/memberEnrollEnd.do")
	public String insertMemberKakao(Member m, Model model) throws Exception {
			
		String pw=m.getPassword();
		logger.debug(pw);
		String enPw=encoder.encode(pw); //암호화
		logger.debug(enPw);
		m.setPassword(enPw);
			
		int result=service.insertMember(m);
			
		String msg="";
		String loc="";
			
		if(result>0) {
			msg="가입 성공!";
			loc="/";
				
		}else {
			msg="가입 실패";
			loc="/";
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
			
		return "common/msg";
	}
	/*//회원가입
	@RequestMapping("/member/memberEnrollEnd.do")
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
	}*/
	
	//이메일 보내기
	/*@ResponseBody*/
	@RequestMapping("/emailSender")
	public String emailSender(String keyck, String p_id, Model model) {
		
		ModelAndView mv=new ModelAndView();	
		
		//이메일 발송
		/*try {
			MailHandler sendMail=new MailHandler(sender);				
			sendMail.setSubject("[ConnectJob] 이메일 인증"); //제목				
			sendMail.setText(new StringBuffer()
							.append("[ConnectJob]이메일 인증<br>")
							.append("<a>")
							.append("인증번호:  ")
							.append(keyck)													
							.append("</a>")
							.toString()); //내용				
			sendMail.setFrom("jiany811@gmail.com", "ConnectJob"); //보내는 사람				
			sendMail.setTo(p_id); //받는 사람				
			sendMail.send();			
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}*/
	/*	
		mv.addObject("keyck", keyck);
		mv.addObject("p_id", p_id);
		mv.setViewName("member/memberEnrollForm");*/
		
		model.addAttribute("keyck", keyck);
		model.addAttribute("p_id", p_id);
		return "member/memberEnrollForm";
		
	}
	
	//이메일 인증
	@RequestMapping(value="/member/emailForm", method=RequestMethod.GET)
	public String emailConfirm(String p_id, String keyck, Model model) {
		
		model.addAttribute("keyck", keyck);
		model.addAttribute("p_id", p_id);
		
		return "member/emailForm";
	}
	
	//로그인 페이지 이동
	@RequestMapping("/member/login.do")
	public String login() {
		return "member/loginMember";
	}	
	
	//로그인
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
				 m.toString();
			} else {
				msg = "비밀번호가 일치하지 않습니다.!";
			}
		} else {
			msg = "존재하지 않는 아이디입니다.";
		}
		
		System.out.println(result);
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	//로그아웃
	@RequestMapping("/member/logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/member/isKakao.do")
	@ResponseBody
	public String isKakao(Member m, HttpSession session) {
		List<Member> result = service.selectList();
		
		String check = "";
		
		/*System.out.println("아이디값 담겼니? : " + m.getKakao_id());*/
		
		for(int i=0; i<result.size(); i++) {
			if(result.get(i).getKakao_id()==m.getKakao_id()) {
				// 로그인페이지로 이동
				check = "1";
			} else {
				// 회원가입페이지로 이동
				check = "2";
			}
		}
		return check;
	}
	
	//id,pw찾기 페이지 이동
	@RequestMapping("/member/findMember")
	public String findMember() {
		
		return "member/findMember";
	}
	
	//id 찾기
	@RequestMapping("/member/findId")
	public String findId(Member m, Model model) {	
		
		Member result=service.findId(m);
		
		String msg="id: "+result.getP_id();
		
		System.out.println(result);
		
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}	

	//마이페이지 이동
	@RequestMapping("/member/mypage.do")
	public ModelAndView mypage(Member m) {
		
		Member result=service.selectOne(m);
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("member/mypage");
		mv.addObject("m", result);
		
		return mv;
	}
	
	//회원탈퇴
	@RequestMapping("/member/deleteMember")
	public String deleteMember(String p_id, Model model, HttpSession session) {
		Member m=new Member();
		m.setP_id(p_id);
		
		int result=service.deleteMember(m);
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			msg="탈퇴완료";
			session.invalidate();
		}else {
			msg="탈퇴실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	//회원정보 수정
	@RequestMapping("/member/updateMember")
	public String updateMember(Member m, String p_id, Model model) {		
		System.out.println(m);			
		
		int result=service.updateMember(m);
		
		String msg="";
		String loc="/member/mypage.do";
		
		if(result>0) {
			msg="수정 완료";			
		}else {
			msg="수정 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	//비밀번호 변경 페이지 이동
	@RequestMapping("/member/changePw")
	public String changePw() {
		
		return "member/changePw";
	}
	
	//비밀번호 변경
	@RequestMapping("/member/changePwEnd")
	public String updatePw(Member m, Model model) {
		
		String pw=m.getPassword();
		logger.debug(pw);
		String enPw=encoder.encode(pw); //암호화
		logger.debug(enPw);
		m.setPassword(enPw);
		
		int result=service.updatePw(m);
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			msg="비밀번호가 변경되었습니다.";
		}else {
			msg="변경 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/member/checkId")
	public String checkId(String p_id) {		
		
		int count=service.selectCount(p_id);
		String result="";
		if(count==0) {result="0";}
		else {result="1";}		
		return result;
	}
	
	
	@RequestMapping("/member/findPw")
	public String findPw(Member m, Model model) {		
		
		Member result=service.findPw(m);
	
		System.out.println(result);
		
		String msg="";
		
		if(result!=null) {
			try {
				MailHandler sendMail=new MailHandler(sender);				
				sendMail.setSubject("[ConnectJob] 이메일 인증"); //제목				
				sendMail.setText(new StringBuffer()
								.append("[ConnectJob]비밀번호 변경<br>")					
								.append("<a href='http://localhost:9090/job/member/changePw'> 비밀번호 변경 </a>")
								.toString()); //내용				
				sendMail.setFrom("jiany811@gmail.com", "ConnectJob"); //보내는 사람				
				sendMail.setTo(result.getP_id()); //받는 사람				
				sendMail.send();			
				
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			msg="값 없음";
		}
		
		
		return "common/msg";
	}
	
}

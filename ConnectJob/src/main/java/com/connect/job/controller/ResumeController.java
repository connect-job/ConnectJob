package com.connect.job.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.Career;
import com.connect.job.model.vo.FinalEdu;
import com.connect.job.model.vo.Resume;
import com.connect.job.service.ResumeService;


@Controller
public class ResumeController {
	@Autowired
	private ResumeService service;
	
	@RequestMapping("/resume.do")
	public String resumeList() {
		return "resume/resumeList";
	}
	@RequestMapping("/resume/insertResume.do")
	public String insertResume() {
		return "resume/resumeForm";
	}

	@RequestMapping("/selectCareer.do")
	public String selectCareer(String career) {
		if(career.equals("∞Ê∑¬"))
			return "resume/career/career";
		else return "";
	}
	@RequestMapping("/addUniversity.do")
	public String addUniversity() {
		return "resume/finalEdu/addUniversity";
	}
	@RequestMapping("/resume/resumeRegistEnd.do")
	public String resumeRegist(Resume r,FinalEdu fe,Career c) {
		ModelAndView mv=new ModelAndView();
		System.out.println(r);
		System.out.println(fe);
		System.out.println(c);
		return "resume/resumeList";
	} 
	@RequestMapping("/selectFinalEdu.do")
	public String selectFinalEdu(String finalEdu) {
		if(finalEdu.equals("√ ¡π")) 
			return "resume/finalEdu/element";
		else if(finalEdu.equals("¡ﬂ¡π")) 
			return "resume/finalEdu/middleschool";
		else if(finalEdu.equals("∞Ì¡π"))
			return "resume/finalEdu/highschool";
		else if(finalEdu.equals("«–±≥"))
			return "";
		else
			return "resume/finalEdu/university";
		
	}
	
}

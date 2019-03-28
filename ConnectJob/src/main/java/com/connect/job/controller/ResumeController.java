package com.connect.job.controller;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("/selectFinalEdu.do")
	public String selectFinalEdu(String finalEdu) {
		if(finalEdu.equals("√ ¡π")) 
			return "resume/finalEdu/element";
		else if(finalEdu.equals("¡ﬂ¡π")) 
			return "resume/finalEdu/middleschool";
		else if(finalEdu.equals("∞Ì¡π"))
			return "resume/finalEdu/highschool";
		else 
			return "resume/finalEdu/university";
		
	}
}

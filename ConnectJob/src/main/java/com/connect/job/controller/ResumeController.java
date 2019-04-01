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
		if(career.equals("경력"))
			return "resume/career/career";
		else return "";
	}
	@RequestMapping("/selectFinalEdu.do")
	public String selectFinalEdu(String finalEdu) {
		if(finalEdu.equals("초졸")) 
			return "resume/finalEdu/element";
		else if(finalEdu.equals("중졸")) 
			return "resume/finalEdu/middleschool";
		else if(finalEdu.equals("고졸"))
			return "resume/finalEdu/highschool";
		else 
			return "resume/finalEdu/university";
		
	}
}

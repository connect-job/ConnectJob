package com.connect.job.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.Career;
import com.connect.job.model.vo.FinalEdu;
import com.connect.job.model.vo.FinalEduUniv;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Resume;
import com.connect.job.service.ResumeService;


@Controller
public class ResumeController {
	@Autowired
	private ResumeService service;
	
	//Ajax로 불러올 페이지
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
	
	@RequestMapping("/addUniversity.do")
	public String addUniversity() {
		return "resume/finalEdu/university";
	}
	
	@RequestMapping("/selectFinalEdu.do")
	public String selectFinalEdu(String finalEdu) {
		if(finalEdu.equals("초등학교 졸업")) 
			return "resume/finalEdu/element";
		else if(finalEdu.equals("중학교 졸업")) 
			return "resume/finalEdu/middleschool";
		else if(finalEdu.equals("고등학교 졸업"))
			return "resume/finalEdu/highschool";
		else
			return "resume/finalEdu/university";
		
	}
	
	
	//이력서 List페이지로 전환
	@RequestMapping("/resume.do")
	public ModelAndView resumeList(HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Member m=(Member)session.getAttribute("loginMember");
		System.out.println(m);
		List<Resume> list=service.selectedResumeList(m.getpId());
		mv.addObject("list",list);
		mv.setViewName( "resume/resumeList");
		return mv;
	}
	
	@RequestMapping("/resume/resumeView.do")
	public ModelAndView resumeView(int resumeNo) {
		ModelAndView mv=new ModelAndView();
		int countUniv=service.selectCntUniv(resumeNo);
		Resume resultR=service.selectedResume(resumeNo);
		Career career=service.selectedCareer(resumeNo);

		FinalEdu finalEdu=service.selectedFinalEdu(resumeNo);
		FinalEduUniv finalEduUniv=new FinalEduUniv();
		List<FinalEduUniv> univList=new ArrayList<FinalEduUniv>();
		
		if(countUniv>1) {
			univList=service.selectedFinalEduUnivList(resumeNo);
		}else {
			finalEduUniv=service.selectedFinalEduUniv(resumeNo);
			univList.add(finalEduUniv);
		}
		
		mv.addObject("resultR",resultR);
		mv.addObject("countUniv",countUniv);
		if(resultR.getCareer().equals("경력")) {
			mv.addObject("career",career);
		}
		System.out.println(univList);
		if(resultR.getFinalEdu().equals("대학/대학원 이상 졸업")) {
			mv.addObject("univList",univList);
		}else {
			mv.addObject("finalEdu",finalEdu);
		}
		mv.setViewName("resume/resumeView");
		return mv;
	}
	
	//이력서 등록버튼 클릭후 등록처리
	@RequestMapping("/resume/resumeRegistEnd.do")
	public ModelAndView insertResume(Resume r,FinalEdu fe,FinalEduUniv fu, Career c,HttpSession session) {
		Member m=(Member) session.getAttribute("loginMember");
		List<Resume> list=service.selectedResumeList(m.getpId());
/*		System.out.println(r);
		System.out.println(fe);
		System.out.println(fu);
		System.out.println(c);*/
		list.add(r);
		ModelAndView mv=new ModelAndView();
		int result;
		System.out.println(fu.getSchoolName());
		List<FinalEduUniv> univList=new ArrayList();
		if(r.getFinalEdu().equals("대학/대학원 이상 졸업")) {
			if(fu.getSecondMajorCategory()==null) {
				fu.setSecondMajorCategory("");
				fu.setSecondMajor("");
			}
			String[] schoolFlag=fu.getSchoolFlag().split(",");
			String[] schoolName=fu.getSchoolName().split(",");
			String[] major=fu.getMajor().split(",");
			String[] secondMajorCategory=fu.getSecondMajorCategory().split(",");
		
			String[] secondMajor=fu.getSecondMajor().split(",");
			String[] score=fu.getScore().split(",");
			String[] scoreStandard=fu.getScoreStandard().split(",");
			String[] admissionYM=fu.getAdmissionYM().split(",");
			String[] graduationYM=fu.getGraduationYM().split(",");
			String[] graduateState=fu.getGraduateState().split(",");
			
			for(int i=0;i<schoolFlag.length;i++) {
				FinalEduUniv f=new FinalEduUniv();
				f.setSchoolFlag(schoolFlag[i]);
				f.setSchoolName(schoolName[i]);
				f.setMajor(major[i]);
				f.setSecondMajorCategory(secondMajorCategory[i]);
				f.setSecondMajor(secondMajor[i]);
				f.setScore(score[i]);
				f.setScoreStandard(scoreStandard[i]);
				f.setAdmissionYM(admissionYM[i]);
				f.setGraduationYM(graduationYM[i]);
				f.setGraduateState(graduateState[i]);
				univList.add(f);
			}
			result=service.insertResume(r, univList, c);
		}else {
			result=service.insertResume(r, fe, c);
		}
		
		if(result<=0) {
			mv.setViewName("common/msg");
			mv.addObject("msg", "이력서 등록에 실패하였습니다.");
			mv.addObject("loc","/");
			return mv;
			
		}else {
			mv.addObject("list",list);
			mv.setViewName("resume/resumeList");
		}
		return mv;
	} 
	
	
	@RequestMapping("/resume/deleteResume")
	public ModelAndView deleteResume(int resumeNo,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Member m=(Member) session.getAttribute("loginMember");
		
		int result=service.deleteResume(resumeNo);
		if(result>0) {
			mv.addObject("msg","이력서가 성공적으로 삭제되었습니다.");
			
		}else {
			mv.addObject("msg","이력서 삭제에 실패하였습니다.");
		}

		List<Resume> list=service.selectedResumeList(m.getpId());
		mv.setViewName("common/msg");
		mv.addObject("list",list);
		mv.addObject("loc","/resume.do");
		return mv;
	}
	
	
	
}

package com.connect.job.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.Career;
import com.connect.job.model.vo.FinalEdu;
import com.connect.job.model.vo.FinalEduUniv;
import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.ProfileImg;
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
		List<Resume> list=service.selectedResumeList(m.getP_id());
		mv.addObject("list",list);
		mv.setViewName( "resume/resumeList");
		return mv;
	}
	
	@RequestMapping("/resume/resumeView.do")
	public ModelAndView resumeView(int resumeNo) {
		ModelAndView mv=new ModelAndView();
		ProfileImg img=service.selectedProfileImg(resumeNo);
		int countUniv=service.selectCntUniv(resumeNo);
		Resume resultR=service.selectedResume(resumeNo);
		Career career=service.selectedCareer(resumeNo);
		System.out.println("view 학교갯수 : "+countUniv);
		FinalEdu finalEdu=service.selectedFinalEdu(resumeNo);
		FinalEduUniv finalEduUniv=new FinalEduUniv();
		List<FinalEduUniv> univList=new ArrayList<FinalEduUniv>();
		System.out.println("------view-----");
		System.out.println(finalEdu);
		System.out.println(resultR);
		System.out.println(career);
		System.out.println(finalEduUniv);
		System.out.println("--------------");
		if(countUniv>1) {
			univList=service.selectedFinalEduUnivList(resumeNo);
		}else {
			finalEduUniv=service.selectedFinalEduUniv(resumeNo);
			univList.add(finalEduUniv);
		}
		System.out.println("select 사진 : "+img);
		mv.addObject("img",img);
		mv.addObject("resultR",resultR);
		mv.addObject("countUniv",countUniv);
		if(resultR.getCareer().equals("경력")) {
			mv.addObject("career",career);
		}
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
	public ModelAndView insertResume(MultipartFile profileImg,Resume r,FinalEdu fe,FinalEduUniv fu, Career c,HttpSession session,HttpServletRequest re) {
		
/*		System.out.println(r);
		System.out.println(fe);
		System.out.println(fu);
		System.out.println(c);
*/
		System.out.println("------insert-----");
		System.out.println(profileImg);
		System.out.println(r);
		System.out.println(c);
		System.out.println(fe);
		System.out.println(fu);
		System.out.println("--------------");
		//---------------------파일입출력
		ProfileImg p=new ProfileImg();
		String saveDir=re.getSession().getServletContext().getRealPath("/resources/upload/profile");
		
		File dir=new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(profileImg!=null){
			String oriFileName=profileImg.getOriginalFilename();
			String ext=oriFileName.substring(oriFileName.indexOf("."));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			String reNamedFile=sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+ext;
			try{
				profileImg.transferTo(new File(saveDir+"/"+reNamedFile));
			}catch(IOException e){e.printStackTrace();}
			
			p.setOriginalFileName(oriFileName);
			p.setRenamedFileName(reNamedFile);
		}
		System.out.println("사진등록 사진객체: "+p);
		//vo객체
		Member m=(Member) session.getAttribute("loginMember");
		List<Resume> list=service.selectedResumeList(m.getP_id());
		list.add(r);
		ModelAndView mv=new ModelAndView();
		int result;
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
			result=service.insertResume(r, univList, c, p);
		}else {
			result=service.insertResume(r, fe, c, p);
		}
		
		if(result<=0) {
			mv.setViewName("common/msg");
			mv.addObject("msg", "이력서 등록에 실패하였습니다.");
			mv.addObject("loc","/");
			return mv;
			
		}else {
			mv.setViewName("common/msg");
			mv.addObject("msg", "이력서가 등록되었습니다.");
			mv.addObject("loc","/resume.do");
			mv.addObject("list",list);
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

		List<Resume> list=service.selectedResumeList(m.getP_id());
		mv.setViewName("common/msg");
		mv.addObject("list",list);
		mv.addObject("loc","/resume.do");
		return mv;
	}
	
	@RequestMapping("/resume/updateResume")
	public ModelAndView updateResume(int resumeNo) {
		ModelAndView mv=new ModelAndView();
		
		ProfileImg img=service.selectedProfileImg(resumeNo);
		int countUniv=service.selectCntUniv(resumeNo);
		Resume resultR=service.selectedResume(resumeNo);
		Career career=service.selectedCareer(resumeNo);

		FinalEdu finalEdu=service.selectedFinalEdu(resumeNo);
		FinalEduUniv finalEduUniv=new FinalEduUniv();
		List<FinalEduUniv> univList=new ArrayList<FinalEduUniv>();
		System.out.println("------update-----");
		System.out.println(img);
		System.out.println(resultR);
		System.out.println(career);
		System.out.println(finalEdu);
		System.out.println(finalEduUniv);
		System.out.println("--------------");
		if(countUniv>1) {
			univList=service.selectedFinalEduUnivList(resumeNo);
		}else {
			finalEduUniv=service.selectedFinalEduUniv(resumeNo);
			univList.add(finalEduUniv);
		}
		mv.addObject("img",img);
		mv.addObject("resultR",resultR);
		mv.addObject("countUniv",countUniv);
		if(resultR.getCareer().equals("경력")) {
			mv.addObject("career",career);
		}
		if(resultR.getFinalEdu().equals("대학/대학원 이상 졸업")) {
			mv.addObject("univList",univList);
		}else {
			mv.addObject("finalEdu",finalEdu);
		}
		mv.setViewName("resume/resumeUpdateForm");
		return mv;
	}
	@RequestMapping("/resume/resumeUpdateEnd.do")
	public ModelAndView updateResume(MultipartFile profileImg,int resumeNo,Resume r,FinalEdu fe,FinalEduUniv fu, Career c,HttpSession session,HttpServletRequest re){
		System.out.println(profileImg);
		System.out.println(r);
		System.out.println(fe);
		System.out.println(fu);
		System.out.println(c);
		r.setResumeNo(resumeNo);
		
		ProfileImg p=new ProfileImg();
		String saveDir=re.getSession().getServletContext().getRealPath("/resources/upload/profile");
		
		File dir=new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(profileImg!=null){
			String oriFileName=profileImg.getOriginalFilename();
			String ext=oriFileName.substring(oriFileName.indexOf("."));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy_MM_dd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			String reNamedFile=sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+ext;
			try{
				profileImg.transferTo(new File(saveDir+"/"+reNamedFile));
			}catch(IOException e){e.printStackTrace();}
			
			p.setOriginalFileName(oriFileName);
			p.setRenamedFileName(reNamedFile);
		}
		System.out.println("사진등록 사진객체: "+p);
		//vo객체
		Member m=(Member) session.getAttribute("loginMember");
		List<Resume> list=service.selectedResumeList(m.getP_id());
		list.add(r);
		ModelAndView mv=new ModelAndView();
		int result;
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
			result=service.updateResume(r, univList, c, p);
		}else {
			result=service.updateResume(r, fe, c, p);
		}
		
		if(result<=0) {
			mv.setViewName("common/msg");
			mv.addObject("msg", "이력서 수정에 실패하였습니다.");
			mv.addObject("loc","/");
			return mv;
			
		}else {
			mv.setViewName("common/msg");
			mv.addObject("msg", "이력서가 수정되었습니다.");
			mv.addObject("loc","/resume.do");
			mv.addObject("list",list);
		}
		return mv;
	}
	
}

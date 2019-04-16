package com.connect.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.CMember;
import com.connect.job.model.vo.CPScrap;
import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.HNScrap;
import com.connect.job.model.vo.HireNoti;
import com.connect.job.model.vo.Member;
import com.connect.job.service.CMemberService;
import com.connect.job.service.CompanyService;
import com.connect.job.service.HireNotiService;
import com.connect.job.service.ScrapService;

@Controller
public class ScrapController {
   @Autowired
   private ScrapService service;
   @Autowired
   private CMemberService cmService;
   @Autowired
   private CompanyService cService;
   
   
   @RequestMapping("/scrap.do")
   public ModelAndView scrapList(HttpSession session) {
	   ModelAndView mv=new ModelAndView();
	   Member m=(Member)session.getAttribute("loginMember");
	   //기업스크랩
	   CPScrap cp=new CPScrap();
	   cp.setpId(m.getP_id());
	   //공고스크랩
	   HNScrap hn=new HNScrap();
	   hn.setpId(m.getP_id());
      
		List<CPScrap> cpList=service.selectCPScrapList(cp);//기업스크랩리스트
		List<HNScrap> hnList=service.selectHNScrapList(hn);//공고스크랩리스트
		
		int cpScrapCnt=service.selectCPScrapCnt(cp);//기업스크랩리스트 갯수
		int hnScrapCnt=service.selectHNScrapCnt(hn);//공고스크랩리스트 갯수
		
		System.out.println("**********cpList");
		for(CPScrap c:cpList) { System.out.println(c); }
		
		System.out.println("**********hnList");
		for(HNScrap h:hnList) { System.out.println(h); }
		
		
		mv.addObject("cpList",cpList);
		mv.addObject("hnList",hnList);
		mv.addObject("cpScrapCnt",cpScrapCnt);
		mv.addObject("hnScrapCnt",hnScrapCnt);
		mv.setViewName("scrap/scrapList");
		return mv;
		
	}
	
	@RequestMapping("/scrap/insertCPScrap.do")
	public ModelAndView insertCPScrap(HttpSession session,int companyNo,String category){
		ModelAndView mv=new ModelAndView();
		Member m=(Member)session.getAttribute("loginMember");
		CPScrap cp=new CPScrap();
		cp.setCompanyNo(companyNo);
		cp.setpId(m.getP_id());
		cp.setsCategory(category);
		
		int result=service.insertCPScrap(cp);
		
		if(result>0) {
			mv.addObject("loc", "/company/companyView.do?no="+companyNo);
			mv.addObject("cpScrap",cp);
			mv.addObject("msg", "스크랩에 성공했습니다.");
			mv.setViewName("common/msg");
		}else {
			mv.addObject("loc","/");
			mv.addObject("msg","스크랩에 실패하였습니다.");
			mv.setViewName("common/msg");
		}
		return mv;
		
	}
	@RequestMapping("/scrap/insertHNScrap.do")
	public ModelAndView insertHNScrap(String cMemberId,String hnTitle,int hnSeq, HttpSession session) {
		ModelAndView mv=new ModelAndView();
		Member m=(Member)session.getAttribute("loginMember");
		//cMemberId로 companyNo가져오기
		CMember cMember=new CMember();
		cMember.setcMemberId(cMemberId);
		CMember cm=cmService.selectOne(cMember);
		System.out.println("*****************************HNScrap");
		System.out.println("cMember:"+cm);
		int companyNo=Integer.parseInt(cm.getcId());
		Company c=cService.selectOne(companyNo);
		System.out.println("company : "+c);
		HNScrap hn=new HNScrap();//insert할 scrap
		hn.setCompanyNo(companyNo);
		hn.setCompanyName(c.getCompanyName());
		hn.setHnTitle(hnTitle);
		hn.setpId(m.getP_id());
		hn.setsCategory("공고");
		hn.setHnSeq(hnSeq);
		System.out.println("HN : "+hn);
		
		HNScrap isExist=service.selectHNScrap(hn);//insert하기전 존재여부확인객체
		if(isExist!=null&&isExist.getIsDelete().equals("false")) {//이미 스크랩이 존재하면
			int result=service.deleteHNScrap(isExist.getScrapNo()); //스크랩삭제
			if(result>0) {
				mv.addObject("loc", "/hireNotiAll.do");
				mv.addObject("msg", "스크랩이 취소되었습니다.");
				mv.setViewName("common/msg");
			}else {
				mv.addObject("msg","삭제에 실패하였습니다.");
				mv.addObject("loc","/scrap.do");
				mv.setViewName("common/msg");
			}
		}else {//스크랩이 존재하지않으면
			System.out.println(hn);
			int result=service.insertHNScrap(hn);
			if(result>0) {
				mv.addObject("loc", "/hireNotiAll.do");
				mv.addObject("HNScrap",hn);
				mv.addObject("msg", "스크랩에 성공했습니다.");
				mv.setViewName("common/msg");
			}else {
				mv.addObject("loc","/");
				mv.addObject("msg","스크랩에 실패하였습니다.");
				mv.setViewName("common/msg");
			}
		}
		return mv;
	}
	
	
	@RequestMapping("/scrap/deleteCPScrap.do")
	public ModelAndView deleteScrap(HttpSession session, int scrapNo, int companyNo) {
		ModelAndView mv=new ModelAndView();
		Member m=(Member)session.getAttribute("loginMember");
		CPScrap cp=new CPScrap();
		cp.setpId(m.getP_id());
		
		HNScrap hn=new HNScrap();
		hn.setpId(m.getP_id());
		
		int result=service.deleteCPScrap(scrapNo);
		
		List<CPScrap> cpList=service.selectCPScrapList(cp);
		List<HNScrap> hnList=service.selectHNScrapList(hn);
		int cpScrapCnt=service.selectCPScrapCnt(cp);
		int hnScrapCnt=service.selectHNScrapCnt(hn);
		mv.addObject("cpList",cpList);
		mv.addObject("hnList",hnList);
		mv.addObject("cpScrapCnt",cpScrapCnt);
		mv.addObject("hnScrapCnt",hnScrapCnt);
		
		if(result>0&&companyNo!=0) {
			mv.addObject("loc", "/company/companyView.do?no="+companyNo);
			mv.addObject("msg","스크랩이 취소되었습니다.");
			mv.setViewName("common/msg");
		}else if(result>0&&companyNo==0) {
			mv.setViewName("scrap/scrapList");
		}
		
		else {
			mv.addObject("msg","삭제에 실패하였습니다.");
			mv.addObject("loc","/scrap.do");
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	@RequestMapping("/scrap/deleteHNScrap.do")
	public ModelAndView deleteHNScrap(HttpSession session, int scrapNo, int hnSeq ) {
		ModelAndView mv=new ModelAndView();
		Member m=(Member)session.getAttribute("loginMember");
		CPScrap cp=new CPScrap();
		cp.setpId(m.getP_id());
		
		HNScrap hn=new HNScrap();
		hn.setpId(m.getP_id());
		System.out.println("삭제할 HN scrapNo : "+scrapNo);
		int result=service.deleteHNScrap(scrapNo);
		
		List<CPScrap> cpList=service.selectCPScrapList(cp);
		List<HNScrap> hnList=service.selectHNScrapList(hn);
		int cpScrapCnt=service.selectCPScrapCnt(cp);
		int hnScrapCnt=service.selectHNScrapCnt(hn);
		mv.addObject("cpList",cpList);
		mv.addObject("hnList",hnList);
		mv.addObject("cpScrapCnt",cpScrapCnt);
		mv.addObject("hnScrapCnt",hnScrapCnt);
		
		if(result>0&&hnSeq!=0) {
			mv.addObject("loc", "/hireNotiView.do?no="+hnSeq);
			mv.addObject("msg","스크랩이 취소되었습니다.");
			mv.setViewName("common/msg");
		}else if(result>0&&hnSeq==0) {
			mv.setViewName("scrap/scrapList");
		}
		
		else {
			mv.addObject("msg","삭제에 실패하였습니다.");
			mv.addObject("loc","/scrap.do");
			mv.setViewName("common/msg");
		}
		return mv;
	}
}

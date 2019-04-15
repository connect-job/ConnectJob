package com.connect.job.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.connect.job.model.vo.Member;
import com.connect.job.model.vo.Scrap;
import com.connect.job.service.ScrapService;

@Controller
public class ScrapController {
   @Autowired
   private ScrapService service;
   
   @RequestMapping("/scrap.do")
   public ModelAndView scrapList(HttpSession session) {
      ModelAndView mv=new ModelAndView();
      Member m=(Member)session.getAttribute("loginMember");
      Scrap s=new Scrap();
      s.setpId(m.getP_id());

      List<Scrap> allList=service.selectAllScrapList(s);
      List<Scrap> CPList=service.selectCPScrapList(s);
      List<Scrap> HNList=service.selectHNScrapList(s);
      int allScrapCnt=service.selectAllScrapCnt(s);
      int CPScrapCnt=service.selectCPScrapCnt(s);
      int HNScrapCnt=service.selectHNScrapCnt(s);
      mv.addObject("allList",allList);
      mv.addObject("CPList",CPList);
      mv.addObject("HNList",HNList);
      mv.addObject("allScrapCnt",allScrapCnt);
      mv.addObject("CPScrapCnt",CPScrapCnt);
      mv.addObject("HNScrapCnt",HNScrapCnt);
      mv.setViewName("scrap/scrapList");
      return mv;
      
   }
   
   @RequestMapping("/scrap/insertAndViewScrap.do")
   public ModelAndView insertAndViewScrap(HttpSession session,int companyNo) {
      ModelAndView mv=new ModelAndView();
      Member m=(Member)session.getAttribute("loginMember");
      Scrap s=new Scrap();
      s.setCompanyNo(companyNo);
      s.setpId(m.getP_id());
      s.setsCategory("기업");
      int result=service.insertCPScrap(s);
      List<Scrap> allList=service.selectAllScrapList(s);
      if(result>0) {
         mv.addObject("allList",allList);
         mv.setViewName("scrap/scrapList");
      }else {
         mv.addObject("loc","/");
         mv.addObject("msg","스크랩에 실패하였습니다.");
         mv.setViewName("common/msg");
      }
      return mv;
   }
   @RequestMapping("/scrap/insertCPScrap.do")
   public void insertCPScrap(HttpSession session,int companyNo){
      Member m=(Member)session.getAttribute("loginMember");
      Scrap s=new Scrap();
      s.setCompanyNo(companyNo);
      s.setpId(m.getP_id());
      s.setsCategory("기업");
      int result=service.insertCPScrap(s);
   }
   @RequestMapping("/scrap/delete.do")
   public ModelAndView deleteScrap(HttpSession session, int scrapNo) {
      ModelAndView mv=new ModelAndView();
      Member m=(Member)session.getAttribute("loginMember");
      Scrap s=new Scrap();
      s.setpId(m.getP_id());
      
      int result=service.deleteScrap(scrapNo);
      List<Scrap> allList=service.selectAllScrapList(s);
      List<Scrap> CPList=service.selectCPScrapList(s);
      List<Scrap> HNList=service.selectHNScrapList(s);
      int allScrapCnt=service.selectAllScrapCnt(s);
      int CPScrapCnt=service.selectCPScrapCnt(s);
      int HNScrapCnt=service.selectHNScrapCnt(s);
      mv.addObject("allList",allList);
      mv.addObject("CPList",CPList);
      mv.addObject("HNList",HNList);
      mv.addObject("allScrapCnt",allScrapCnt);
      mv.addObject("CPScrapCnt",CPScrapCnt);
      mv.addObject("HNScrapCnt",HNScrapCnt);
      
      if(result>0) {
         mv.setViewName("scrap/scrapList");
      }else {
         mv.addObject("msg","삭제에 실패하였습니다.");
         mv.addObject("loc","/scrap.do");
         mv.setViewName("common/msg");
      }
      return mv;
   }
}
package com.connect.job.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connect.job.model.vo.HireNoti;
import com.connect.job.service.HireNotiService;


@Controller
public class BusinessPageController {
	
	@Autowired
	private HireNotiService service;
	
	private Logger logger=LoggerFactory.getLogger(CMemberController.class);
	
	//기업페이지로 이동
	@RequestMapping("/cmemberBizPage")
	public String BizMain()
	{
		return "businessPage/businessPage-main";
	}
	//채용공고 등록페이지로 이동
	@RequestMapping("/hireNotiAdd.do")
	public String hireNotiAdd()
	{
		return "businessPage/businessPage-hireNotiAdd";
	}
	
	@RequestMapping("/insertNoti.do")
	public String insertNoti(HireNoti h, Model model)
	{
		logger.info(h+"h1");
		int result=service.insertNoti(h);
		logger.info(h+"h2");
		
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="채용공고 등록완료";
		}
		else
		{
			msg="채용공고 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "businessPage/businessPage-main";
	}
	
	
	
	
	/*@RequestMapping("/insertNoti.do")
	public ModelAndView insertNoti(HireNoti h, @RequestParam(name="upfile") MultipartFile[] upFile, HttpServletRequest re)
	{
		ModelAndView mv=new ModelAndView();
		logger.info(mv+"mv?");
		String HNSort=re.getParameter("HNSort");
		String saveDir=re.getSession().getServletContext().getRealPath("/resources/upload");
		logger.info(saveDir);
		File dir = new File(saveDir);
		if(!dir.exists()) {dir.mkdirs();}
		logger.info(dir+"파일");
		logger.info(h+"h");
		logger.info(re+"re");
		logger.info(upFile+"upFile");
		List<HireNoti> list = new ArrayList<HireNoti>();//다중 업로드
		for(MultipartFile f : upFile)
		{
			if(!f.isEmpty())
			{
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.indexOf("."));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int rndNum=(int)(Math.random()*10000);
				String reNamedFile=sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+ext;
				try {f.transferTo(new File(saveDir+"/"+reNamedFile));}
				catch(IOException e){e.printStackTrace();}
				HireNoti a=new HireNoti();
				//////////////////////////////////////
				a.setHNOri(oriFileName);
				a.setHNRe(reNamedFile);
				list.add(a);
				logger.info(a+"담기나?");
			}
		}
		logger.info(list+"리스트");
		logger.info(h.getCMemberId()+"아이디확인");
		int result=0;
		//logger.info(HNSort);
		//String[] cateTemp=HNSort.split(",");
		logger.info(HNSort+"카테템프 포문전");
		
		for(int i=0;i<HNSort.length();i++)
		{
			h.setHNSort(HNSort);
			logger.debug(result+"카테탬프 포문안");
		}
		result=service.insertNoti(h,list);
		
		logger.debug(result+"과연");
		
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="채용공고 등록완료";
		}
		else
		{
			msg="채용공고 등록 실패";
		}
		
		mv.setViewName("common/msg");
		
		
		return mv;
	}*/
	

}

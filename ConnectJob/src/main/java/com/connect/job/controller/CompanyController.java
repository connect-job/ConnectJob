package com.connect.job.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connect.job.model.vo.Company;
import com.connect.job.model.vo.CompanyAvgScore;
import com.connect.job.model.vo.News;
import com.connect.job.openapi.NaverSearch;
import com.connect.job.service.CompanyService;
import com.connect.job.common.AjaxPageBarFactory;
import com.connect.job.common.PageBarFactory;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService service;
	
	// 기업 리스트 페이지 이동
	@RequestMapping("company/companyList.do")
	public String companyList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage = 10;
		List<Company> list = service.selectAll(cPage, numPerPage);
		int total = service.selectCompanyCount();
		model.addAttribute("pageBar", PageBarFactory.getPageBar(total, cPage, numPerPage));
		model.addAttribute("company",list);
		return "company/companyList";
	}
	
	// 기업 상세 페이지 이동
	@RequestMapping("company/companyView.do")
	public String companyView(int no, Model model) {
		Company com = service.selectOne(no);
		
		// 총 평점 및 각 점수 가져오기
		CompanyAvgScore cas = service.selectScore(no);
		
		List<News> news = new NaverSearch().naverSearch(com.getCompanyName());
		
		model.addAttribute("score", cas);
		model.addAttribute("company",com);
		model.addAttribute("news", news);
		return "company/companyView";
	}
	
	// 기업탐색 -> 상세페이지 조건 검색
	@RequestMapping("company/companyListEnd.do")
	@ResponseBody
	public String companyListEnd(HttpServletRequest request,@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String location, Model model) throws UnsupportedEncodingException {
		String[] locations = location.split(",");
		Company com = new Company();
		com.setCompanyLocations(locations);
		
		int numPerPage = 10;
		List<Company> list = service.companyList(com, cPage, numPerPage);
		int total = service.selectAjaxCount(com);
		
		String pageBar =  AjaxPageBarFactory.getPageBar(total, cPage, numPerPage);
		
		String html = "";
		
		html += "<tr>";
        html += "<th style=\"width:150px\">기업구분</th>";
        html += "<th style=\"width:390px\">기업명</th>";
        html += "<th style=\"width:300px\">기업주소</th>";
        html += "<th style=\"width:150px\">리뷰 수</th>";
        html += "</tr>";
        
		for(int i=0; i<list.size(); i++) {
			html += "<tr>";
			html += "<td style=\"text-align:center\">";
			if(list.get(i).getCompanyStatus()==1) {
				html += "법인";
			} else {
				html += "개인";
			}
			html += "</td>";
			html += "<td><a href=\"" + request.getContextPath() + "/company/companyView.do?no=" +list.get(i).getCompanyNo() + "\">" + list.get(i).getCompanyName() + "</a></td>";
			html += "<td>" + list.get(i).getCompanyAddressNew() + "</td>";
			html += "<td style=\"text-align:center\">28</td>";
			html += "</tr>";
		}
		
		html += "<tr>";
		html += "<td colspan=\"4\" style=\"text-align: center;\"><div id=\"pageBar\">";
		html +=  pageBar;
		html += "</div>";
		html += "</td>";
		html += "</tr>";
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 등록된 전체 기업 수
	@RequestMapping("company/companyCount.do")
	@ResponseBody
	public String selectCompanyCount() {
		int count = service.selectCompanyCount();
		String result = String.valueOf(count);
		return result;
	}
	
	// 메인 -> 기업 검색 폼
	@RequestMapping("company/searchCompany.do")
	@ResponseBody
	public String searchCompany(String keyword) throws UnsupportedEncodingException {
		System.out.println(keyword);
		List<Company> list = service.searchCompany(keyword);
		
		String result = "<ul>";
		for(int i=0; i<list.size(); i++) {
			result += "<li onclick='fn_keywordCheck("+ list.get(i).getCompanyNo() +")'>" + list.get(i).getCompanyName() + "&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; " + list.get(i).getCompanyAddressNew().substring(0,10) + "</li>";
		}
		result += "</ul>";
		
		String html = URLEncoder.encode(result, "UTF-8");
		return html;
	}
	
	// 기업등록
	@RequestMapping("company/insertCompany.do")
	public String insertCompany() {
		//반환용 리스트
        List<List<String>> ret = new ArrayList<List<String>>();
        BufferedReader br = null;
        
        try{
            br = Files.newBufferedReader(Paths.get("C:\\Users\\sihus\\git\\ConnectJob\\ConnectJob\\src\\main\\webapp\\resources\\upload\\comData.csv"));
            Charset.forName("UTF-8");
            String line = "";
            
            int number = 0;
            
            while((line = br.readLine()) != null){
                //CSV 1행을 저장하는 리스트
                List<String> tmpList = new ArrayList<String>();
                String array[] = line.split(",");
                //배열에서 리스트 반환
                tmpList = Arrays.asList(array);
                System.out.println("tmpList [ " + number++ + " ] " + tmpList);
                ret.add(tmpList);
            }
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            try{
                if(br != null){
                    br.close();
                }
            }catch(IOException e){
                e.printStackTrace();
            }
        }
        
        List<Company> list = new ArrayList<Company>();
        for(int i=0; i<list.size(); i++) {
        	Company com = new Company();
        	String[] temp = ret.get(i).toString().substring(1, ret.get(i).toString().length()-1).split(", ");
        	com.setCompanyNo(i);
        	com.setCompanyUpdate(temp[0]);
        	com.setCompanyName(temp[1]);
        	com.setCompanyZipcode(Integer.parseInt(temp[2]));
        	com.setCompanyAddressOld(temp[3]);
        	com.setCompanyAddressNew(temp[4]);
        	com.setCompanyStatus(Integer.parseInt(temp[5]));
        	com.setCompanyCode(Integer.parseInt(temp[6]));
        	com.setCompanyCate(temp[7]);
        	com.setCompanyRegDate(temp[8]);
        	com.setCompanyAllPeople(Integer.parseInt(temp[9]));
        	com.setCompanyPrice(Integer.parseInt(temp[10]));
        	com.setCompanyNewPeople(Integer.parseInt(temp[11]));
        	com.setCompanyOutPeople(Integer.parseInt(temp[12]));
        	list.add(com);
        	int result = service.insertCompany(com);
        }
        
        for(int i=0; i<list.size(); i++) {
        	System.out.print("컴파니 리스트 이름 " + " [" + i + "] " + list.get(i).getCompanyName() );
        	System.out.print("//  우편번호 " + list.get(i).getCompanyZipcode() );
        	System.out.print("//  주소1 " + list.get(i).getCompanyAddressNew() );
        	System.out.print("//  주소2 " + list.get(i).getCompanyAddressOld() );
        	System.out.print("//  전체사원수 " +  list.get(i).getCompanyAllPeople() );
        	System.out.print("//  신규사원수 " +  list.get(i).getCompanyNewPeople());
        	System.out.print("//  탈퇴사원수 " +  list.get(i).getCompanyOutPeople());
        	System.out.println("");
        }
		return "/";
	}
	
	
	
	
}

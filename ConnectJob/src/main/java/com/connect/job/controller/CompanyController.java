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
import com.connect.job.model.vo.HireNoti;
import com.connect.job.model.vo.News;
import com.connect.job.model.vo.SearchKeyword;
import com.connect.job.openapi.NaverSearch;
import com.connect.job.service.CompanyService;
import com.connect.job.common.AjaxPageBarFactory;
import com.connect.job.common.PageBarFactory;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyService service;
	
	// 연봉 TOP 5
	@RequestMapping("company/latestSalary.do")
	@ResponseBody
	public String latestSalary(HttpServletRequest request) throws UnsupportedEncodingException {
		String html = "";
		
		List<Company> list = service.latestSalary();
		
		html += "<ul>";
		if(!list.isEmpty()) {
			for(int i=0; i<5; i++) {
				html += "<li class=\"wow fadeInUp\"  data-wow-delay=\"0.1s\" onclick=\"location.href='" + request.getContextPath() + "/company/companyView.do?no=" + list.get(i).getCompanyNo() + "'\">";
				if(list.get(i).getCompanyName().length()>12) {
					html += (i+1) + "　" +  list.get(i).getCompanyName().substring(0, 13) + "...";		
				} else {
					html += (i+1) + "　"+  list.get(i).getCompanyName();
				}
				html += "　|　" + list.get(i).getCompanyPrice() +"원</li>";
			}
		} else {
			html += "<li>리스트가 없습니다</li>";
		}
		html += "</ul>";
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 리뷰 TOP 5
	@RequestMapping("company/latestReview.do")
	@ResponseBody
	public String latestReview(HttpServletRequest request) throws UnsupportedEncodingException {
		String html = "";
		
		List<Company> list = service.latestReview();
		
		html += "<ul>";
		if(!list.isEmpty()) {
			for(int i=0; i<5; i++) {
				html += "<li class=\"wow fadeInUp\"  data-wow-delay=\"0.1s\" onclick=\"location.href='" + request.getContextPath() + "/company/companyView.do?no=" + list.get(i).getCompanyNo() + "'\">";
				if(list.get(i).getCompanyName().length()>12) {
					html += (i+1) + "　"+  list.get(i).getCompanyName().substring(0, 13) + "...</li>";		
				} else {
					html += (i+1) + "　"+  list.get(i).getCompanyName() +"</li>";
				}
			}
		} else {
			html += "<li>리스트가 없습니다</li>";
		}
		html += "</ul>";
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 기업평점 TOP 5
		@RequestMapping("company/latestScore.do")
		@ResponseBody
		public String latestScore(HttpServletRequest request) throws UnsupportedEncodingException {
			String html = "";
			
			List<Company> list = service.latestScore();
			
			html += "<ul>";
			if(!list.isEmpty()) {
				for(int i=0; i<5; i++) {
					html += "<li class=\"wow fadeInUp\"  data-wow-delay=\"0.1s\" onclick=\"location.href='" + request.getContextPath() + "/company/companyView.do?no=" + list.get(i).getCompanyNo() + "'\">";
					if(list.get(i).getCompanyName().length()>12) {
						html += (i+1) + "　"+ list.get(i).getCompanyName().substring(0, 13) + "...</li>";		
					} else {
						html += (i+1) + "　"+ list.get(i).getCompanyName() + "</li>";
					}
				}
			} else {
				html += "<li>리스트가 없습니다</li>";
			}
			html += "</ul>";
			
			String result = URLEncoder.encode(html, "UTF-8");
			return result;
		}
	
		@RequestMapping("company/companyHire.do")
		@ResponseBody
		public String companyHire(int no) throws UnsupportedEncodingException {
			String html = "";
			
			List<HireNoti> list = service.latestHire(no);
			
			for(int i=0; i<list.size(); i++) {
				html += "<div class=\"hire-item\">";
				html += "<div class=\"item-title\">";
				if(list.get(i).getHnTitle().length()>15) {
					html += list.get(i).getHnTitle().substring(0, 16) + "...</div>";
				} else {
					html += list.get(i).getHnTitle() + "</div>";
				}
				html += "<div class=\"item-sub-title\">" + list.get(i).getcName() + "</div>";
				html += "<div class=\"item-btn\"><button>지원하기</button></div>";
				html += "</div>";
			}
			
			String result = URLEncoder.encode(html, "UTF-8");
			return result;
		}
		
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
		
		html += "<div class=\"list-item-top\">";
		html += "<div class=\"cate\">기업구분</div>";
		html += "<div class=\"name\">기업명</div>";
		html += "<div class=\"address\">기업주소</div>";
		html += "<div class=\"count\">등록된 리뷰수</div>";
		html += "</div>";
		
		for(int i=0; i<list.size(); i++) {
			html += "<div class=\"list-item\">";
			html += "<div class=\"cate\">";
			if(list.get(i).getCompanyStatus()==1) {
				html += "법인";
			} else {
				html += "개인";
			}
			html += "</div>";
			
			html += "<div class=\"name\">";
			html += "<a href=\"" + request.getContextPath() + "/company/companyView.do?no=" + list.get(i).getCompanyNo() + "\">" + list.get(i).getCompanyName() + "</a>";
			html += "</div>";
			html += "<div class=\"address\">" + list.get(i).getCompanyAddressNew() + "</div>";
			html += "<div class=\"count\">" + list.get(i).getReviewCount() + "</div>";
			html += "</div>";
		}
		html += "<div id=\"pageBar\">" + pageBar + "</div>";
		
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
	
	// 검색하는 순간 데이터 저장
	@RequestMapping("company/searchKeyword.do")
	@ResponseBody
	public String searchKeyword(int keyword) {
		int result = service.searchKeyword(keyword);
		return "검색어 저장완료";
	}
	
	// 인덱스 Ajax 검색어 랭킹
	@RequestMapping("company/selectKeyword.do")
	@ResponseBody
	public String selectKeyword(HttpServletRequest request) throws UnsupportedEncodingException {
		List<SearchKeyword> list = service.selectKeyword();
		
		String html = "";
		
		if(!list.isEmpty()) {
			html += "<ul class='rolling'>";
			for(int i=0; i<list.size(); i++) {
				html += "<li onclick=\"location.href='" + request.getContextPath() + "/company/companyView.do?no=" +list.get(i).getSearchCompany() + "'\">" + (i+1) + "　" + list.get(i).getCname() + "</li>";
			}
			html += "</ul>";
		}
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
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

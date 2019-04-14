package com.connect.job.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connect.job.common.AjaxPageBarFactory;
import com.connect.job.common.PageBarFactory;
import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.CompanyReviewLike;
import com.connect.job.model.vo.Member;
import com.connect.job.service.ReviewService;

@Controller
public class CompanyReviewController {
	
	private Logger logger = LoggerFactory.getLogger(CompanyReviewController.class);
	
	@Autowired
	private ReviewService service;
	
	// 최근 리뷰
	@RequestMapping("review/reviewLatest.do")
	@ResponseBody
	public String reviewAll(HttpServletRequest request) throws UnsupportedEncodingException {
		String html = "";
		
		List<CompanyReview> list = service.reviewLatest();
		
		html += "<ul>";
		if(list.size()>5) {
			for(int i=0; i<5; i++) {
				html += "<li class=\"wow fadeInUp\"  data-wow-delay=\"0.1s\" onclick=\"location.href='" + request.getContextPath() + "/company/companyView.do?no=" + list.get(i).getReviewCompany() + "'\">·　";
				if(list.get(i).getReviewShort().length()>15) {
					html += list.get(i).getReviewShort().substring(0, 15) + "</li>";
				} else {
					html += list.get(i).getReviewShort() + "</li>";
				}
			}
		} else {
			html += "<li>등록된 리뷰가 없습니다</li>";
		}
		html += "</ul>";
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 리뷰리스트
	@RequestMapping("review/review.do")
	public String reviewList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, CompanyReview review, Model model) {
		
		int numPerPage = 5;
		List<CompanyReview> list = service.reviewAll(cPage, numPerPage);
		int total = service.reviewCountAll();
		
		String pageBar =  PageBarFactory.getPageBar(total, cPage, numPerPage);
		
		model.addAttribute("review", list);
		model.addAttribute("pageBar", pageBar);
		return "review/reviewList";
	}
	
	// 리뷰리스트
		@RequestMapping("review/reviewListAjax.do")
		@ResponseBody
		public String reviewListAjax(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, String job, HttpServletRequest request) throws UnsupportedEncodingException {
			
			String[] jobs = job.split(",");
			
			System.out.println("뭘 검색하려고하니? : " + job);
			
			CompanyReview review = new CompanyReview();
			review.setReviewJobs(jobs);
			
			int numPerPage = 5;
			List<CompanyReview> list = service.reviewAjaxAll(cPage, numPerPage, review);
			int total = service.reviewCountAjaxAll(review);
			
			String pageBar =  AjaxPageBarFactory.getPageBar(total, cPage, numPerPage);
			
			String html = "";
			
			if(!list.isEmpty()) {
				for(int i=0;i<list.size();i++) {
					html += "<div class=\"review-item\" onclick=\"location.href='" + request.getContextPath() + "/company/companyView.do?no=" + list.get(i).getReviewCompany() + "'\">";
					html += "<div class=\"cate\">" + list.get(i).getcName() + "<br>(" + list.get(i).getReviewJob() + ")</div>";
					html += "<div class=\"content\">";
					html += "<div class=\"content-title\">";
					html += list.get(i).getReviewShort().substring(0, 30) + "　|　" + list.get(i).getReviewIsCurrent();
					html += "</div>";
					
					html += "<div class=\"content-content\">";
					if(list.get(i).getReviewMerit().length()>100) {
						html += list.get(i).getReviewMerit().substring(0, 100) + "　... 더 보기";
					} else {
						html += list.get(i).getReviewMerit();
					}
					html += "</div>";
					
	                html += "</div>";
	                
	                html += "<div class=\"item-right\"><span id=\"stars\">";
	                if(list.get(i).getReviewTotalScore()==1) {
	                	html += "<i class='fa fa-star fa-fw'></i>";
	                } else if(list.get(i).getReviewTotalScore()==2) {
	                	html += "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>";
	                } else if(list.get(i).getReviewTotalScore()==3) {
	                	html += "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>";
	                } else if(list.get(i).getReviewTotalScore()==4) {
	                	html += "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>";
	                } else if(list.get(i).getReviewTotalScore()==5) {
	                	html += "<i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i><i class='fa fa-star fa-fw'></i>";
	                }
	                html += "</span><Br>";
	                
	                SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd");
	                String regDate = new_format.format(list.get(i).getReviewDate());
	                
	                html += regDate + "<br>";
	                html += list.get(i).getReviewLike();
	                
	                html += "</div>";
	                html += "</div>";
				}
				
				html += "<div id=\"pageBar\">" + pageBar + "</div>";
						
				
			} else {
				html += "<div class=\"review-item\"> 작성리뷰가 없습니다.</div>";
			}
			
			
            String result = URLEncoder.encode(html, "UTF-8");
			return result;
		}
	
	
	// 기업리뷰 (Ajax)
	@RequestMapping("review/reviewList.do")
	@ResponseBody
	public String reviewList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, CompanyReview review) throws UnsupportedEncodingException {
		CompanyReview cr = new CompanyReview();
		cr.setReviewCompany(review.getReviewCompany());
		
		int numPerPage = 6;
		List<CompanyReview> list = service.reviewList(cr, cPage, numPerPage);
		int total = service.reviewCount(cr);
		
		String pageBar =  AjaxPageBarFactory.getPageBar(total, cPage, numPerPage);
		
		String html = "";
		
		html += "<div class=\"review-btns\">";
		html += "<div class=\"left\">";
		html += "<button onclick=\"fn_refresh()\"><i class=\"fas fa-redo-alt\"></i>　목록 새로고침</button></div>";
		html += "<div class=\"right\">";
		html += "<button class=\"write\" onclick=\"fn_review()\">기업리뷰 작성하기</button></div>";
		html += "</div>";
        
		html += "<div class=\"review-top\">";
		html += "<div class=\"review-table-left\">";
		
		
		if(list.size()==0) {
			html += "작성된 리뷰가 없습니다";
		} else {
			for(int i=0; i<list.size(); i++) {
				html += "<div class=\"review-item\" onclick=\"fn_reviewContent(this," + list.get(i).getReviewNo() + ")\">";
				html += "<div class=\"item-title\"><i class=\"far fa-edit\"></i>　";
				if(list.get(i).getReviewShort().length()>20) {
					html += list.get(i).getReviewShort().substring(0, 20) + "</div>";
				} else {
					html += list.get(i).getReviewShort() + "</div>";
				}
				
				/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
				String reviewDate = sdf.format(list.get(i).getReviewDate());*/
				
	            html += "<div class=\"item-content\">" + list.get(i).getReviewIsCurrent() + "　";
	            switch(list.get(i).getReviewTotalScore()) {
	            	case 1 : html += "★☆☆☆☆"; break;
	            	case 2 : html += "★★☆☆☆"; break;
	            	case 3 : html += "★★★☆☆"; break;
	            	case 4 : html += "★★★★☆"; break;
	            	case 5 : html += "★★★★★"; break;
	            }
	            html += "　"  + "　<i class=\"far fa-thumbs-up\"></i>&nbsp;" + list.get(i).getReviewLike() + "</div>";
	            html += "</div>";
			}
		}
		
		
		html += "</div>";
		html += "<div class=\"review-table-right\">";
		html += "좌측 리뷰를 클릭해주세요";
        html += "</div>";
        html += "</div>";
        
        html += "<div class=\"review-bottom\">";
        html += pageBar;
        html += "</div>";
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 리뷰 Select One (Ajax)
	@RequestMapping("review/reviewOne.do")
	@ResponseBody
	public String reviewOne(HttpSession session, int reviewNo) throws UnsupportedEncodingException {
		String html = "";
		
		CompanyReview review = service.reviewOne(reviewNo);
		
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String reviewDate = sdf.format(review.getReviewDate());*/
		
		html += "<div class=\"review-detail-top\">";
		switch(review.getReviewTotalScore()) {
	    	case 1 : html += "★☆☆☆☆"; break;
	    	case 2 : html += "★★☆☆☆"; break;
	    	case 3 : html += "★★★☆☆"; break;
	    	case 4 : html += "★★★★☆"; break;
	    	case 5 : html += "★★★★★"; break;
		}
		html += "　" + review.getReviewJob() + "　" + review.getReviewIsCurrent() + "　" + review.getReviewLocation() + "　";
		html += "</div>";
		
		html += "<div class=\"review-datail-title\">";
		html += review.getReviewShort();
		
		Member m = (Member) session.getAttribute("loginMember");
		if(m!=null) {
			if(m.getP_id().equals(review.getReviewMember())) {
				html += "　　<br><button onclick='fn_update(" + review.getReviewNo() + ")'>수정</button>　<button onclick='fn_delete(" + review.getReviewNo() +  ")'>삭제</button>";
			}
		}
		
		html += "</div>";

		html += "<div class=\"review-detail-content\">";
		
		html += "<h4>기업의 장점</h4>";
		html += review.getReviewMerit();
		
		html += "<h4>기업의 단점</h4>";
		html += review.getReviewDisMerit();
		
		html += "<h4>경영진에 바라는 점</h4>";
		html += review.getReviewRequest();

		html += "</div>";

		html += "<div class=\"review-detail-score\">";
		html += "승진 기회 및 가능성 (" + review.getReviewGrade01() + "/5)<div class=\"line\" style=\"width:" + review.getReviewGrade01() + "0%;\" ></div><br>";
		html += "복지 및 급여 (" + review.getReviewGrade02() + "/5)<div class=\"line1\" style=\"width:" + review.getReviewGrade02() + "0%;\" ></div><br>";
		html += "업무와 삶의 균형 (" + review.getReviewGrade03() + "/5)<div class=\"line2\" style=\"width:" + review.getReviewGrade03() + "0%;\" ></div><br>";
		html += "사내문화 (" + review.getReviewGrade04() + "/5)<div class=\"line3\" style=\"width:" + review.getReviewGrade04() + "0%;\" ></div><br>";
		html += "경영진 (" + review.getReviewGrade05() + "/5)<div class=\"line4\" style=\"width:" + review.getReviewGrade05() + "0%;\" ></div>";
		html += "</div>";
		
		html += "<div class=\"review-like\">";
		html += "리뷰가 도움이 되셨나요?　　　<button onclick='fn_like(" + review.getReviewNo() + ")'><i class=\"far fa-thumbs-up\"></i>";
		
		List<CompanyReviewLike> rm = service.reviewLikeAll(review.getReviewNo());

		for(int i=0; i<rm.size(); i++) {
			if(m!=null) {
				if(m.getP_id().equals(rm.get(i).getLikeMember())) {
					html += "좋아요 취소</button>";
				} 
			}
		}
		
		html += "</div>";

		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 리뷰 수정
	@RequestMapping("review/reviewUpdate.do")
	@ResponseBody
	public String reviewUpdate(HttpServletRequest re, CompanyReview r) throws UnsupportedEncodingException {
		String html = "";
		CompanyReview review = service.reviewOne(r.getReviewNo());
		
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String reviewDate = sdf.format(review.getReviewDate());*/
		
		html += "<form id='updateFrm' method='POST'>";
		html += "<input type=\"hidden\" name=\"reviewNo\" value='" + review.getReviewNo() + "'/>";
		html += "<h4>기업 총 평점</h4>";
		html += "<div class=\"review-detail-top\">";
		html += "<select name=\"reviewTotalScore\" value=\"" + review.getReviewTotalScore() + "\">";
		html += "<option>평점</option>";
		if(review.getReviewTotalScore()==1) {
			html += "<option value='1' selected>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewTotalScore()==2) {
			html += "<option value='1'>★</option>";
			html += "<option value='2' selected>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewTotalScore()==3) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3' selected>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewTotalScore()==4) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4' selected>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewTotalScore()==5) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5' selected>★★★★★</option>";
		} 
		html += "</select>";
		html += "</div>";
		
		html += "<div class=\"review-datail-title\">";
		html += "<input type=\"text\" name=\"reviewShort\" value=\"" + review.getReviewShort() + "\"/>";
		html += "</div>";

		html += "<div class=\"review-detail-content\">";
		
		html += "<h4>기업의 장점</h4>";
		html += "<textarea name=\"reviewMerit\">" + review.getReviewMerit() + "</textarea>";
		
		html += "<h4>기업의 단점</h4>";
		html += "<textarea name=\"reviewDisMerit\">" + review.getReviewDisMerit() + "</textarea>";
		
		html += "<h4>경영진에 바라는 점</h4>";
		html += "<textarea name=\"reviewRequest\">" + review.getReviewRequest() + "</textarea>";

		html += "</div>";

		html += "<div class=\"review-detail-score\">";
		html += "승진 기회 및 가능성";
		html += "<select id=\"reviewGrade01\" name=\"reviewGrade01\">";
		html += "<option>평점</option>";
		if(review.getReviewGrade01()==1) {
			html += "<option value='1' selected>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade01()==2) {
			html += "<option value='1'>★</option>";
			html += "<option value='2' selected>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade01()==3) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3' selected>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade01()==4) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4' selected>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade01()==5) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5' selected>★★★★★</option>";
		} 
		html += "</select><br>";
		
		html += "복지 및 급여";
		html += "<select id=\"reviewGrade02\" name=\"reviewGrade02\">";
		html += "<option>평점</option>";
		if(review.getReviewGrade02()==1) {
			html += "<option value='1' selected>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade02()==2) {
			html += "<option value='1'>★</option>";
			html += "<option value='2' selected>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade02()==3) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3' selected>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade02()==4) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4' selected>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade02()==5) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5' selected>★★★★★</option>";
		} 
		html += "</select><br>";
		
		html += "업무와 삶의 균형";
		html += "<select id=\"reviewGrade03\" name=\"reviewGrade03\">";
		html += "<option>평점</option>";
		if(review.getReviewGrade03()==1) {
			html += "<option value='1' selected>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade03()==2) {
			html += "<option value='1'>★</option>";
			html += "<option value='2' selected>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade03()==3) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3' selected>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade03()==4) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4' selected>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade03()==5) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5' selected>★★★★★</option>";
		} 
		html += "</select><br>";
		
		html += "사내문화";
		html += "<select id=\"reviewGrade04\" name=\"reviewGrade04\">";
		html += "<option>평점</option>";
		if(review.getReviewGrade04()==1) {
			html += "<option value='1' selected>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade04()==2) {
			html += "<option value='1'>★</option>";
			html += "<option value='2' selected>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade04()==3) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3' selected>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade04()==4) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4' selected>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade04()==5) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5' selected>★★★★★</option>";
		} 
		html += "</select><br>";
		
		html += "경영진";
		html += "<select id=\"reviewGrade05\" name=\"reviewGrade05\">";
		html += "<option>평점</option>";
		if(review.getReviewGrade05()==1) {
			html += "<option value='1' selected>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade05()==2) {
			html += "<option value='1'>★</option>";
			html += "<option value='2' selected>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade05()==3) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3' selected>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade05()==4) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4' selected>★★★★</option>";
			html += "<option value='5'>★★★★★</option>";
		} else if  (review.getReviewGrade05()==5) {
			html += "<option value='1'>★</option>";
			html += "<option value='2'>★★</option>";
			html += "<option value='3'>★★★</option>";
			html += "<option value='4'>★★★★</option>";
			html += "<option value='5' selected>★★★★★</option>";
		} 
		html += "</select>";
		
		html += "</div><br><Br>";
		
		html += "<div class=\"review-update\">";
		html += "<button type='button' onclick='fn_updateEnd()'>리뷰 수정</button>";
		html += "</div>";
		html += "</form>";
		
		String result = URLEncoder.encode(html, "UTF-8");
		return result;
	}
	
	// 리뷰 좋아요
	@RequestMapping("review/reviewLike.do")
	@ResponseBody
	public String reviewLike(String member, int reviewNo, int companyNo) throws UnsupportedEncodingException {
		CompanyReviewLike like = new CompanyReviewLike();
		like.setLikeMember(member);
		like.setLikeReview(reviewNo);
		like.setLikeCompany(companyNo);
		
		String message = "";
		
		int result = service.reviewLike(like);
		
		if(result>0) {
			message = "좋아요";
		} else {
			message = "좋아요 취소";
		}
		
		String msg = URLEncoder.encode(message, "UTF-8");
		return msg;
	}
	
	// 리뷰작성
	@RequestMapping("review/reviewWrite.do")
	public String reviewWrite(CompanyReview review, Model model) {
		int result = service.reviewWrite(review);
		
		String msg = "";
		String loc = "/company/companyView.do?no=" + review.getReviewCompany();
		
		if(result>0) {
			msg = "리뷰작성이 완료되었습니다.";
		} else {
			msg = "리뷰작성 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";
	}
	
	// 리뷰업데이트
		@RequestMapping("review/reviewUpdateEnd.do")
		@ResponseBody
		public String reviewUpdateEnd(CompanyReview r, HttpSession session, Model model) throws UnsupportedEncodingException {
			int result = service.reviewUpdate(r);
			
			String html = "";
			
			CompanyReview review = service.reviewOne(r.getReviewNo());
			
			/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			String reviewDate = sdf.format(review.getReviewDate());*/
			
			html += "<div class=\"review-detail-top\">";
			switch(review.getReviewTotalScore()) {
		    	case 1 : html += "★☆☆☆☆"; break;
		    	case 2 : html += "★★☆☆☆"; break;
		    	case 3 : html += "★★★☆☆"; break;
		    	case 4 : html += "★★★★☆"; break;
		    	case 5 : html += "★★★★★"; break;
			}
			html += "　" + review.getReviewJob() + "　" + review.getReviewIsCurrent() + "　" + review.getReviewLocation() + "　"/* + reviewDate*/;
			html += "</div>";
			
			html += "<div class=\"review-datail-title\">";
			html += review.getReviewShort();
			
			Member m = (Member) session.getAttribute("loginMember");
			if(m!=null) {
				if(m.getP_id().equals(review.getReviewMember())) {
					html += "　　<br><button onclick='fn_update(" + review.getReviewNo() + ")'>수정</button>　<button onclick='fn_delete(" + review.getReviewNo() +  ")'>삭제</button>";
				}
			}
			
			html += "</div>";

			html += "<div class=\"review-detail-content\">";
			
			html += "<h4>기업의 장점</h4>";
			html += review.getReviewMerit();
			
			html += "<h4>기업의 단점</h4>";
			html += review.getReviewDisMerit();
			
			html += "<h4>경영진에 바라는 점</h4>";
			html += review.getReviewRequest();

			html += "</div>";

			html += "<div class=\"review-detail-score\">";
			html += "승진 기회 및 가능성<div class=\"line\" style=\"width:" + review.getReviewGrade01() + "0%;\" ></div><br>";
			html += "복지 및 급여<div class=\"line1\" style=\"width:" + review.getReviewGrade02() + "0%;\" ></div><br>";
			html += "업무와 삶의 균형<div class=\"line2\" style=\"width:" + review.getReviewGrade03() + "0%;\" ></div><br>";
			html += "사내문화<div class=\"line3\" style=\"width:" + review.getReviewGrade04() + "0%;\" ></div><br>";
			html += "경영진<div class=\"line4\" style=\"width:" + review.getReviewGrade05() + "0%;\" ></div>";
			html += "</div>";
			
			html += "<div class=\"review-like\">";
			html += "리뷰가 도움이 되셨나요?　　　<button class='btn-like' onclick='fn_like(" + review.getReviewNo() + ")'><i class=\"far fa-thumbs-up\"></i>도움됐어요</button>";
			html += "</div>";

			String re = URLEncoder.encode(html, "UTF-8");
			return re;
		}
		
		@RequestMapping("review/reviewDelete.do")
		public String reviewDelete(Model model, int num) {
			String msg = "";
			String loc = "";
			
			int result = service.reviewDelete(num);
			
			if(result>0) {
				msg = "정상적으로 삭제되었습니다";
			} else {
				msg = "삭제실패";
			}
			
			return "common/msg";
		}

}

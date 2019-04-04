package com.connect.job.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private ReviewService service;
	
	// 리뷰리스트
	@RequestMapping("review/review.do")
	public String reviewList(@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, CompanyReview review, Model model) {
		
		int numPerPage = 10;
		List<CompanyReview> list = service.reviewAll(cPage, numPerPage);
		int total = service.reviewCountAll();
		
		String pageBar =  PageBarFactory.getPageBar(total, cPage, numPerPage);
		
		model.addAttribute("review", list);
		model.addAttribute("pageBar", pageBar);
		return "review/reviewList";
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
        
		html += "<div class=\"review-top\">";
		html += "<div class=\"review-table-left\">";
		
		
		if(list.size()==0) {
			html += "작성된 리뷰가 없습니다";
		} else {
			for(int i=0; i<list.size(); i++) {
				html += "<div class=\"review-item\" onclick=\"fn_reviewContent(this," + list.get(i).getReviewNo() + ")\">";
				html += "<div class=\"item-title\"><i class=\"far fa-edit\"></i>　" + list.get(i).getReviewShort() + "</div>";
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
				String reviewDate = sdf.format(list.get(i).getReviewDate());
				
	            html += "<div class=\"item-content\">" + list.get(i).getReviewIsCurrent() + "　";
	            switch(list.get(i).getReviewTotalScore()) {
	            	case 1 : html += "★☆☆☆☆"; break;
	            	case 2 : html += "★★☆☆☆"; break;
	            	case 3 : html += "★★★☆☆"; break;
	            	case 4 : html += "★★★★☆"; break;
	            	case 5 : html += "★★★★★"; break;
	            }
	            html += "　" + reviewDate + "　<i class=\"far fa-thumbs-up\"></i>&nbsp;" + list.get(i).getReviewLike() + "</div>";
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String reviewDate = sdf.format(review.getReviewDate());
		
		html += "<div class=\"review-detail-top\">";
		switch(review.getReviewTotalScore()) {
	    	case 1 : html += "★☆☆☆☆"; break;
	    	case 2 : html += "★★☆☆☆"; break;
	    	case 3 : html += "★★★☆☆"; break;
	    	case 4 : html += "★★★★☆"; break;
	    	case 5 : html += "★★★★★"; break;
		}
		html += "　" + review.getReviewJob() + "　" + review.getReviewIsCurrent() + "　" + review.getReviewLocation() + "　" + reviewDate;
		html += "</div>";
		
		html += "<div class=\"review-datail-title\">";
		html += review.getReviewShort();
		
		Member m = (Member) session.getAttribute("loginMember");
		if(m!=null) {
			if(m.getpId().equals(review.getReviewMember())) {
				html += "　　<button onclick='fn_update()'>수정</button>　<button onclick='fn_delete()'>삭제</button>";
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
		html += "리뷰가 도움이 되셨나요?　　　<button onclick='fn_like(" + review.getReviewNo() + ")'>도움됐어요</button>";
		html += "</div>";
		/*
		 * html += "<script>"; html += "function fn_reviewLike(num) {"; html +=
		 * "if(${loginMember}!=null}) {"; html += "$.ajax({"; html +=
		 * "url: '${path}/review/reviewLike.do?member=' + ${loginMember.pId} + \"&reviewNo=\" + num + \"&companyNo=\" + ${company.companyNo},"
		 * ; html += "success: function(data) {"; html +=
		 * "var resultSet = decodeURIComponent(data);"; html += "alert(resultSet);}});";
		 * html += "} else {"; html +=
		 * "if (confirm('좋아요는 회원만 가능합니다\\n로그인 페이지로 이동하시겠습니까?')) {"; html +=
		 * "window.location.href = \"${path}/member/login.do\";"; html += "} else {";
		 * html += "return;"; html += "}}}"; html += "</script>";
		 */

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

}

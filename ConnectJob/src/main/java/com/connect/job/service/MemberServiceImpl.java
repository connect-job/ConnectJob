package com.connect.job.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.connect.job.common.MailHandler;
import com.connect.job.common.TempKey;
import com.connect.job.dao.MemberDao;
import com.connect.job.model.vo.CompanyReview;
import com.connect.job.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberDao dao;
	
	//회원가입&회원가입 인증메일 전송(트랜잭션처리)
	@Transactional
	@Override
	public void insertMember(Member m, StringBuffer sb) throws Exception {	
	
	    dao.insertMember(m);	        
	    
	    //메일 전송
	    MailHandler sendMail = new MailHandler(mailSender);
	    sendMail.setSubject("[ConnectJob] 이메일 인증");
	    sendMail.setText(new StringBuffer().append("<h1>[ConnectJob] 메일인증</h1>")
	                	.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
	                	.append("<a href='http://localhost:9090/job/member/emailForm?p_id=").append(m.getP_id())
	                	.append("' target='_blank'>이메일 인증 확인</a>").toString());
	    sendMail.setFrom("jiany811@gmail.com", "[ConnectJob]");
	    sendMail.setTo(m.getP_id());
	    sendMail.send();  

	}
	   
	//메일 인증상태 업데이트
	@Override
	public int updateStatus(String p_id) {
		return dao.updateStatus(p_id);
	}
		
	
	@Override
	public int insertMemberKakao(Member m) {
		
		return dao.insertMemberKako(m);
	}
	
	
	@Override
	public Member selectOne(Member m) {
		
		return dao.selectOne(m);
	}

	@Override
	public Member findId(Member m) {
		
		return dao.findId(m);
	}

	@Override
	public int deleteMember(Member m) {
		
		return dao.deleteMember(m);
	}

	@Override
	public int updateMember(Member m) {
		
		return dao.updateMember(m);
	}

	@Override
	public int updatePw(Member m) {
		
		return dao.updatePw(m);
	}

	@Override
	public List<Member> selectList() {
	
		return dao.selectList();
	}

	@Override
	public Member selectOneKakao(Member m) {
		return dao.selectOneKakao(m);
	}


	@Override
	public int emailConfirm(Member m) {
		
		return dao.emailConfirm(m);
	}

	@Override
	public int selectCount(String p_id) {
		
		return dao.selectCount(p_id);
	}

	@Override
	public Member findPw(Member m) {
		
		return dao.findPw(m);
	}

	@Override
	public List<CompanyReview> selectReviewList(CompanyReview review) {
		// TODO Auto-generated method stub
		return dao.selectReviewList(review);
	}

	@Override
	public int deleteReview(int review_no) {
		// TODO Auto-generated method stub
		return dao.deleteReview(review_no);
	}

	
	
	
	

	
}

package com.connect.job.service;

import javax.inject.Inject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.connect.job.common.MailHandler;
import com.connect.job.common.TempKey;
import com.connect.job.dao.MemberDao;
import com.connect.job.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private JavaMailSender sender;
	
	@Autowired
	private MemberDao dao;
	
	@Transactional
	@Override
	public int insertMember(Member m) throws Exception {
		
		
		
		/*String authkey=new TempKey().getKey(10, false);
		dao.createAuthKey(m.getpId(), authkey);*/		
		
		//이메일 발송
		MailHandler sendMail=new MailHandler(sender);
		
		sendMail.setSubject("[ConnectJob] 이메일 인증"); //제목
		
		sendMail.setText(new StringBuffer().append("[ConnectJob]이메일 인증")
				.append("<a href='http://localhost/job/member/emailConfirm?pId='")
				.append(m.getpId()).append("' target='_blank'> ConnectJob 이메일 인증 </a>").toString()); //내용
		
		sendMail.setFrom("jiany811@gmail.com", "ConnectJob 관리자"); //보내는 사람
		
		sendMail.setTo(m.getpId()); //받는 사람
		
		sendMail.send();
		
		return dao.insertMember(m);
	}
	

	@Override
	public Member selectOne(Member m) {
		
		return dao.selectOne(m);
	}


	@Override
	public void userAuth(String pId) {
		
		dao.userAuth(pId);
	}
	
	
	
	
}

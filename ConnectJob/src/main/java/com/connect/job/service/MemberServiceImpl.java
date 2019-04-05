package com.connect.job.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.connect.job.common.MailHandler;

import com.connect.job.dao.MemberDao;
import com.connect.job.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{	
	
	/*@Inject
	private JavaMailSender sender;*/
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public int insertMember(Member m) throws Exception {	
		
		/*//이메일 발송
		MailHandler sendMail=new MailHandler(sender);				
		sendMail.setSubject("[ConnectJob] 이메일 인증"); //제목				
		sendMail.setText(new StringBuffer()
				.append("[ConnectJob]이메일 인증</br>")
				.append("<a href='http://localhost:9090/job/member/emailConfirm?p_id='")
				.append(m.getP_id())
				.append("' target='_blank'>이메일 인증</a>")
				.toString()); //내용				
		sendMail.setFrom("jiany811@gmail.com", "ConnectJob"); //보내는 사람				
		sendMail.setTo(m.getP_id()); //받는 사람				
		sendMail.send();*/
		
		return dao.insertMember(m);
	}
	
	

	@Override
	public int insertMemberKakao(Member m) {
		
		return dao.insertMemberKakao(m);
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
		// TODO Auto-generated method stub
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
	public int checkId(String p_id) {
		// TODO Auto-generated method stub
		return dao.selectCount(p_id);
	}
	
	

	
}

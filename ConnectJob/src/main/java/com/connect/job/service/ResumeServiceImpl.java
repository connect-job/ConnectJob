package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.connect.job.common.exception.ResumeException;
import com.connect.job.dao.ResumeDao;
import com.connect.job.model.vo.Career;
import com.connect.job.model.vo.FinalEdu;
import com.connect.job.model.vo.FinalEduUniv;
import com.connect.job.model.vo.Resume;

@Service
public class ResumeServiceImpl implements ResumeService {
	@Autowired
	private ResumeDao dao;
	
	@Override
	@Transactional
	public int insertResume(Resume r,FinalEdu fe, Career c) {
		int result=0;
		try {
			result=dao.insertResume(r);
			if(result==0) {throw new ResumeException("이력서 등록에 문제가 발생하였습니다.");}
			fe.setResumeNo(r.getResumeNo());
			result=dao.insertFinalEdu(fe);
			if(result==0) {throw new ResumeException("최종학력정보 등록에 문제가 발생하였습니다.");}
			c.setResumeNo(r.getResumeNo());
			if(c.getCareerCName()!=null) {
				result=dao.insertCareer(c);
				if(result==0) {throw new ResumeException("경력정보 등록에 문제가 발생하였습니다.");}
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}

	@Override
	public int insertResume(Resume r, List<FinalEduUniv> univList, Career c) {
		System.out.println("최종학력 대학");
		int result=0;
		try {
			result=dao.insertResume(r);
			if(result==0) {throw new ResumeException("이력서 등록에 문제가 발생하였습니다.");}
			for(int i=0;i<univList.size();i++) {
				univList.get(i).setResumeNo(r.getResumeNo());
				result=dao.insertFinalEduUniv(univList.get(i));
			}
			if(result==0) {throw new ResumeException("최종학력정보 등록에 문제가 발생하였습니다.");}
			c.setResumeNo(r.getResumeNo());
			if(c.getCareerCName()!=null) {
				result=dao.insertCareer(c);
				if(result==0) {throw new ResumeException("경력정보 등록에 문제가 발생하였습니다.");}
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}
	
	

	@Override
	public List<FinalEduUniv> selectedFinalEduUnivList(int resumeNo) {
		return dao.selectedFinalEduUnivList(resumeNo);
	}

	@Override
	public int selectCntUniv(int resumeNo) {
		return dao.selectCntUniv(resumeNo);
	}

	@Override
	public List<Resume> selectedResumeList(String pId) {
		return dao.selectedResumeList(pId);
	}

	@Override
	public Resume selectedResume(int resumeNo) {
		return dao.selectedResume(resumeNo);
	}

	@Override
	public Career selectedCareer(int resumeNo) {
		return dao.selectedCareer(resumeNo);
	}

	@Override
	public FinalEdu selectedFinalEdu(int resumeNo) {
		return dao.selectedFinalEdu(resumeNo);
	}

	@Override
	public FinalEduUniv selectedFinalEduUniv(int resumeNo) {
		return dao.selectedFinalEduUniv(resumeNo);
	}

	@Override
	public int deleteResume(int resumeNo) {
		return dao.deleteResume(resumeNo);
	}
	
	
}

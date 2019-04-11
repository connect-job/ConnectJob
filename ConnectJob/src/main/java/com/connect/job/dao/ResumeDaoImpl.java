package com.connect.job.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.connect.job.model.vo.Career;
import com.connect.job.model.vo.FinalEdu;
import com.connect.job.model.vo.FinalEduUniv;
import com.connect.job.model.vo.ProfileImg;
import com.connect.job.model.vo.Resume;

@Repository
public class ResumeDaoImpl implements ResumeDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertResume(Resume r) {
		return session.insert("resume.insertResume",r);
	}

	@Override
	public int insertFinalEdu(FinalEdu fe) {
		return session.insert("resume.insertFinalEdu",fe);
	}
	
	@Override
	public int insertFinalEduUniv(FinalEduUniv univ) {
		return session.insert("resume.insertFinalEduUniv",univ);
	}
	@Override
	public int insertCareer(Career c) {
		return session.insert("resume.insertCareer",c);
	}
	
	@Override
	public int insertProfileImg(ProfileImg p) {
		return session.insert("resume.insertProfileImg",p);
	}
	
	
	
	@Override
	public int updateProfileImg(ProfileImg p) {
		return session.update("resume.updateProfileImg", p);
	}

	@Override
	public int updateResume(Resume r) {
		return session.update("resume.updateResume", r);
	}

	@Override
	public int updateFinalEdu(FinalEdu fe) {
		return session.update("resume.updateFinalEdu", fe);
	}

	@Override
	public int updateFinalEduUniv(FinalEduUniv univ) {
		return session.update("resume.updateFinalEduUniv", univ);
	}

	@Override
	public int updateCareer(Career c) {
		return session.update("resume.updateCareer", c);
	}

	@Override
	public ProfileImg selectedProfileImg(int resumeNo) {
		return session.selectOne("resume.selectProfileImg",resumeNo);
	}

	@Override
	public List<Resume> selectedResumeList(String pId) {
		return session.selectList("resume.selectResumeList",pId);
	}

	@Override
	public Resume selectedResume(int resumeNo) {
		return session.selectOne("resume.selectResume",resumeNo);
	}

	@Override
	public Career selectedCareer(int resumeNo) {
		return session.selectOne("resume.selectCareer",resumeNo);
	}

	@Override
	public FinalEdu selectedFinalEdu(int resumeNo) {
		return session.selectOne("resume.selectFinalEdu",resumeNo);
	}

	@Override
	public FinalEduUniv selectedFinalEduUniv(int resumeNo) {
		return session.selectOne("resume.selectFinalEduUniv",resumeNo);
	}

	@Override
	public int deleteResume(int resumeNo) {
		return session.update("resume.deleteResume", resumeNo);
	}

	@Override
	public int selectCntUniv(int resumeNo) {
		return session.selectOne("resume.selectCntUniv", resumeNo);
	}

	@Override
	public List<FinalEduUniv> selectedFinalEduUnivList(int resumeNo) {
		return session.selectList("resume.selectedFinalEduUnivList",resumeNo);
	}
	

	
	
	
}

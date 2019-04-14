package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Career;
import com.connect.job.model.vo.FinalEdu;
import com.connect.job.model.vo.FinalEduUniv;
import com.connect.job.model.vo.ProfileImg;
import com.connect.job.model.vo.Resume;

public interface ResumeDao {
	int insertProfileImg(ProfileImg p);
	int insertResume(Resume r);
	int insertFinalEdu(FinalEdu fe);
	int insertFinalEduUniv(FinalEduUniv univ);
	int insertCareer(Career c);
	int updateProfileImg(ProfileImg p);
	int updateResume(Resume r);
	int updateFinalEdu(FinalEdu fe);
	int updateFinalEduUniv(FinalEduUniv univ);
	int updateCareer(Career c);
	
	ProfileImg selectedProfileImg(int resumeNo);
	List<Resume> selectedResumeList(String userId);
	Resume selectedResume(int resumeNo);
	Career selectedCareer(int resumeNo);
	FinalEdu selectedFinalEdu(int resumeNo);
	FinalEduUniv selectedFinalEduUniv(int resumeNo);
	int deleteResume(int resumeNo);
	int selectCntUniv(int resumeNo);
	List<FinalEduUniv> selectedFinalEduUnivList(int resumeNo);
}

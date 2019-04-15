package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Career;
import com.connect.job.model.vo.FinalEdu;
import com.connect.job.model.vo.FinalEduUniv;
import com.connect.job.model.vo.ProfileImg;
import com.connect.job.model.vo.Resume;

public interface ResumeService {
	int insertResume(Resume r,FinalEdu fe, Career c,ProfileImg p);
	int insertResume(Resume r,List<FinalEduUniv> univList, Career c,ProfileImg p);
	int updateResume(Resume r,FinalEdu fe, Career c,ProfileImg p);
	int updateResume(Resume r,List<FinalEduUniv> univList, Career c,ProfileImg p);
	
	int selectedResumeCnt(String pId);
	List<Resume> selectedResumeList(String pId);
	
	ProfileImg selectedProfileImg(int resumeNo);
	Resume selectedResume(int resumeNo);
	Career selectedCareer(int resumeNo);
	FinalEdu selectedFinalEdu(int resumeNo);
	FinalEduUniv selectedFinalEduUniv(int resumeNo);
	int deleteResume(int resumeNo);
	int selectCntUniv(int resumeNo);
	List<FinalEduUniv> selectedFinalEduUnivList(int resumeNo);
}

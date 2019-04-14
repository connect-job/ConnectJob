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
import com.connect.job.model.vo.ProfileImg;
import com.connect.job.model.vo.Resume;

@Service
public class ResumeServiceImpl implements ResumeService {
	@Autowired
	private ResumeDao dao;
	
	@Override
	@Transactional
	public int insertResume(Resume r,FinalEdu fe, Career c, ProfileImg p) {
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
			if(p!=null) {
				p.setResumeNo(r.getResumeNo());
				result=dao.insertProfileImg(p);
				if(result==0) {throw new ResumeException("이미지 등록에 문제가 발생하였습니다.");}
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}

	@Override
	@Transactional
	public int insertResume(Resume r, List<FinalEduUniv> univList, Career c,ProfileImg p) {
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
			if(p!=null) {
				p.setResumeNo(r.getResumeNo());
				result=dao.insertProfileImg(p);
				if(result==0) {throw new ResumeException("이미지 등록에 문제가 발생하였습니다.");}
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}
	
	
	
	@Override
	@Transactional
	public int updateResume(Resume r, FinalEdu fe, Career c, ProfileImg p) {
		int result=0;
		try {
			
			result=dao.updateResume(r);
			if(result==0) {throw new ResumeException("이력서 등록에 문제가 발생하였습니다.");}
			fe.setResumeNo(r.getResumeNo());
			if(fe.getFinalEduNo()==0) {
				result=dao.insertFinalEdu(fe);
			}else {
				result=dao.updateFinalEdu(fe);
			}
			if(result==0) {throw new ResumeException("최종학력정보 등록에 문제가 발생하였습니다.");}
			c.setResumeNo(r.getResumeNo());
			if(c.getCareerCName()!=null) {
				result=dao.updateCareer(c);
				if(result==0) {throw new ResumeException("경력정보 등록에 문제가 발생하였습니다.");}
			}
			if(p!=null) {
				p.setResumeNo(r.getResumeNo());
				result=dao.updateProfileImg(p);
				if(result==0) {throw new ResumeException("이미지 등록에 문제가 발생하였습니다.");}
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}

	@Override
	@Transactional
	public int updateResume(Resume r, List<FinalEduUniv> univList, Career c, ProfileImg p) {
		int result=0;
		int univCnt=dao.selectCntUniv(r.getResumeNo());
		try {
			result=dao.updateResume(r);
			if(result==0) {throw new ResumeException("이력서 수정에 문제가 발생하였습니다.");}
			
			for(int i=0;i<univList.size();i++) {
				univList.get(i).setResumeNo(r.getResumeNo());
				if(univCnt==0) {
					result=dao.insertFinalEduUniv(univList.get(i));
				}else {
					if(univList.get(i).getFinalEduUnivNo()!=0) {
						result=dao.updateFinalEduUniv(univList.get(i));
					}
				}
			}
			if(result==0) {throw new ResumeException("최종학력정보 수정에 문제가 발생하였습니다.");}
			c.setResumeNo(r.getResumeNo());
			if(c.getCareerCName()!=null) {
				if(c.getCareerNo()==0) {
					result=dao.insertCareer(c);
				}else {
					result=dao.updateCareer(c);
				}
				if(result==0) {throw new ResumeException("경력정보 수정에 문제가 발생하였습니다.");}
			}
			if(!p.getOriginalFileName().equals("")) {
				p.setResumeNo(r.getResumeNo());
				result=dao.deleteProfileImg(r.getResumeNo());
				result=dao.updateProfileImg(p);
				if(result==0) {throw new ResumeException("이미지 수정에 문제가 발생하였습니다.");}
			}
		}catch(Exception e) {e.printStackTrace();}
		
		return result;
	}

	@Override
	public ProfileImg selectedProfileImg(int resumeNo) {
		return dao.selectedProfileImg(resumeNo);
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

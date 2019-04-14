package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Scomment;
import com.connect.job.model.vo.Senier;

public interface SenierService {

	int insertSenier(Senier s);
	List<Senier> senierList(int cPage, int numPerPage);
	int selectCount();
	int insertComWrite(Scomment sco);
	List<Scomment> comList(Scomment sco);
	List<Scomment> selectAll(int cPage, int numPerPage, int no);
	int selectcomCount(int no);
	Senier senierOneList(int no);
	int updateSenier(Senier s);
	int deleteSenier(Senier s);
	
	int commentUpdate(Scomment sc);
	int commentDelete(Scomment sc);
	
	int selectAjaxCount(Senier s);
	List<Senier> selectAjaxAll(int cPage, int numPerPage, Senier s);


}

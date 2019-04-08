package com.connect.job.dao;

import java.util.List;

import com.connect.job.model.vo.Scomment;
import com.connect.job.model.vo.Senier;

public interface SenierDao {
	
	int insertSenier(Senier s);
	List<Senier> senierList(int cPage, int numPerPage);
	int selectCount();
	List<Senier> senierOneList(int no);
	int insertComWrite(Scomment sco);
	
	List<Scomment> comList(Scomment sco);
	List<Scomment> selectAll(int cPage, int numPerPage);
	int selectcomCount();
	
	
}
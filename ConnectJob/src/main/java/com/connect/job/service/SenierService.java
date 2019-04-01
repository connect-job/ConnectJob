package com.connect.job.service;

import java.util.List;

import com.connect.job.model.vo.Senier;

public interface SenierService {

	int insertSenier(Senier s);
	List<Senier> senierList();

}

package com.connect.job.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connect.job.common.HireNotiException;
import com.connect.job.dao.HireNotiDao;
import com.connect.job.model.vo.HireNoti;

@Service
public class HireNotiServiceImpl implements HireNotiService {

	@Autowired
	private HireNotiDao dao;

	@Override
	public int insertNoti(HireNoti h) {
		
		return dao.insertNoti(h);
	}

	
	
	/*@Override
	public int insertNoti(HireNoti h, List<HireNoti> list) {

		int result=0;
		try {
			result=dao.insertNoti(h);
			if(result==0) throw new HireNotiException();
			
			if(list.size()>0) {
				for(HireNoti a: list)
				{
					a.setHNSeq(h.getHNSeq());
					result=dao.insertNoti(h);
					if(result==0) throw new HireNotiException();
				}
			}
		}catch(Exception e) {e.printStackTrace();
		}
		return result;
	}*/

	
	
	
}

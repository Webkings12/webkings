package com.webkings.app.chief.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChiefServiceImpl implements ChiefService{
	@Autowired
	private ChiefDAO chiefDAO;
	
	@Override
	public int loginCheck(ChiefVO vo) {
		return 0;
	}

	@Override
	public int selectChiefId(String reqParam) {
		return chiefDAO.selectChiefId(reqParam);
	}

	@Override
	public int insertChief(ChiefVO vo) {
		return chiefDAO.insertChief(vo);
	}

}

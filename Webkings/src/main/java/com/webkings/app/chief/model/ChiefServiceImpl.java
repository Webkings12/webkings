package com.webkings.app.chief.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChiefServiceImpl implements ChiefService{
	@Autowired
	private ChiefDAO chiefDAO;
	
	@Override
	public int loginCheck(ChiefVO vo) {
			int result=0;
		
		String pwd =chiefDAO.loginCheck(vo);
		if(pwd==null || pwd.isEmpty()){
			result=ID_NONE;
		}else{
			if(pwd.equals(vo.getC_PWD())){
				result=LOGIN_OK;
			}else{
				result=PWD_DISAGREE; 
			}
		}
		return result;
	}

	@Override
	public int selectChiefId(String reqParam) {
		return chiefDAO.selectChiefId(reqParam);
	}

	@Override
	public int insertChief(ChiefVO vo) {
		return chiefDAO.insertChief(vo);
	}

	@Override
	public ChiefVO selectcEmail(String cEmail) {
		return chiefDAO.selectcEmail(cEmail);
	}

}

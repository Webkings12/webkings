package com.webkings.app.chief.model;

public interface ChiefDAO {
	public int loginCheck(ChiefVo vo);
	public int selectChiefId(String reqParam);
	public int insertChief(ChiefVo vo);	
}

package com.webkings.app.chief.model;

public interface ChiefDAO {
	public int loginCheck(ChiefVO vo);
	public int selectChiefId(String reqParam);
	public int insertChief(ChiefVO vo);	
}

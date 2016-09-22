package com.webkings.app.chief.model;

public interface ChiefService {
	public int loginCheck(ChiefVO vo);
	public int insertChief(ChiefVO vo);
	public int selectChiefId(String reqParam);
}

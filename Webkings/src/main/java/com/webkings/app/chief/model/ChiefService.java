package com.webkings.app.chief.model;

public interface ChiefService {
	public int loginCheck(ChiefVo vo);
	public int insertChief(ChiefVo vo);
	public int selectChiefId(String reqParam);
}

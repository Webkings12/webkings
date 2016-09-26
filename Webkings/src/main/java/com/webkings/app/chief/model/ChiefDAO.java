package com.webkings.app.chief.model;

import com.webkings.app.member.model.MemberVo;

public interface ChiefDAO {
	public String loginCheck(ChiefVO vo);
	public int selectChiefId(String reqParam);
	public int insertChief(ChiefVO vo);
	public ChiefVO selectcEmail(String cEmail);	
}

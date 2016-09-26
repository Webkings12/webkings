package com.webkings.app.chief.model;

public interface ChiefService {
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2;//비밀번호 불일치
	public static final int ID_NONE=3; //해당아이디가 없는 경우
	public static final int NO_TYPE=4; //해당타입이 아닌경우
	
	public int loginCheck(ChiefVO vo);
	public int insertChief(ChiefVO vo);
	public int selectChiefId(String reqParam);
	public ChiefVO selectcEmail(String cEmail);
}

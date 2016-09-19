package com.webkings.app.member.model;

public interface MemberService {
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2;//비밀번호 불일치
	public static final int ID_NONE=3; //해당아이디가 없는 경우
	
	public int insertMember(MemberVo vo);
	public int loginCheck(MemberVo vo);
	public MemberVo selectmEmail(String mEmail);
	public int selectmCount(String mEmail);
	public int updateMember(MemberVo memberVo);
	public int deleteMember(String mEmail);
	public int updatePwd(MemberVo vo);
	
	
	public int adminCheck(MemberVo vo);
}

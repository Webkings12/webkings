package com.webkings.app.member.model;

public interface MemberDAO {
	public int insertMember(MemberVo vo);
	public String loginCheck(MemberVo vo);
	public MemberVo selectmEmail(String mEmail);		
	public int selectmCount(String mEmail);
	public int updateMember(String mEmail);
	public int deleteMember(String mEmail);
	public int updatePwd(MemberVo vo);
	
}

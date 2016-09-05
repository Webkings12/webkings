package com.webkings.app.member.model;

public interface MemberDAO {
	public int insertMember(MemberVo vo);
	public String loginCheck(MemberVo vo);
}

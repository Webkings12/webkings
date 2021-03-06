package com.webkings.app.member.model;

import java.util.List;

import com.webkings.app.common.SearchVO;

public interface MemberService {
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int PWD_DISAGREE=2;//비밀번호 불일치
	public static final int ID_NONE=3; //해당아이디가 없는 경우
	public static final int NO_TYPE=4; //해당타입이 아닌경우
	
	public int insertMember(MemberVo vo);
	public int loginCheck(MemberVo vo);
	public MemberVo selectmEmail(String mEmail);
	public int selectmCount(String mEmail);
	public int updateMember(MemberVo memberVo);
	public int deleteMember(String mEmail);
	public int updatePwd(MemberVo vo);
	
	
	public int adminCheck(MemberVo vo);
	public List<MemberVo> selectList(SearchVO searchVo);
	public int TotalRecord(SearchVO vo);
	
	//회원 여러명 삭제
	public int deletememberList(List<MemberVo> memberDelList);
	// 회원정보 수정
	public int updateAdmin(MemberVo vo);
}

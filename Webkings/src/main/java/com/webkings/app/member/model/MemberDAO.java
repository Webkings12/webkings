package com.webkings.app.member.model;

import java.util.List;

import com.webkings.app.common.SearchVO;

public interface MemberDAO {
	public int insertMember(MemberVo vo);
	public String loginCheck(MemberVo vo);
	public MemberVo selectmEmail(String mEmail);		
	public int selectmCount(String mEmail);
	public int updateMember(MemberVo memberVo);
	public int deleteMember(String mEmail);
	public int updatePwd(MemberVo vo);
	
	/*관리자*/
	public String adminCheck(MemberVo vo);
	public List<MemberVo> selectList(SearchVO searchVo);
	public int updateAdmin(MemberVo vo);
	public int TotalRecord(SearchVO vo);
}

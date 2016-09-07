package com.webkings.app.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int insertMember(MemberVo vo) {
		return memberDAO.insertMember(vo);
	}

	@Override
	public int loginCheck(MemberVo vo) {
		int result=0;
		
		String pwd =memberDAO.loginCheck(vo);
		if(pwd==null || pwd.isEmpty()){
			result=ID_NONE;
		}else{
			if(pwd.equals(vo.getmPwd())){
				result=LOGIN_OK;
			}else{
				result=PWD_DISAGREE; 
			}
		}
		
		return result;
	}

	@Override
	public MemberVo selectmEmail(String mEmail) {
		return memberDAO.selectmEmail(mEmail);
	}

	@Override
	public int selectmCount(String mEmail) {
		return memberDAO.selectmCount(mEmail);
	}

}

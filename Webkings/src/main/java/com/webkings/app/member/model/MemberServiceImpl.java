package com.webkings.app.member.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public int adminCheck(MemberVo vo) {
		int result=0;
		
		String pwd =memberDAO.adminCheck(vo);
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

	@Override
	public int updateMember(MemberVo memberVo) {
		return memberDAO.updateMember(memberVo);
	}

	@Override
	public int deleteMember(String mEmail) {
		return memberDAO.deleteMember(mEmail);
	}

	@Override
	public int updatePwd(MemberVo vo) {
		return memberDAO.updatePwd(vo);
	}

	
	@Override
	public List<MemberVo> selectList() {
		return memberDAO.selectList();
	}
	
	@Override
	@Transactional
	public int deletememberList(List<MemberVo> memberDelList) {
		int cnt=0;
		try{
			for(MemberVo vo:memberDelList){
				String mEmail=vo.getmEmail();
				if(mEmail!=null && !mEmail.isEmpty()){
					cnt =memberDAO.deleteMember(mEmail);
				}
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}

}

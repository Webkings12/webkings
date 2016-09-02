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

}

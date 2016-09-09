package com.webkings.app.member.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis extends SqlSessionDaoSupport implements MemberDAO {

	private String namespace="com.mybatis.mapper.oracle.member";
	
	@Override
	public int insertMember(MemberVo vo) {
		return getSqlSession().insert(namespace+".insertmember", vo);
	}
	@Override
	public String loginCheck(MemberVo vo) {
		return getSqlSession().selectOne(namespace+".selectPwd", vo);
	}
	@Override
	public MemberVo selectmEmail(String mEmail) {
		return getSqlSession().selectOne(namespace+".selectmEmail", mEmail);
	}
	@Override
	public int selectmCount(String mEmail) {
		return getSqlSession().selectOne(namespace+".selectmCount", mEmail);
	}
	@Override
	public int updateMember(String mEmail) {
		return getSqlSession().update(namespace+".updateMember", mEmail);
	}
	@Override
	public int deleteMember(String mEmail) {
		return getSqlSession().delete(namespace+".deleteMember", mEmail);
	}
	@Override
	public int updatePwd(MemberVo vo) {
		return getSqlSession().update(namespace+".updatePwd",vo);
	}

}

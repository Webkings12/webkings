package com.webkings.app.member.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.webkings.app.common.SearchVO;

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
	public int updateMember(MemberVo memberVo) {
		return getSqlSession().update(namespace+".updateMember", memberVo);
	}
	@Override
	public int deleteMember(String mEmail) {
		return getSqlSession().delete(namespace+".deleteMember", mEmail);
	}
	@Override
	public int updatePwd(MemberVo vo) {
		return getSqlSession().update(namespace+".updatePwd",vo);
	}
	
	
	@Override
	public String adminCheck(MemberVo vo) {
		return getSqlSession().selectOne(namespace+".adminSelectPwd", vo);
	}
	@Override
	public List<MemberVo> selectList(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectList",searchVo);
	}
	@Override
	public int updateAdmin(MemberVo vo) {
		return getSqlSession().update(namespace+".updateAdmin", vo);
	}
	@Override
	public int TotalRecord(SearchVO vo) {
		return getSqlSession().selectOne(namespace+".TotalRecord", vo);
	}

}

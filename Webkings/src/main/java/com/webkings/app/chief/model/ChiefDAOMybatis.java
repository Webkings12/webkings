package com.webkings.app.chief.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ChiefDAOMybatis extends SqlSessionDaoSupport implements ChiefDAO {
	private String namespace="com.mybatis.mapper.oracle.chief";

	@Override
	public int loginCheck(ChiefVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertChief(ChiefVO vo) {
		return getSqlSession().insert(namespace+".insertChief", vo);
	}

	@Override
	public int selectChiefId(String reqParam) {
		return getSqlSession().insert(namespace+".selectChiefId", reqParam);
	}
}

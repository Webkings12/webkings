package com.webkings.app.chief.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ChiefDAOMybatis extends SqlSessionDaoSupport implements ChiefDAO {
	private String namespace="com.mybatis.mapper.oracle.chief";

	@Override
	public int loginCheck(ChiefVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertChief(ChiefVo vo) {
		return getSqlSession().insert(namespace+".insertchief", vo);
	}
}

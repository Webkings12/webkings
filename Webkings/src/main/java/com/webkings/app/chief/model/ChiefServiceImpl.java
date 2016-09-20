package com.webkings.app.chief.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

@Service
public class ChiefServiceImpl extends SqlSessionDaoSupport implements ChiefService{	
	private String namespace="com.mybatis.mapper.oracle.chief";
	
	@Override
	public int loginCheck(ChiefVo vo) {
		return 0;
	}

	@Override
	public int insertChief(ChiefVo vo) {
		return getSqlSession().insert(namespace+".insertchief", vo);
	}

	@Override
	public int selectChiefId(String reqParam) {
		return getSqlSession().insert(namespace+".selectChiefId", reqParam);
	}

}

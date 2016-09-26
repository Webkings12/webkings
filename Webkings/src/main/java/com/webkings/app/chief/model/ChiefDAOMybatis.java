package com.webkings.app.chief.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ChiefDAOMybatis extends SqlSessionDaoSupport implements ChiefDAO {
	private String namespace="com.mybatis.mapper.oracle.chief";
	private static final Logger logger = LoggerFactory.getLogger(ChiefDAOMybatis.class);

	@Override
	public String loginCheck(ChiefVO vo) {
		return getSqlSession().selectOne(namespace+".selectChiefPwd", vo);
	}

	@Override
	public int insertChief(ChiefVO vo) {
		return getSqlSession().insert(namespace+".insertChief", vo);
	}

	@Override
	public int selectChiefId(String reqParam) {
		return getSqlSession().insert(namespace+".selectChiefId", reqParam);
	}

	@Override
	public ChiefVO selectcEmail(String cEmail) {
		logger.info("cmail={}",cEmail);
		return getSqlSession().selectOne(namespace+".selectcChiefEmail", cEmail);
	}
}

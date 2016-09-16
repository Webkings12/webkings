package com.webkings.app.myitem.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MyitemDAOMybatis extends SqlSessionDaoSupport implements MyitemDAO{
	private String namespace="com.mybatis.mapper.oracle.myitem";
	
	@Override
	public int insertMyitem(Map<String, Object> map) {
		return getSqlSession().update(namespace+".insertMyitem", map);
	}

	@Override
	public List<MyitemVO> selectMyitem(int mNo) {
		return getSqlSession().selectList(namespace+".selectMyitem", mNo);
	}

	@Override
	public int selectINO(int mNo) {
		return getSqlSession().selectOne(namespace+".selectINO", mNo);
	}

}

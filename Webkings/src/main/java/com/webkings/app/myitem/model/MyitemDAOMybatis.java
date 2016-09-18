package com.webkings.app.myitem.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class MyitemDAOMybatis extends SqlSessionDaoSupport implements MyitemDAO{
	private String namespace="com.mybatis.mapper.oracle.myitem";
	

	@Override
	public int selectINO(MyitemVO vo) {
		return getSqlSession().selectOne(namespace+".selectINO", vo);
	}

	@Override
	public int insertMyitem(MyitemVO vo) {
		return getSqlSession().insert(namespace+".insertMyitem", vo);
	}

	@Override
	public List<MyItemviewVO> selectMiTEMview(int mNo) {
		return getSqlSession().selectList(namespace+".selectMiTEMview", mNo);
	}

	@Override
	public int deleteMyitem(MyitemVO vo) {
		return getSqlSession().delete(namespace+".deleteMyitem", vo);
	}

}

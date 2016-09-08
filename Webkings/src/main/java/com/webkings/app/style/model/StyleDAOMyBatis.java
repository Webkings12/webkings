package com.webkings.app.style.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class StyleDAOMyBatis extends SqlSessionDaoSupport implements StyleDAO{
	private String namespace="com.mybatis.mapper.oracle.style";

	@Override
	public List<StyleVO> selectStyle(String gender) {
		return getSqlSession().selectList(namespace+".selectStyle", gender);
	}
	
	
}

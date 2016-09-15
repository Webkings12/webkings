package com.webkings.app.shop.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDAOMybatis extends SqlSessionDaoSupport implements ShopDAO{
	
	private String namespace="com.mybatis.mapper.oracle.shop";

	@Override
	public List<ShopViewVO> shopStyle(ShopViewVO shopViewVo) {
		return getSqlSession().selectList(namespace+".shopStyle", shopViewVo);
	}

	@Override
	public List<ShopViewVO> shopNew(ShopViewVO shopViewVO) {
		return getSqlSession().selectList(namespace+".shopNew", shopViewVO);
	}
}

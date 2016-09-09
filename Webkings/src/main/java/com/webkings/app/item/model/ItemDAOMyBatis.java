package com.webkings.app.item.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAOMyBatis extends SqlSessionDaoSupport implements ItemDAO{
	
	private String namespace="com.mybatis.mapper.oracle.item";
	
	@Override  //아이템 리스트 top and item
	public List<Item_TypeVO> selectItemType(String gender) {
		return getSqlSession().selectList(namespace+".selectItemType", gender);
	}

	@Override
	public List<ItemViewVO> itemSelectAll(String gender) {
		return getSqlSession().selectList(namespace+".itemSelectA", gender);
	}
}

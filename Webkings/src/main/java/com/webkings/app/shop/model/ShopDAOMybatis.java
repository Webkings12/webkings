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
	public List<ShopViewVO> shopNew(ShopViewVO shopViewVo) {
		return getSqlSession().selectList(namespace+".shopNew", shopViewVo);
	}

	@Override
	public int shopSelect(String searchVal) {
		return getSqlSession().selectOne(namespace+".shopSelCount", searchVal);
	}

	@Override
	public int shopClickUpdate(String sNo) {
		return getSqlSession().update(namespace+".clickUp", sNo);
	}

	@Override
	public List<ShopViewVO> latelyshoplist(int sNo) {
		return getSqlSession().selectList(namespace+".latelyshoplist", sNo);
	}

	@Override
	public int shopDel(int sNo) {
		return getSqlSession().update(namespace+".shopDel",sNo);
	}

	@Override
	public ShopViewVO shopsNoSel(int sNo) {
		return getSqlSession().selectOne(namespace+".shopNoSel",sNo);
	}

	public int insertShop(ShopVO shopVo) {
		return getSqlSession().insert(namespace+".insertShop",shopVo);
	}

	@Override
	public int ShopAdd(int sNo) {
		return getSqlSession().update(namespace+".shopAdd", sNo);
	}

	@Override
	public ShopViewVO shopNosNoSel(int sNo) {
		return getSqlSession().selectOne(namespace+".shopNosNoSel", sNo);
	}

	@Override
	public List<ShopViewVO> shopNoStyle(ShopViewVO shopViewVo) {
		return getSqlSession().selectList(namespace+".shopNostyle",shopViewVo);
	}

	@Override
	public int checkShop(String sDomain) {
		return getSqlSession().selectOne(namespace+".checkShop",sDomain);
	}

	@Override
	public int openShop(String sDomain) {
		return getSqlSession().update(namespace+".openShop",sDomain);
	}

	@Override
	public String checkShop2(String shop) {
		return getSqlSession().selectOne(namespace+".checkShop2",shop);
	}
}

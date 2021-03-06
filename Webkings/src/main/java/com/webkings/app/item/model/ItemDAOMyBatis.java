package com.webkings.app.item.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.webkings.app.admin.controller.AdminItemController;

@Repository
public class ItemDAOMyBatis extends SqlSessionDaoSupport implements ItemDAO{
	
	private static final Logger logger= LoggerFactory.getLogger(ItemDAOMyBatis.class);
	
	private String namespace="com.mybatis.mapper.oracle.item";
	
	@Override  //�����ۼ���Ʈ top and item
	public List<Item_TypeVO> selectItemType(String gender) {
		return getSqlSession().selectList(namespace+".selectItemType", gender);
	}

	@Override
	public List<ItemViewVO> itemSelectAll(ItemViewVO itViewVo) {
		return getSqlSession().selectList(namespace+".itemSelectAll", itViewVo);
	}

	@Override
	public List<ItemViewVO> itemSelectAge(ItemViewVO itViewVo) {
		return getSqlSession().selectList(namespace+".itemSelectAge", itViewVo);
	}

	@Override
	public List<ItemViewVO> itemSelectName(ItemViewVO itViewVo) {
		return getSqlSession().selectList(namespace+".itemSelectName", itViewVo);
	}

	@Override
	public int itemSelectCount(ItemSearchVO itemSearchVo) {
		return getSqlSession().selectOne(namespace+".itemAllCount", itemSearchVo);
	}

	@Override
	public List<ItemViewVO> itemClick(ItemViewVO itViewVo) {
		return getSqlSession().selectList(namespace+".itemClick",itViewVo);
	}

	@Override
	public List<ItemViewVO> itemPriceDesc(ItemViewVO itemViewVo) {
		return getSqlSession().selectList(namespace+".itemPriceDesc",itemViewVo);
	}

	@Override
	public List<ItemViewVO> itemPriceAsc(ItemViewVO itemViewVo) {
		return getSqlSession().selectList(namespace+".itemPriceAsc", itemViewVo);
	}

	@Override
	public List<ItemViewVO> itemClickCate(ItemViewVO itViewVo) {
		return getSqlSession().selectList(namespace+".itemClickCate", itViewVo);
	}

	@Override
	public List<ItemViewVO> itemDescCate(ItemViewVO itViewVo) {
		return getSqlSession().selectList(namespace+".itemDescCate", itViewVo);
	}

	@Override
	public List<ItemViewVO> itemAscCate(ItemViewVO itViewVo) {
		return getSqlSession().selectList(namespace+".itemAscCate",itViewVo);
	}

	@Override
	public List<ItemViewVO> itemSearch(ItemSearchVO itemSearchVo) {
		return getSqlSession().selectList(namespace+".itemSearch", itemSearchVo);
	}

	@Override
	public int itemAllCount() {
		return getSqlSession().selectOne(namespace+".AllCount");
	}

	@Override
	public List<ItemViewVO> itemSelectiNo(int iNo) {
		return getSqlSession().selectList(namespace+".itemSelectiNo", iNo);
	}

	@Override
	public int itemClick(String iNo) {
		return getSqlSession().update(namespace+".itemClickUpdate", iNo);
	}

	@Override
	public int itemDel(int iNo) {
		return getSqlSession().delete(namespace+".itemDel", iNo);
	}

	@Override
	public ItemViewVO itemiNoSel(int iNo) {
		logger.info("iNo배류={}",iNo);
		ItemViewVO vo= getSqlSession().selectOne(namespace+".itemIno", iNo);
		logger.info("vo배류={}",vo);
		return getSqlSession().selectOne(namespace+".itemIno", iNo);
	}
}

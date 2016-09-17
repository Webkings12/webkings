package com.webkings.app.item.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService{
	
	@Autowired
	private ItemDAO itemDao;

	@Override  //아이템 리스트 top and item
	public List<Item_TypeVO> selectItemType(String gender) {
		return itemDao.selectItemType(gender);
	}

	@Override  //item 화면 selectAll
	public List<ItemViewVO> itemSelectAll(ItemViewVO itViewVo) {
		return itemDao.itemSelectAll(itViewVo);
	}

	@Override
	public List<ItemViewVO> itemSelectAge(ItemViewVO itViewVo) {
		return itemDao.itemSelectAge(itViewVo);
	}

	@Override
	public List<ItemViewVO> itemSelectName(ItemViewVO itViewVo) {
		return itemDao.itemSelectName(itViewVo);
	}

	@Override
	public int itemSelectCount(ItemSearchVO itemSearchVo) {
		return itemDao.itemSelectCount(itemSearchVo);
	}

	@Override
	public List<ItemViewVO> itemClick(ItemViewVO itViewVo) {
		return itemDao.itemClick(itViewVo);
	}

	@Override
	public List<ItemViewVO> itemPriceDesc(ItemViewVO itemViewVo) {
		return itemDao.itemPriceDesc(itemViewVo);
	}

	@Override
	public List<ItemViewVO> itemPriceAsc(ItemViewVO itemViewVo) {
		return itemDao.itemPriceAsc(itemViewVo);
	}

	@Override
	public List<ItemViewVO> itemClickCate(ItemViewVO itViewVo) {
		return itemDao.itemClickCate(itViewVo);
	}

	@Override
	public List<ItemViewVO> itemDescCate(ItemViewVO itViewVo) {
		return itemDao.itemDescCate(itViewVo);
	}

	@Override
	public List<ItemViewVO> itemAscCate(ItemViewVO itViewVo) {
		return itemDao.itemAscCate(itViewVo);
	}

	@Override
	public List<ItemViewVO> itemSearch(ItemSearchVO itemSearchVo) {
		return itemDao.itemSearch(itemSearchVo);
	}

	@Override
	public int itemAllCount() {
		return itemDao.itemAllCount();
	}

	@Override
	public List<ItemViewVO> itemSelectiNo(int iNo) {
		return itemDao.itemSelectiNo(iNo);
	}

	@Override
	public int itemClick(int iNo) {
		return itemDao.itemClick(iNo);
	}
}

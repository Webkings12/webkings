package com.webkings.app.item.model;

import java.util.List;

public interface ItemService {
	public List<Item_TypeVO> selectItemType(String gender); //�븘�씠�뀥 由ъ뒪�듃 top and item
	public List<ItemViewVO> itemSelectAll(String gender); //item selectAll
	public List<ItemViewVO> itemSelectAge(ItemViewVO itViewVo);
	
	//아이템 선택
	public List<ItemViewVO> itemSelectName(ItemViewVO itViewVo);
	public List<ItemViewVO> itemClick(ItemViewVO itViewVo);
	public List<ItemViewVO> itemPriceDesc(ItemViewVO itViewVo);
	public List<ItemViewVO> itemPriceAsc(ItemViewVO itViewVo);
	
	public List<ItemViewVO> itemClickCate(ItemViewVO itViewVo);
	public List<ItemViewVO> itemDescCate(ItemViewVO itViewVo);
	public List<ItemViewVO> itemAscCate(ItemViewVO itViewVo);
	
	//아이템 전체 갯수
	public int itemSelectCount(String cate);
	
	//아이템 검색
	public List<ItemViewVO> itemSearch(ItemSearchVO itemSearchVo);
}

package com.webkings.app.item.model;

import java.util.List;

public interface ItemDAO {
	public List<Item_TypeVO> selectItemType(String gender);	//아이템 리스트 top and item
	public List<ItemViewVO> itemSelectAll(String gender); //item 화면 selectAll
	
}

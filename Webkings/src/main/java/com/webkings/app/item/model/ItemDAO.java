package com.webkings.app.item.model;

import java.util.List;

public interface ItemDAO {
	public List<Item_TypeVO> selectItemType(String gender);
}

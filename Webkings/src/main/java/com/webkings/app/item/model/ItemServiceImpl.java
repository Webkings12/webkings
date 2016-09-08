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
}

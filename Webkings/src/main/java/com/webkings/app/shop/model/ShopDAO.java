package com.webkings.app.shop.model;

import java.util.List;

public interface ShopDAO {
	public List<ShopViewVO> shopStyle(ShopViewVO shopViewVo);
	public List<ShopViewVO> shopNew(ShopViewVO shopViewVO);
	public int shopSelect(String searchVal);
	public int shopClickUpdate(int sNo);
}

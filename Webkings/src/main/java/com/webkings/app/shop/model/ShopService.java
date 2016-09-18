package com.webkings.app.shop.model;

import java.util.List;

public interface ShopService {
	public List<ShopViewVO> shopStyle(ShopViewVO shopViewVo);
	public List<ShopViewVO> shopNew(ShopViewVO shopViewVO);
	public int shopSelect(String searchVal);
	public int shopClickUpdate(String sNo);
}

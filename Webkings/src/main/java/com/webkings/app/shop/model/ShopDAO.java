package com.webkings.app.shop.model;

import java.util.List;

public interface ShopDAO {
	public List<ShopViewVO> shopStyle(ShopViewVO shopViewVo);
	public List<ShopViewVO> shopNew(ShopViewVO shopViewVO);
	public int shopSelect(String searchVal);
	public int shopClickUpdate(String sNo);
	public List<ShopViewVO>latelyshoplist(int sNo);
	public int shopDel(int sNo);
<<<<<<< HEAD
	public ShopViewVO shopsNoSel(int sNo);
=======
	public int insertShop(ShopVO shopVo);
>>>>>>> branch 'master' of https://github.com/Webkings12/webkings.git
}

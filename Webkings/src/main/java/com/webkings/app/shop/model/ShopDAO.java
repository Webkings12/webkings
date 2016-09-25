package com.webkings.app.shop.model;

import java.util.List;

public interface ShopDAO {
	public List<ShopViewVO> shopStyle(ShopViewVO shopViewVo);
	public List<ShopViewVO> shopNew(ShopViewVO shopViewVO);
	public int shopSelect(String searchVal);
	public int shopClickUpdate(String sNo);
	public List<ShopViewVO>latelyshoplist(int sNo);
	public int shopDel(int sNo);
	public int ShopAdd(int sNo);
	public ShopViewVO shopsNoSel(int sNo);
	public ShopViewVO shopNosNoSel(int sNo);
	public List<ShopViewVO> shopNoStyle(ShopViewVO shopViewVo);
	
	
	public int insertShop(ShopVO shopVo);
	
	public int checkShop(String sDomain);
	public int openShop(String sDomain);
}

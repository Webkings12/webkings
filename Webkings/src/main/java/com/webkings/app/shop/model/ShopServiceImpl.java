package com.webkings.app.shop.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO shopDao;
	
	@Override
	public List<ShopViewVO> shopStyle(ShopViewVO shopViewVo) {
		return shopDao.shopStyle(shopViewVo);
	}

	@Override
	public List<ShopViewVO> shopNew(ShopViewVO shopViewVO) {
		return shopDao.shopNew(shopViewVO);
	}

	@Override
	public int shopSelect(String searchVal) {
		return shopDao.shopSelect(searchVal);
	}

	@Override
	public int shopClickUpdate(int sNo) {
		return shopDao.shopClickUpdate(sNo);
	}
	
}

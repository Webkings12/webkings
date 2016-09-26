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
	public int shopClickUpdate(String sNo) {
		return shopDao.shopClickUpdate(sNo);
	}

	@Override
	public List<ShopViewVO> latelyshoplist(int sNo) {
		return shopDao.latelyshoplist(sNo);
	}

	@Override
	public int shopDel(int sNo) {
		return shopDao.shopDel(sNo);
	}

	@Override
	public ShopViewVO shopsNoSel(int sNo) {
		return shopDao.shopsNoSel(sNo);
	}

	@Override
	public int shopMultiDel(List<Integer> spList) {
		int cnt =0;
		
		try {
			for (int sNo : spList) {
				cnt = shopDao.shopDel(sNo);
			}
			
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}
	@Override
	public int shopMultiAdd(List<Integer> spList) {
	int cnt =0;
		
		try {
			for (int sNo : spList) {
				cnt = shopDao.ShopAdd(sNo);
			}
			
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
		}
		return cnt;
	}
	@Override
	public int ShopAdd(int sNo) {
		return shopDao.ShopAdd(sNo);
	}


	@Override
	public ShopViewVO shopNosNoSel(int sNo) {
		return shopDao.shopNosNoSel(sNo);
	}

	@Override
	public List<ShopViewVO> shopNoStyle(ShopViewVO shopViewVo) {
		return shopDao.shopNoStyle(shopViewVo);
	}
	
	public int insertShop(ShopVO shopVo) {
		return shopDao.insertShop(shopVo);
	}
	
	public int checkShop(String sDomain){
		return shopDao.checkShop(sDomain);
	}
	
	public int openShop(String sDomain){
		return shopDao.openShop(sDomain);
	}

	@Override
	public String checkShop2(String shop) {
		return shopDao.checkShop2(shop);
	}
	
	public List<ShopNameViewVO> selectShopName(int cNo){
		return shopDao.selectShopName(cNo);
	}
}

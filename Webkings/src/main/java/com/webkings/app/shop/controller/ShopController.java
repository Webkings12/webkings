package com.webkings.app.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.item.controller.ItemController;
import com.webkings.app.shop.model.ShopService;
import com.webkings.app.shop.model.ShopViewVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	public static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@RequestMapping("/shopStyle.do")
	@ResponseBody
	public Map<String, Object> shopStyle(@RequestParam String gender, @RequestParam(defaultValue="all") String style, 
			@RequestParam(required=false) String searchName, Model model){
		
		logger.info("샵 param data ={},{}",gender , style);
		ShopViewVO shopViewVo = new ShopViewVO();
		shopViewVo.setStGender(gender);
		shopViewVo.setStName(style);
		
		if(searchName == null){
			searchName="";
		}
		shopViewVo.setSearchKeyword(searchName);
		logger.info("어디까지니?");
		List<ShopViewVO> shopList = shopService.shopStyle(shopViewVo);
		List<ShopViewVO> shopNew = shopService.shopNew(shopViewVo);
		logger.info("샵 셀렉터={}", shopList);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("shopList", shopList);
		resMap.put("shopNewList", shopNew);
		return resMap;
	}
}

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
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.shop.model.ShopService;
import com.webkings.app.shop.model.ShopViewVO;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	public static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@RequestMapping("/shopView.do")
	public String shopView(@RequestParam String gender, @RequestParam(defaultValue="all") String style, 
			@RequestParam(required=false) String searchName, Model model){
		
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		int pageNum=2;
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("gender", gender);
		model.addAttribute("style", style);
		model.addAttribute("searchName", searchName);
		
		return "page/shop/shop"+gender;
	}


	@RequestMapping("/shopStyle.do")
	@ResponseBody
	public Map<String, Object> shopStyle(@RequestParam String gender, @RequestParam String style, 
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
	
	/*샵눌렀을때 사이트로 넘어가기*/
	@RequestMapping("/shopClick.do")
	@ResponseBody
	public int shopClick(@RequestParam String sNo){
		int cnt = shopService.shopClickUpdate(sNo);
		return cnt;
	}
}

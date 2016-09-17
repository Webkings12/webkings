package com.webkings.app.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.item.model.ItemSearchVO;
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.ItemViewVO;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.shop.model.ShopService;
import com.webkings.app.shop.model.ShopViewVO;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	@Autowired
	private ShopService shopService;
	
	
	@RequestMapping("/view.do")
	public String searchView(@RequestParam(defaultValue="F") String gender, @RequestParam String searchVal,
			Model model){
		
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("searchVal", searchVal);
		model.addAttribute("gender", gender);
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		return "page/search/search";
	}
	
	@RequestMapping("/list.do")
	@ResponseBody
	public  Map<String, Object> searchList(@RequestParam String gender, @RequestParam String searchVal, HttpSession session){
		List<String> list = (List<String>)session.getAttribute("searchList");
		
		if(list==null){
			list = new ArrayList<String>();
			session.setAttribute("searchList", list);
		}
		list.add(searchVal);
		
		/*아이템 검색*/
		ItemSearchVO itemSearchVo= new ItemSearchVO();
		itemSearchVo.setSw2(searchVal);
		itemSearchVo.setGender(gender);
		List<ItemViewVO> selItemList = itemService.itemSearch(itemSearchVo);
		
		/*아이템 검색 갯수*/
		int itCount=itemService.itemSelectCount(itemSearchVo);
		
		
		/*샵검색*/
		ShopViewVO shopViewVo = new ShopViewVO();
		shopViewVo.setStGender(gender);
		shopViewVo.setSearchKeyword(searchVal);
		List<ShopViewVO> shopList = shopService.shopStyle(shopViewVo);
		int shopCount = shopService.shopSelect(searchVal);
		
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("searchList", list);
		resMap.put("shopList", shopList);
		resMap.put("itemList", selItemList);
		resMap.put("itCount", itCount);
		resMap.put("shopCount", shopCount);
		
		return resMap;
	}
}

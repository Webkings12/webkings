package com.webkings.app.search.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.webkings.app.view.controller.ViewController;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	@Autowired
	private ShopService shopService;
	
	private static final Logger logger= LoggerFactory.getLogger(SearchController.class);
	
	@RequestMapping("/view.do")
	public String searchView(@RequestParam(defaultValue="F") String gender, @RequestParam(required=false) String searchVal,
			Model model){
		
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		int pageNum=0;
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchVal", searchVal);
		model.addAttribute("gender", gender);
		model.addAttribute("styleList", styleList);
		logger.info("view styleList={}", styleList);
		model.addAttribute("itemList", itemList);
		logger.info("view itemList={}", itemList);
		return "page/search/search"+gender;
	}
	
	@RequestMapping("/list.do")
	@ResponseBody
	public  Map<String, Object> searchList(@RequestParam String gender, @RequestParam(required=false) String searchVal,
			HttpSession session){
	
		List<String> list = (List<String>)session.getAttribute("searchList");
		if(list==null){
			list = new ArrayList<String>();
			session.setAttribute("searchList", list);
		}else{
			if(!searchVal.equals("")){
				
				list.add(searchVal);
			}
		}
		/*아이템 검색*/
		ItemSearchVO itemSearchVo= new ItemSearchVO();
		itemSearchVo.setSw2(searchVal);
		logger.info("searchVal={}",searchVal);
		logger.info("itemSearchGender={}", gender);
		
		itemSearchVo.setGender(gender);
		
		itemSearchVo.setCate("");
		itemSearchVo.setOrderVal("");
		itemSearchVo.setSsp("");
		itemSearchVo.setSep("");
		itemSearchVo.setSac("");
		itemSearchVo.setnItem("");
		
		logger.info("sw2={}", itemSearchVo.getSw2());
		
		
		List<ItemViewVO> selItemList = itemService.itemSearch(itemSearchVo);
		
		logger.info("selItemList={}", selItemList);
		/*아이템 검색 갯수*/
		int itCount=itemService.itemSelectCount(itemSearchVo);
		logger.info("itCount={}", itCount);
		
		
		/*샵검색*/
		ShopViewVO shopViewVo = new ShopViewVO();
		shopViewVo.setStGender(gender);
		shopViewVo.setSearchKeyword(searchVal);
		
		logger.info("shopsearchKeyword={}", shopViewVo.getSearchKeyword());
		shopViewVo.setStName("all");
		
		List<ShopViewVO> shopList = shopService.shopStyle(shopViewVo);
		logger.info("shopList={}", shopList);
		int shopCount = shopService.shopSelect(searchVal);
		logger.info("sCount={}", shopCount);
		
		
		Map<String, Object> resMap = new HashMap<String, Object>();
	
		resMap.put("searchList", list);
		resMap.put("shopList", shopList);
		resMap.put("itemList", selItemList);
		resMap.put("itCount", itCount);
		resMap.put("shopCount", shopCount);
		return resMap;
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public void deleteSesion(HttpSession session){
		
		session.removeAttribute("searchList");
		
		
	}
}

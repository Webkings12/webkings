package com.webkings.app.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.webkings.app.item.model.ItemViewVO;
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
	
	/*샵눌렀을때 sNo 세션 저장*/
	@RequestMapping("/latelyShop.do")
	@ResponseBody
	public void product(@RequestParam int sNo,HttpServletRequest request,HttpSession session){
		logger.info("Shop  sNo={}",sNo);
		List<Integer> list = (List<Integer>)session.getAttribute("sNoList");
		if(list==null){
			list = new ArrayList<Integer>();
			session.setAttribute("sNoList", list);
		}
		list.add(sNo);
	}
	
	/*최근 본 샵 리스트*/
	@RequestMapping("/latelyShopList.do")
	public String prodList(HttpSession session,@RequestParam(defaultValue="F") String gender, Model model){
		
		List<Integer> sNoList = (List<Integer>)session.getAttribute("sNoList");
		if(sNoList!=null){
		logger.info("prodList 목록 sNoList={}",sNoList);
		Map<String, Object> map= new HashMap<String, Object>();
		List<ShopViewVO> alist= new ArrayList<ShopViewVO>();
		
		for(int a:sNoList ){
			 alist= shopService.latelyshoplist(a);
			 map.put("list"+a,alist);

		}
		
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		int pageNum=4;
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("gender", gender);
		model.addAttribute("pageNum",pageNum);
		
		model.addAttribute("shopmap",map);
		model.addAttribute("size",map.size());
		}
		
		return "page/mypage/latelyShopList"+gender;
	}
}

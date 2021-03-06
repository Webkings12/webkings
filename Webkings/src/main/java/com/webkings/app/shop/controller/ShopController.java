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
	
	public static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
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
		logger.info("shopSearchName={}",searchName);
		ShopViewVO shopViewVo = new ShopViewVO();
		shopViewVo.setStGender(gender);
		logger.info("shopgender={}",shopViewVo.getStGender());
		shopViewVo.setStName(style);
		List<ShopViewVO> shopNew =null;
		if(searchName == null || searchName.equals("")){
			searchName="";
			shopViewVo.setSearchKeyword(searchName);
			shopNew = shopService.shopNew(shopViewVo);
		}else{
			shopViewVo.setSearchKeyword(searchName);
		}
		
		List<ShopViewVO> shopList = shopService.shopStyle(shopViewVo);
		logger.info("샵 셀렉터={}", shopList);
		logger.info("뉴샵 셀렉터={}", shopNew);
		
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
	public String prodList(HttpSession session, @RequestParam(defaultValue="F") String gender, Model model){
		logger.info("젠더={}",gender);
		List<Integer> sNoList = (List<Integer>)session.getAttribute("sNoList");
		if(sNoList!=null){
		logger.info("prodList 목록 sNoList={}",sNoList);
		Map<String, Object> map= new HashMap<String, Object>();
		List<ShopViewVO> alist= new ArrayList<ShopViewVO>();
		
		for(int a:sNoList ){
			 alist= shopService.latelyshoplist(a);
			 map.put("list"+a,alist);

		}
		
		model.addAttribute("shopmap",map);
		model.addAttribute("size",map.size());
		}
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		int pageNum=4;
		
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("gender", gender);
		model.addAttribute("pageNum",pageNum);
		return "page/mypage/latelyShopList"+gender;
	}
	
	@RequestMapping("/checkShop.do")
	@ResponseBody
	public int checkShop(@RequestParam String shop){
		//1.
		logger.info("샵 도메인 shop={}",shop);
		//2.
		int cnt=shopService.checkShop(shop);
		logger.info("샵 체크결과 cnt={}",cnt);
		//3.
		return cnt;
	}
	
	@RequestMapping("/openShop.do")
	@ResponseBody
	public int openShop(@RequestParam String shop){
		//1.
		logger.info("샵 오픈 도메인 shop={}",shop);
		String res=shopService.checkShop2(shop);
		int result=0;
		if(res.equals("Y")){
			result=1;
		}else if(res.equals("N")){
			result=2;
		}
		logger.info("삽 오픈 연장 여부 result={}",result );
		//2.
		int cnt=shopService.openShop(shop);
		logger.info("샵 오픈 cnt={}",cnt);
		//3.
		return result;
	}
}

package com.webkings.app.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.item.model.ItemViewVO;
import com.webkings.app.shop.model.ShopService;
import com.webkings.app.shop.model.ShopViewVO;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

@Controller
public class AdminShopController {

	@Autowired
	private StyleService styleService;
	
	@Autowired
	private ShopService shopService;
	
	public static final Logger logger = LoggerFactory.getLogger(AdminShopController.class);
	@RequestMapping("/adminShopView.do")
	public String adminShopView(@RequestParam(defaultValue="F") String gender, @RequestParam(defaultValue="all") String style, 
			@RequestParam(required=false) String searchName, @RequestParam(defaultValue="0") String offVal, Model model){
		if(offVal.equals("")){
			offVal="0";
		}
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("gender", gender);
		model.addAttribute("style", style);
		model.addAttribute("searchName", searchName);
		model.addAttribute("offVal", offVal);
		return "page/admin/shop";
	}
	
	@RequestMapping("/adminShopSel.do")
	@ResponseBody
	public Map<String, Object> shopStyle(@RequestParam(defaultValue="F") String gender, @RequestParam String style, 
			@RequestParam(required=false) String searchName,@RequestParam String offVal, Model model){
		logger.info("샵 param data ={},{}",gender , style);
		logger.info("shopSearchName={}",searchName);
		
		ShopViewVO shopViewVo = new ShopViewVO();
		shopViewVo.setStGender(gender);
		shopViewVo.setStName(style);
		
		
		if(searchName == null || searchName.equals("")){
			searchName="";
			shopViewVo.setSearchKeyword(searchName);
		}else{
			shopViewVo.setSearchKeyword(searchName);
		}
		List<ShopViewVO> shopList =null;
		if(offVal.equals("0")){
			shopList = shopService.shopStyle(shopViewVo);
		}else{
			shopList =shopService.shopNoStyle(shopViewVo);
		}
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("shopList", shopList);
		return resMap;
	}
	
	@RequestMapping("/adminShopDel.do")
	public String adminItemView(@RequestParam int sNo, @RequestParam String gender,@RequestParam String offVal, Model model){
		
		int cnt = shopService.shopDel(sNo);
		
		String msg="";
		String url="";
		if(cnt>0){
			msg="삭제 성공";
			url="/adminShopView.do?gender="+gender+"&offVal="+offVal;
		}else{
			msg="삭제 실패";
			url="/adminShopView.do?gender="+gender+"&offVal="+offVal;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/adminShopAdd.do")
	public String adminItemAdd(@RequestParam int sNo, @RequestParam String gender,@RequestParam String offVal, Model model){
		
		int cnt = shopService.ShopAdd(sNo);
		
		String msg="";
		String url="";
		if(cnt>0){
			msg="추가 성공";
			url="/adminShopView.do?gender="+gender+"&offVal="+offVal;
		}else{
			msg="추가 실패";
			url="/adminShopView.do?gender="+gender+"&offVal="+offVal;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/adminShopMultiDel.do")
	@ResponseBody
	public int  shopMultiDel(@RequestParam List<Integer> shopValArray, Model model){
		List<Integer> spList =shopValArray;
		
		int cnt = shopService.shopMultiDel(spList);
		
		logger.info("다중 업데이트 확인 cnt={}",cnt);
		return cnt;
	}
	
	
	@RequestMapping("/adminShopMultiAdd.do")
	@ResponseBody
	public int  shopMultiAdd(@RequestParam List<Integer> shopValArray, Model model){
		List<Integer> spList =shopValArray;
		
		int cnt = shopService.shopMultiAdd(spList);
		
		logger.info("다중 업데이트 확인 cnt={}",cnt);
		return cnt;
	}
	
}

package com.webkings.app.item.controller;

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

import com.webkings.app.item.model.ItemSearchVO;
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.ItemViewVO;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

@Controller
@RequestMapping("/item")
public class ItemController {

	public static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	ItemViewVO itViewVo = new ItemViewVO();
	
	@RequestMapping("/itemCate.do")
	public String itemCategory(@RequestParam String page, @RequestParam String gender,
					  @RequestParam(defaultValue="ALL") String cate, @RequestParam(defaultValue="0") String orderVal, 
					  @RequestParam(required=false) String sw2, @RequestParam(required=false) String ssp, @RequestParam(required=false) String sep,
					  @RequestParam(required=false) String sac,  Model model){
		if(orderVal==""){
			orderVal="0";
		}
		
		ItemSearchVO itemSearchVo = new ItemSearchVO();
		itemSearchVo.setSw2(sw2);
		itemSearchVo.setSac(sac);
		itemSearchVo.setCate(cate);
		itemSearchVo.setSsp(ssp);
		itemSearchVo.setSep(sep);
		
		String orderName="";
		if(orderVal.equals("0")){
			orderName="신상품순";
		}else if(orderVal.equals("1")){
			orderName="클릭순";
		}else if(orderVal.equals("2")){
			orderName="낮은 가격순";
		}else if(orderVal.equals("3")){
			orderName="높은 가격순";
		}
		logger.info("itemSearchVo={}", itemSearchVo);
		
		logger.info("product 처음화면 cate={},orderVal={}",cate, orderVal);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		itViewVo.setItGender(gender);
		itViewVo.setItName(cate);
		
		if(page.equals("/product" )|| page.equals("/item" )|| page.equals("/shop" )|| page.equals("/mypage")){
 			page+=page+gender;
 		}
		
		int pageNum=0;
		if(page.equals("/item/itemF") || page.equals("/item/itemM") ||
			page.equals("/product/productF") || page.equals("/product/productM")){
			pageNum=1;
			
		}
		else if(page.equals("/shop/shopF") || page.equals("/shop/shopM")){
			pageNum=2;
		}
		else if(page.equals("/info")){
			pageNum=3;
		}
		else if(page.equals("/mypage/mypageF") || page.equals("/mypage/mypageM")){
			pageNum=4;
		}
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("styleList", styleList);
		model.addAttribute("itView",itViewVo);
		model.addAttribute("itemList", itemList);
		model.addAttribute("orderName", orderName);
		model.addAttribute("itemSearchVo", itemSearchVo);
		return "page"+page;
	}
	@RequestMapping("/selectItem.do")
	@ResponseBody
	public Map<String, Object> itemSelectAll(@RequestParam String gender, 
												@RequestParam String age){
			if(age.equals("")){
				age="all";
			}
				
			logger.info("itemController age={}",age);
			logger.info("itemController gender={}",gender);
			List<ItemViewVO> selItemList = null;
			
    		if(age.equals("all")){
    			selItemList=itemService.itemSelectAll(gender);
    			
    		}else{
    			itViewVo.setsAge(age);
    			itViewVo.setItGender(gender);
    			selItemList= itemService.itemSelectAge(itViewVo);
    		}
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("itemList", selItemList);
		
		logger.info("ajax itemList={}", selItemList);
		return resMap;
	}
	
	@RequestMapping("/itemSelectName.do")
	@ResponseBody
	public  Map<String, Object> itemSelectName(@RequestParam String gender, 
			@RequestParam(defaultValue="ALL") String cate, @RequestParam String orderVal,
			@RequestParam(required=false) String sw2, @RequestParam(required=false) String ssp, @RequestParam(required=false) String sep,
			@RequestParam(required=false) String sac){
		
		ItemViewVO itemViewVo = new ItemViewVO();
		if(cate.equals("")){
			cate="ALL";
		}
		if(orderVal.equals("")){
			orderVal="0";
		}
		
		itemViewVo.setItGender(gender);
		itemViewVo.setItName(cate);
		logger.info("아이템 선택페이지에서 값들  cate,orderVal={},{}", cate,orderVal);
		logger.info("gender, temViewVo={}", itemViewVo);
		
		List<ItemViewVO> selItemList = null;
		if(!sw2.equals("") && !sw2.isEmpty() || !ssp.equals("") && !ssp.isEmpty() || !sep.equals("") && !sep.isEmpty() || !sac.equals("") && !sac.isEmpty()){
			ItemSearchVO itemSearchVo= new ItemSearchVO();
			itemSearchVo.setSw2(sw2);
			itemSearchVo.setCate(cate);
			itemSearchVo.setOrderVal(orderVal);
			itemSearchVo.setSsp(ssp);
			itemSearchVo.setSep(sep);
			itemSearchVo.setGender(gender);
			if(sac.equals("1")){
				sac="10";
			}else if(sac.equals("2")){
				sac="20";
			}else if(sac.equals("3")){
				sac="30";
			}else{
				sac=" ";
			}
			itemSearchVo.setSac(sac);
			
			logger.info("아이템 searchVo12={}", itemSearchVo);
			selItemList = itemService.itemSearch(itemSearchVo);
			
		}else{
			if(orderVal.equals("0")){
				if(cate.equals("ALL")){
					selItemList= itemService.itemSelectAll(gender);
				}else{
					itViewVo.setItName(cate);
					selItemList= itemService.itemSelectName(itemViewVo);
				}
			}
			else if(orderVal.equals("1")){
				if(cate.equals("ALL")){
					selItemList= itemService.itemClick(itemViewVo);
				}else{
					itViewVo.setItName(cate);
					selItemList= itemService.itemClickCate(itemViewVo);
				}
			}
			else if(orderVal.equals("2")){
				if(cate.equals("ALL")){
					selItemList= itemService.itemPriceDesc(itemViewVo);
				}else{
					itViewVo.setItName(cate);
					selItemList= itemService.itemDescCate(itemViewVo);
				}
			}else if(orderVal.equals("3")){
				if(cate.equals("ALL")){
					selItemList= itemService.itemPriceAsc(itemViewVo);
				}else{
					itViewVo.setItName(cate);
					selItemList= itemService.itemAscCate(itemViewVo);
				}
			}
		}
		int itCount=0;
	
		itCount=itemService.itemSelectCount(cate);
		
		logger.info("count="+itCount);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("itemList", selItemList);
		resMap.put("itCount", itCount);
		logger.info("ajax itemList={}", selItemList);
		return resMap;
	}
}

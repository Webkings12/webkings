package com.webkings.app.view.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webkings.app.item.model.ItemSearchVO;
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.ItemViewVO;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

import oracle.sql.CHAR;

@Controller
public class ViewController {
	
	private static final Logger logger= LoggerFactory.getLogger(ViewController.class);
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	@RequestMapping("/page.do")
	public String page(@RequestParam(defaultValue="/item") String page, @RequestParam(defaultValue="all") String ageSel,
			@RequestParam(defaultValue="F") String gender, @RequestParam(defaultValue="all") String style, Model model){
		logger.info("page,gender={},{}",page,gender);
		
		if(page.equals("/product" )|| page.equals("/item" )|| page.equals("/shop" )|| page.equals("/mypage")){
 			page+=page+gender;
 		}
		if(gender==""){
			gender="F";
		}
		/*item sel*/
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		/*아이템 갯수*/
		ItemSearchVO itemSearchVo= new ItemSearchVO();
		itemSearchVo.setGender(gender);
		itemSearchVo.setSac(ageSel);
		
		
		//오늘 신상
		itemSearchVo.setnItem("NEW");
		int itNCount=itemService.itemSelectCount(itemSearchVo);
		 
		 
		itemSearchVo.setnItem("");
		int itOCount= itemService.itemSelectCount(itemSearchVo);
		
		logger.info("alist.size(),ageSel={},{}", itemList.size(), ageSel);
		logger.info("styleList1.size()={}", styleList.size());
		
		/*age sel*/
		String age="";
		if(page.equals("/item/itemF") || page.equals("/item/itemM")){
			 if(ageSel.equals("10")){
				age="10대 신상품";
			}
			else if(ageSel.equals("20")){
				age="20대 신상품";
			}
			else if(ageSel.equals("30")){
				age="30대 신상품";
			}else {
				age="전체연령대";
			}
			logger.info("age={}",age);
			model.addAttribute("age", age);
		}
		
		if(style.equals("all")){
			style="쇼핑몰 전체";
		}
		/*category sel*/
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
		
		logger.info("pageNum, page, age={},{}",pageNum, page);
		logger.info("styleList={}", styleList);
		model.addAttribute("pageNum",pageNum);
		
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		
		
		model.addAttribute("gender", gender);
		model.addAttribute("style", style);
		model.addAttribute("itNCount", itNCount);
		model.addAttribute("itOCount", itOCount);
		
		return "page"+page;
		
	}
}

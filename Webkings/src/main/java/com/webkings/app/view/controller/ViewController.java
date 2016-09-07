package com.webkings.app.view.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.Item_TypeVO;

import oracle.sql.CHAR;

@Controller
public class ViewController {
	
	private static final Logger logger= LoggerFactory.getLogger(ViewController.class);
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/page.do")
	public String page(@RequestParam(defaultValue="/item") String page, @RequestParam(defaultValue="F") String gender,
			Model model){
		logger.info("page,gender={},{}",page,gender);
		
		if(page.equals("/product" )|| page.equals("/item" )|| page.equals("/shop" )|| page.equals("/mypage")){
 			page+=page+gender;
 		}
		
		List<Item_TypeVO> alist = itemService.selectItemType(gender);
		
		logger.info("alist.size()={}", alist.size());
		
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
		
		logger.info("pageNum, page={},{}",pageNum, page);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("alist", alist);
		return "page"+page;
	}
	
}

package com.webkings.app.view.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ViewController {
	
	private static final Logger logger= LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping("/page.do")
	public String page(@RequestParam(defaultValue="/item/itemF") String page, Model model){
		logger.info("page={}",page);
		
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
		logger.info("pageNum={}",pageNum);
		model.addAttribute("pageNum",pageNum);
		return "page"+page;
	}
	
}

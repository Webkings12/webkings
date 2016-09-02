package com.webkings.app.view.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ViewController {
	
	private static final Logger logger= LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping("/main.do")
	public String top(){
		return "main";
	}
	
	/*public String viewPage(@RequestParam String page){
		logger.info("page name={}",page);
		
		String result ="";
		if(page.equals("productF")){
			result = "item/product/productF.jsp";
		}else if(page.equals("productM")){
			result= "item/product/productM.jsp";
		}else if(page.equals("item")){
			result= "item/item.jsp";
		}else if(page.equals("tos")){
			result= "member/tos.jsp";
		}else if(page.equals("mypage")){
			result= "mypage/mypage.jsp";
		}
		return result;
	}*/

}

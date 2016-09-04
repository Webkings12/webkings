package com.webkings.app.view.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ViewController {
	
	private static final Logger logger= LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping("/main.do")
	public String top(){
		return "main";
	}
/*	@RequestMapping("/view.do")
	public String page(@RequestParam String ss){
		logger.info("pageº±≈√={}",ss);
		return ss;
	}*/
	
	@RequestMapping("/page.do")
	@ResponseBody
	public String viewPage(@RequestParam String viewPage){
		logger.info("page viewPage={}", viewPage);
		
		String result ="";
		if(viewPage.equals("productF")){
			result = "<c:set var='ss'>item/product/productF.jsp</c:set>";
			/*result = "<jsp:include page='item/product/productF.jsp' flush='true'/>";*/
		}else if(viewPage.equals("productM")){
			result= "item/product/productM";
		}else if(viewPage.equals("item")){
			result= "<jsp:include page='item/item.jsp'></jsp:include>";
		}else if(viewPage.equals("tos")){
			result= "member/tos";
		}else if(viewPage.equals("mypage")){
			result= "mypage/mypage";
		}else if(viewPage.equals("shopF")){
			result="shop/shopF";
		}else if(viewPage.equals("shopM")){
			result="shop/shopM";
		}
		logger.info("result={}", result);
		return result;
	}
}

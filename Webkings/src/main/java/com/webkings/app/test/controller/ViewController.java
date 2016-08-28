package com.webkings.app.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/view")
public class ViewController {
	
	private Logger logger = LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping("/top.do")
	public String top(@RequestParam(defaultValue="f") String gender){
		String i = "";
		logger.info("view gender={}",gender);
		if(gender.equals("f")){
			i="f";
		}else{
			i="m";
		}
		return "inc/top_"+i;
	}
}

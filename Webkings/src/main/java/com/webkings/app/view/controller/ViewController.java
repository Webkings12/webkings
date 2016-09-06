package com.webkings.app.view.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ViewController {
	
	private static final Logger logger= LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping("/main.do")
	public String top(HttpSession session){
		String gender = "F";
		session.setAttribute("gender", gender);
		return "page/product/productF";
	}
	
	@RequestMapping("/page.do")
	public String page(@RequestParam String page){
		logger.info("page={}",page);
		return "page"+page;
	}
	
}

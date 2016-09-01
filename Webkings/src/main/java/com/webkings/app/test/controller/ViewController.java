package com.webkings.app.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
	
	@RequestMapping("/main.do")
	public String top(){
		return "main";
	}
	@RequestMapping("/mypage.do")
	public String mypage(){
		return "inc/mypage";
	}
	
}

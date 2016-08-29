package com.webkings.app.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ViewController {
	
	@RequestMapping("/top.do")
	public String top(){
		return "main";
	}
	@RequestMapping("/mypage.do")
	public String mypage(){
		return "inc/mypage";
	}
}

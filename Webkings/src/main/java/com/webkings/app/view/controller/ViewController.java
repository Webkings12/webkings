package com.webkings.app.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ViewController {
	
	@RequestMapping("/top.do")
	public String top(){
		return "inc/top";
	}
}

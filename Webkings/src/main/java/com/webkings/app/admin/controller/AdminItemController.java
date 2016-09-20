package com.webkings.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminItemController {

	@RequestMapping("/adminItemView.do")
	public String adminItemView(@RequestParam String gender, Model model){
		
		model.addAttribute("gender", gender);
		return "page/admin/item";
	}
}

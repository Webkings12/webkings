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
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

@Controller
public class FooterViewController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	public static final Logger logger=
			LoggerFactory.getLogger(FooterViewController.class);
	
	@RequestMapping("/company.do")
	public String company(@RequestParam(defaultValue="F") String gender, Model model){
		//1.
		
		//2.
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		int pageNum=4;
		//3.
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("gender",gender);
		
		return "page/mypage/company"+gender;
	}
	
	@RequestMapping("/service.do")
	public String service(@RequestParam(defaultValue="F") String gender, Model model){
		//1.
		
		//2.
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		int pageNum=4;
		//3.
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("gender",gender);
		
		return "page/mypage/service"+gender;
	}
}

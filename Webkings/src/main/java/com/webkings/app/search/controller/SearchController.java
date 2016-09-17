package com.webkings.app.search.controller;

import java.util.List;

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
public class SearchController {
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	@RequestMapping("/search.do")
	public String searchView(@RequestParam(defaultValue="F") String gender,  Model model){
		
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		return "page/search/search";
	}
}

package com.webkings.app.item.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.ItemViewVO;

@Controller
@RequestMapping("/item")
public class ItemController {

	public static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/selectAll.do")
	@ResponseBody
	public List<ItemViewVO> itemSelectAll(@RequestParam String gender){
		List<ItemViewVO> selItemList = itemService.itemSelectAll(gender);
		
		logger.info("ajax 아이템 전체조회={}",selItemList);
		return selItemList;
	}
}

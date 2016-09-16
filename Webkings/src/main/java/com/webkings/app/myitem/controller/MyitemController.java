package com.webkings.app.myitem.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webkings.app.myitem.model.MyitemService;


@Controller
public class MyitemController {
	private static final Logger logger=LoggerFactory.getLogger(MyitemController.class);
	
	@Autowired
	private MyitemService myitemService;
	
	@RequestMapping("/myitem.do")
	public void insertMyitem(HttpSession session, @RequestParam(defaultValue="0") int iNo){
		logger.info("myitem insert 처리 iNo={}",iNo);
		
		String mNo=(String)session.getAttribute("mNo");
		
		Map<String, Object> map= new HashMap<String, Object>();
		
		map.put("mNo", mNo);
		map.put("iNo", iNo);
		
		myitemService.insertMyitem(map);
		
		
	}
}

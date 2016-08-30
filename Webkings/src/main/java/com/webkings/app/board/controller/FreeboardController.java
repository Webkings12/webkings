package com.webkings.app.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board/freeboard")
public class FreeboardController {
	public static final Logger logger=
			LoggerFactory.getLogger(FreeboardController.class);
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write_get(){
		//1.
		logger.info("자게 글쓰기창 띄우기");
		//2.
		//3.
		return "board/freeboard/write";
	}
}

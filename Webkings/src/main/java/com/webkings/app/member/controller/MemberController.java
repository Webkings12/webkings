package com.webkings.app.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	@RequestMapping("/tos.do")
	public String tos_get(){
		
		logger.info("이용약관 보여주기");
		return "/member/tos";
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register_get(){
		
		logger.info("회원가입 화면 보여주기");
		return "/member/register";
	}
}

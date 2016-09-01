package com.webkings.app.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;



@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/tos.do")
	public String tos_get(){
		logger.info("이용약관 화면 보여주기");
		
		return "member/tos";
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register_get(){
		logger.info("회원가입 화면 보여주기");
		
		return "member/register";
	}
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register_post(@ModelAttribute MemberVo memberVo){
		logger.info("회원가입 처리, 파라미터 MemberVo={}",memberVo);
		
		int cnt= memberService.insertMember(memberVo);
		logger.info("회원가입 처리, 파라미터 cnt={}",cnt);
		
		return "main";
	}
}

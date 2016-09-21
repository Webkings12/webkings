package com.webkings.app.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;

@Controller
public class AdminLoginController {
	
	private static final Logger logger=LoggerFactory.getLogger(AdminLoginController.class);
	
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping(value="/login.do")
	@ResponseBody
	public int login_post(@ModelAttribute MemberVo memberVo,
			HttpServletRequest request, Model model){
		logger.info("로그인 파라미터, memberVo={}", memberVo);
		
		int result=memberService.adminCheck(memberVo);
		
		if(result==MemberService.LOGIN_OK){
			
			memberVo =memberService.selectmEmail(memberVo.getmEmail());
			HttpSession session= request.getSession();
			session.setAttribute("adminmEmail", memberVo.getmEmail());
			session.setAttribute("adminmNick", memberVo.getmNick());
			session.setAttribute("adminmNo", memberVo.getmNo());
			session.setAttribute("adminmType", memberVo.getmType());
		}
		logger.info("result="+result);
		return result;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		
		session.removeAttribute("adminmEmail");
		session.removeAttribute("adminmNick");
		session.removeAttribute("adminmNo");
		session.removeAttribute("adminmType");
		
		return "redirect:/admin.do";
	}
}

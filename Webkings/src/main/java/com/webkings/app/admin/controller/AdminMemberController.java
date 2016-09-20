package com.webkings.app.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;

@Controller
public class AdminMemberController {
	private static final Logger logger=LoggerFactory.getLogger(AdminMemberController.class);
	
	private MemberService memberService;
	
	/*@RequestMapping("/admin/memberList.do")
	public List<MemberVo> memberList() {
		
	}*/
}

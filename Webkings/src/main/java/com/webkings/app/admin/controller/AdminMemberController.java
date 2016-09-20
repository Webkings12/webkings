package com.webkings.app.admin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;

@Controller
public class AdminMemberController {
	private static final Logger logger=LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/admin/memberList.do")
	public String memberList(HttpSession session, Model model) {
		String m_Type=(String)session.getAttribute("mType"); 
		logger.info("회원리스트 보여주기 mType={}",m_Type);
		List<MemberVo> memberList=new ArrayList<MemberVo>();
		if(!m_Type.equals("0")){
			model.addAttribute("msg","권한이 없습니다");
			model.addAttribute("url","/admin.do");
			return "common/message";
		}else {
			memberList=memberService.selectList();
			logger.info("회원리스트 보여주기 memberList={}",memberList.size());
		}
		model.addAttribute("memberList",memberList);
		
		return "page/admin/memberList";
	}
}

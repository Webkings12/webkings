package com.webkings.app.chief.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webkings.app.chief.model.ChiefService;
import com.webkings.app.chief.model.ChiefVo;

@Controller
@RequestMapping("/chief")
public class ChiefController {
	private static final Logger logger = LoggerFactory.getLogger(ChiefController.class);
	
	@Autowired
	private ChiefService chiefService;
	
	@RequestMapping(value="/chiefMain.do", method=RequestMethod.GET)
	public String chiefMain_get(){
		logger.info("chief main");
		
		return "chief/m_center";
	}
	
	@RequestMapping(value="/addChief.do", method=RequestMethod.GET)
	public String addChief_get(){
		logger.info("addChief");
		
		return "chief/addChief";
	}
	
	@RequestMapping(value="/insertChief.do", method=RequestMethod.POST)
	public String insertChief_post(@ModelAttribute ChiefVo chiefVo, HttpServletRequest request, Model model){
		logger.info("insertChief 기업회원 가입, 파라미터 ChiefVo={}",chiefVo);
		
		int count = chiefService.insertChief(chiefVo); 
		
		if (count == 1) {
			return "redirect:/chief/m_center.do";
		} else {
			return "redirect:/chief/addChief.do"; 
		}
	}
	
//	@RequestMapping(value="/insertChiefChkId.do", method=RequestMethod.POST)
//	public String insertChiefChkId_post(HttpServletRequest request){
//		logger.info("insertChiefChkId 기업회원 가입요청 IdChk, 파라미터 request={}",request);
//		String reqParam = request.getParameter("id");
//		
//		int count = chiefService.selectChiefId(reqParam);
//		
//		return "redirect:/chief/m_center.do";
//	} 
}

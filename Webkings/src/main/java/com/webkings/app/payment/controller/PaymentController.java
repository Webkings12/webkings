package com.webkings.app.payment.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.shop.model.ShopNameViewVO;
import com.webkings.app.shop.model.ShopService;


@Controller
@RequestMapping("/payment")
public class PaymentController {
	private static final Logger logger=LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping("/payNow.do")
	public String payment(HttpSession session,Model model){
		
		String cEmail=(String)session.getAttribute("cEmail");
		if(cEmail==null || cEmail.isEmpty()){
			model.addAttribute("msg","로그인 하세요");
			model.addAttribute("url","/chief/chiefMain.do");
			return "common/message";
		}
		int cNo=(Integer)session.getAttribute("cNo");
		logger.info("샵검색 파라미터 cNo={}",cNo);
		
		List<ShopNameViewVO> sVo=shopService.selectShopName(cNo);
		logger.info("샵검색결과 sVo={}",sVo);
		model.addAttribute("sVo",sVo);
		
		return "page/payment/payNow";
	}
	
}

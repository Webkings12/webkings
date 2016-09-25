package com.webkings.app.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@RequestMapping("/payNow.do")
	public String payment(){
		
		return "page/payment/payNow";
	}
	
}

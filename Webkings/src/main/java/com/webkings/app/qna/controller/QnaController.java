package com.webkings.app.qna.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webkings.app.qna.model.QnaService;
import com.webkings.app.qna.model.QnaVO;

@Controller
@RequestMapping("/board/qna")
public class QnaController {
	
	private static final Logger logger
		=LoggerFactory.getLogger(QnaController.class);
	
	/*@Autowired
	private QnaService qnaService;*/
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String qnaView(){
		//1.
		logger.info("QnA창 보이기");
		//2.
		//3.
		return "board/qna/write";
	}
	
	/*@RequestMapping(value="/qna.do",method=RequestMethod.POST)
	public String qnaSend(@ModelAttribute QnaVO qnaVo){
		//1.
		logger.info("QnA전송 파라미터 QnaVo={}",qnaVo);
		//2.
		int cnt=qnaService.insertQna(qnaVo);
		//3.
		if(){
			
		}
		return "board/qna";
	}*/
}

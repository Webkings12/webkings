package com.webkings.app.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webkings.app.reply.controller.ReplyController;
import com.webkings.app.reply.model.ReplyService;
import com.webkings.app.reply.model.ReplyViewVO;

@Controller
@RequestMapping("/admin/reply")
public class AdminFreeboardReplyController{
	
	private static final Logger logger=
			LoggerFactory.getLogger(ReplyController.class);
	@Autowired
	ReplyService replyService;
	
	@RequestMapping("/write.do")
	public String insertReply(@ModelAttribute ReplyViewVO viewVo,HttpSession session){
		int mNo=(Integer)session.getAttribute("mNo");
		viewVo.setmNo(mNo);
		logger.info("댓글 입력 파라미터 viewVo={}",viewVo);
		int cnt=replyService.insertReply(viewVo);
		logger.info("댓글 입력 결과cnt={}",cnt);
		return "redirect:/admin/freeboard/detail.do?no="+viewVo.getbNo();
	}
	
	@RequestMapping("/list.do")
	public String replyList(@RequestParam(defaultValue="0") int bNo, Model model){
		logger.info("댓글 리스트 파라미터 bNo={}",bNo);
		
		List<ReplyViewVO> rList=replyService.selectReply(bNo);
		model.addAttribute("rList",rList);
		return "page/admin/board/replyList";
	}
	
	
	@RequestMapping("/delete.do")
	public String replyDel(@RequestParam(defaultValue="0") int rNo,
			@RequestParam(defaultValue="0") int bNo){
		//1.
		logger.info("리플 삭제 파라미터 rNo={}",rNo);
		//2.
		int cnt=replyService.deleteReply(rNo);
		logger.info("리플 삭제 결과 cnt={}",cnt);
		//3.
		return "redirect:/admin/freeboard/detail.do?no="+bNo;
	}

	@RequestMapping("/write2.do")
	public String insertReply2(@ModelAttribute ReplyViewVO viewVo,HttpSession session){
		//1.
		int mNo=(Integer)session.getAttribute("mNo");
		viewVo.setmNo(mNo);
		logger.info("댓글의 댓글 글쓰기 파라미터={}",viewVo); 
		//2.
		int cnt=replyService.insertReply2(viewVo);
		logger.info("댓글쓰기 결과 cnt={}",cnt);
		
		//3.
		return "redirect:/admin/freeboard/detail.do?no="+viewVo.getbNo();
	}
	
}

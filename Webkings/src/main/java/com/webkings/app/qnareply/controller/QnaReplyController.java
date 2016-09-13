package com.webkings.app.qnareply.controller;

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

import com.webkings.app.qnareply.model.QnaReplyService;
import com.webkings.app.qnareply.model.QnaReplyViewVO;
import com.webkings.app.reply.controller.ReplyController;
import com.webkings.app.reply.model.ReplyService;
import com.webkings.app.reply.model.ReplyViewVO;

@Controller
@RequestMapping("/qnaReply")
public class QnaReplyController {
	private static final Logger logger=
			LoggerFactory.getLogger(ReplyController.class);
	@Autowired
	QnaReplyService qnaReplyService;
	
	@RequestMapping("/write.do")
	public String insertReply(@ModelAttribute QnaReplyViewVO viewVo,HttpSession session){
		int mNo=(Integer)session.getAttribute("mNo");
		viewVo.setmNo(mNo);
		logger.info("댓글 입력 파라미터 viewVo={}",viewVo);
		int cnt=qnaReplyService.insertReply(viewVo);
		logger.info("댓글 입력 결과cnt={}",cnt);
		return "redirect:/qna/detail.do?no="+viewVo.getqNo();
	}
	
	@RequestMapping("/list.do")
	public String replyList(@RequestParam(defaultValue="0") int qNo, Model model){
		logger.info("댓글 리스트 파라미터 qNo={}",qNo);
		
		List<QnaReplyViewVO> qrList=qnaReplyService.selectReply(qNo);
		logger.info("댓글 리스트 검색결과 qrlist.size={}",qrList.size());
		model.addAttribute("qrList",qrList);
		return "board/qnaReply/replyList";
	}
	
	
	@RequestMapping("/delete.do")
	public String replyDel(@RequestParam(defaultValue="0") int qrNo,
			@RequestParam(defaultValue="0") int qNo){
		//1.
		logger.info("리플 삭제 파라미터 rNo={},qNo={}",qrNo, qNo);
		//2.
		int cnt=qnaReplyService.deleteReply(qrNo);
		logger.info("리플 삭제 결과 cnt={}",cnt);
		//3.
		return "redirect:/qna/detail.do?no="+qNo;
	}

	@RequestMapping("/write2.do")
	public String insertReply2(@ModelAttribute QnaReplyViewVO viewVo,HttpSession session){
		//1.
		int mNo=(Integer)session.getAttribute("mNo");
		viewVo.setmNo(mNo);
		logger.info("댓글의 댓글 글쓰기 파라미터={}",viewVo); 
		//2.
		int cnt=qnaReplyService.insertReply2(viewVo);
		logger.info("댓글쓰기 결과 cnt={}",cnt);
		
		//3.
		return "redirect:/qna/detail.do?no="+viewVo.getqNo();
	}
}

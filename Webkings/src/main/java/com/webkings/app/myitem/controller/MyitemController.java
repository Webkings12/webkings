package com.webkings.app.myitem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.member.model.MemberService;
import com.webkings.app.myitem.model.MyitemService;
import com.webkings.app.myitem.model.MyitemVO;


@Controller
public class MyitemController {
	private static final Logger logger=LoggerFactory.getLogger(MyitemController.class);
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private MyitemService myitemService;
	
	@RequestMapping("/myitem.do")
	@ResponseBody
	public void insertMyitem(HttpSession session, @RequestParam int iNo,Model model){
		logger.info("myitem insert 처리 iNo={}",iNo );
		
			String page="";
			int mNo=(Integer)session.getAttribute("mNo");
			logger.info("myitem insert12 처리 mNo={}",mNo);
			int count= myitemService.selectINO(mNo);
			logger.info("count={}",count);
			if(count<1){
				Map<String, Object> map= new HashMap<String, Object>();
		
				map.put("mNo",mNo);
				map.put("iNo", iNo);
		
				int cnt=myitemService.insertMyitem(map);
				logger.info("myitem insert123 처리 cnt={}",cnt);
			}
		
	}
	
	@RequestMapping("/myitemList.do")
	public String myitemList(HttpSession session, Model model){
		logger.info("myitem 목록");
		
		int mNo=(Integer)session.getAttribute("mNo");
		List<MyitemVO> alist= myitemService.selectMyitem(mNo);
		logger.info("myitem 목록 alist.size()={}",alist.size());
		
		model.addAttribute("myitemList",alist);
		model.addAttribute("list",alist.size());
		
		return "page/mypage/myitemList";
	}
}

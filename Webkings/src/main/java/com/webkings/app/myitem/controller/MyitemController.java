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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.member.model.MemberService;
import com.webkings.app.myitem.model.MyItemviewVO;
import com.webkings.app.myitem.model.MyitemService;
import com.webkings.app.myitem.model.MyitemVO;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;


@Controller
public class MyitemController {
	private static final Logger logger=LoggerFactory.getLogger(MyitemController.class);
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private MyitemService myitemService;
	
	@RequestMapping("/myitem.do")
	@ResponseBody
	public void insertMyitem(HttpSession session, @ModelAttribute MyitemVO vo,Model model){
		int mNo=(Integer)session.getAttribute("mNo");
		logger.info("myitem 처리 mNo={}",mNo);
		vo.setmNo(mNo);
		logger.info("myitem insert 처리 vo={}",vo );
		
			int count= myitemService.selectINO(mNo);
			logger.info("count={}",count);
			if(count<1){
				int cnt=myitemService.insertMyitem(vo);
				logger.info("myitem insert123 처리 cnt={}",cnt);
			}
		
	}
	
	@RequestMapping("/myitemList.do")
	public String myitemList(HttpSession session,@RequestParam(defaultValue="F") String gender, Model model){
		logger.info("myitem 목록");
		
		int mNo=(Integer)session.getAttribute("mNo");
		logger.info("myitem 목록 mNo={}",mNo);
		List<MyItemviewVO> alist= myitemService.selectMiTEMview(mNo);
		logger.info("myitem 목록 alist.size()={}",alist.size());
		
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
			
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("gender", gender);

		model.addAttribute("myitemList",alist);
		model.addAttribute("list",alist.size());
		
		
		
		return "page/mypage/myitemList"+gender;

	}
}

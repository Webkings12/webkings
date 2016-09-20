package com.webkings.app.myitem.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.webkings.app.item.model.ItemViewVO;
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
		logger.info("myitem 처리 vo={}",vo);
		vo.setmNo(mNo);
		logger.info("myitem insert 처리 vo={}",vo );
		
			int count= myitemService.selectINO(vo);
			logger.info("count={}",count);
			if(count<1){
				int cnt=myitemService.insertMyitem(vo);
				logger.info("myitem insert123 처리 cnt={}",cnt);
			}
		
	}
	
	@RequestMapping("/myitemList.do")
	public String myitemList(HttpSession session,@RequestParam(defaultValue="F") String gender, Model model){
		logger.info("myitem 목록");
		int pageNum=4;
		int mNo=(Integer)session.getAttribute("mNo");
		logger.info("myitem 목록 mNo={}",mNo);
		List<MyItemviewVO> alist= myitemService.selectMiTEMview(mNo);
		logger.info("myitem 목록 alist.size()={}",alist.size());
		
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
			
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("gender", gender);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("myitemList",alist);
		model.addAttribute("list",alist.size());
		
		return "page/mypage/myitemList"+gender;

	}
	
	@RequestMapping("/product.do")
	@ResponseBody
	public void product(@RequestParam int iNo,HttpServletRequest request,HttpSession session){
		logger.info("product  iNo={}",iNo);
		
		List<Integer> list = (List<Integer>)session.getAttribute("iNoList");
		if(list==null){
			list = new ArrayList<Integer>();
			session.setAttribute("iNoList", list);
		}
				list.add(iNo);
		}
		
		/*HttpSession session= request.getSession();
		
		session.setAttribute("i_No", iNo);*/
		
		
	
	@RequestMapping("/prodList.do")
	public String prodList(HttpSession session,@RequestParam(defaultValue="F") String gender, Model model){
		
		List<Integer> iNoList = (List<Integer>)session.getAttribute("iNoList");
		
		if(iNoList!=null){
		logger.info("prodList 목록 iNoList={}",iNoList);
		Map<String, Object> map= new HashMap<String, Object>();
		List<ItemViewVO> alist= new ArrayList<ItemViewVO>();
		
		for(int a:iNoList ){
			 alist= itemService.itemSelectiNo(a);
			 map.put("list"+a,alist);
		}
		logger.info("prodList 목록 list={}",map.size());
		
		model.addAttribute("myitemmap",map);
		model.addAttribute("size",map.size());
		}
		int pageNum=4;
		
		model.addAttribute("pageNum",pageNum);
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("gender", gender);
		return "page/mypage/prodList"+gender;
	}
	
	@RequestMapping("myitemdelete.do")
	@ResponseBody
	public int myitemdelete( @RequestParam int iNo,@RequestParam int mNo,Model model){
		logger.info("관심 목록 삭제 iNo={},mNo={}",iNo,mNo);
		
		MyitemVO vo= new MyitemVO();
		vo.setiNo(iNo);
		vo.setmNo(mNo);
		
		int cnt=myitemService.deleteMyitem(vo);
		logger.info("관심 목록 삭제결과 cnt={}",cnt);
		
		return cnt;
	}
}

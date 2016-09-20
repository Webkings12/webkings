package com.webkings.app.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.item.model.ItemSearchVO;
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.ItemViewVO;
import com.webkings.app.item.model.Item_TypeVO;

@Controller
public class AdminItemController {

	private static final Logger logger= LoggerFactory.getLogger(AdminItemController.class);
	
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/adminItemView.do")
	public String adminItemView(@RequestParam String gender,
			  @RequestParam(defaultValue="ALL") String cate, @RequestParam(defaultValue="0") String orderVal, 
			  @RequestParam(required=false) String sw2, @RequestParam(required=false) String ssp, @RequestParam(required=false) String sep,
			  @RequestParam(required=false) String sac,  Model model){
			if(orderVal==""){
				orderVal="0";
			}
			List<Item_TypeVO> itemList = itemService.selectItemType(gender);
			
			ItemSearchVO itemSearchVo = new ItemSearchVO();
			itemSearchVo.setSw2(sw2);
			itemSearchVo.setSac(sac);
			itemSearchVo.setCate(cate);
			itemSearchVo.setSsp(ssp);
			itemSearchVo.setSep(sep);
			itemSearchVo.setOrderVal(orderVal);
			
			String orderName="";
			if(orderVal.equals("0")){
				orderName="신상품순";
			}else if(orderVal.equals("1")){
				orderName="클릭순";
			}else if(orderVal.equals("2")){
				orderName="높은 가격순";
			}else if(orderVal.equals("3")){
				orderName="낮은 가격순";
			}
			logger.info("itemSearchVo={}", itemSearchVo);
			
		model.addAttribute("cateView", cate);
		model.addAttribute("itemList", itemList);
		model.addAttribute("orderName", orderName);
		model.addAttribute("itemSearchVo", itemSearchVo);
		model.addAttribute("gender", gender);
		return "page/admin/item";
	}
	
	@RequestMapping("/adminItemSel.do")
	@ResponseBody
	public Map<String, Object> adItemSel(@RequestParam String gender, 
			@RequestParam(defaultValue="ALL") String cate, @RequestParam String orderVal,
			@RequestParam(required=false) String sw2, @RequestParam(required=false) String ssp, @RequestParam(required=false) String sep,
			@RequestParam(required=false) String sac){
		
			if(orderVal==""){
				orderVal="0";
			}
			ItemViewVO itViewVo = new ItemViewVO();
			itViewVo.setItGender(gender);
			itViewVo.setItName(cate);
			itViewVo.setsAge("");
			logger.info("아이템 선택페이지에서 값들  cate,orderVal={},{}", cate,orderVal);
			logger.info("gender, temViewVo={}", itViewVo);
			
			List<ItemViewVO> selItemList = null;
			
			ItemSearchVO itemSearchVo = new ItemSearchVO();
			itemSearchVo.setSw2(sw2);
			itemSearchVo.setSac(sac);
			itemSearchVo.setCate(cate);
			itemSearchVo.setSsp(ssp);
			itemSearchVo.setSep(sep);
			itemSearchVo.setOrderVal(orderVal);
			itemSearchVo.setGender(gender);
			
			if(!sw2.equals("") && !sw2.isEmpty() || !ssp.equals("") && !ssp.isEmpty() || !sep.equals("") && !sep.isEmpty() || !sac.equals("") && !sac.isEmpty()){
				
				if(sac.equals("1")){
					sac="10";
				}else if(sac.equals("2")){
					sac="20";
				}else if(sac.equals("3")){
					sac="30";
				}else{
					sac=" ";
				}
				itemSearchVo.setSac(sac);
				
				logger.info("아이템 searchVo12={}", itemSearchVo);
				selItemList = itemService.itemSearch(itemSearchVo);
			}else{
				itViewVo.setDateType("");	
				if(orderVal.equals("0")){
					if(cate.equals("ALL")){
						selItemList= itemService.itemSelectAll(itViewVo);
					}else{
						selItemList= itemService.itemSelectName(itViewVo);
					}
				}
				else if(orderVal.equals("1")){
					if(cate.equals("ALL")){
						selItemList= itemService.itemClick(itViewVo);
					}else{
						itViewVo.setItName(cate);
						selItemList= itemService.itemClickCate(itViewVo);
					}
				}
				else if(orderVal.equals("2")){
					if(cate.equals("ALL")){
						selItemList= itemService.itemPriceDesc(itViewVo);
					}else{
						selItemList= itemService.itemDescCate(itViewVo);
					}
				}else if(orderVal.equals("3")){
					if(cate.equals("ALL")){
						selItemList= itemService.itemPriceAsc(itViewVo);
					}else{
						selItemList= itemService.itemAscCate(itViewVo);
					}
				}
			}
			int itAllCount=itemService.itemAllCount();
			
			
			Map<String, Object> resMap = new HashMap<String, Object>();
			resMap.put("itemList", selItemList);
			resMap.put("itAllCount", itAllCount);
			logger.info("ajax itemList={}", selItemList);
			return resMap;
	}
	@RequestMapping("/adminItemDel.do")
	public String adminItemView(@RequestParam int iNo, @RequestParam String gender, Model model){
		
		int cnt = itemService.itemDel(iNo);
		
		String msg="";
		String url="";
		if(cnt>0){
			msg="삭제 성공";
			url="/adminItemView.do?gender="+gender;
		}else{
			msg="삭제 실패";
			url="/adminItemView.do?gender="+gender;
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
}

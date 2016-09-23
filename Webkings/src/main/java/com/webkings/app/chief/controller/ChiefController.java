package com.webkings.app.chief.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.chief.model.ChiefService;
import com.webkings.app.chief.model.ChiefVO;
import com.webkings.app.common.FileUploadWabUtil;
import com.webkings.app.shop.model.ShopService;
import com.webkings.app.shop.model.ShopVO;

@Controller
@RequestMapping("/chief")
public class ChiefController {
	private static final Logger logger = LoggerFactory.getLogger(ChiefController.class);
	
	@Autowired
	private ChiefService chiefService;
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private FileUploadWabUtil fileUtil;
	
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
	
	@RequestMapping(value="/insertChiefChkId.do")
	@ResponseBody
	public String insertChiefChkId_get(@RequestParam(value = "id", required = false) String id){
		logger.info("arrive insertChiefChkId");
//		if (reqParam.equals("123@naver.com")) {
//			logger.info("1");
//		} else {
//			logger.info("2");
//		}
		logger.info("id={}", id);
		int count = chiefService.selectChiefId(id);
	    
		logger.info("selectCount",count);
		if (count == 0) {
			return "사용 가능합니다.";
		} else {
			return "이미 사용중인 아이디입니다.";
		}
	}
	
	@RequestMapping(value="/chief/chiefNShopInsert.do", method=RequestMethod.POST)
	public String chiefNShopInsert_post(@ModelAttribute ChiefVO chiefVO, @ModelAttribute ShopVO shopVO, HttpServletRequest request, Model model){
		logger.info("chiefNShopInsertFrom 기업회원 가입 chiefVOnShopVO add, 파라미터 ChiefVo={},{}",chiefVO, shopVO);
		
		//파일 업로드 처리
		int uploadTpye=fileUtil.ITEM_IMAGE_UPLOAD; // //아이템 이미지 업로드 value = 4
		List<Map<String,Object>> fileList = fileUtil.fileUPload(request, uploadTpye);
		
		//업로드된 파일명 구해오기
		String fileName="";
		//String ofileName="";
		//long fileSize=0;
		
		for(Map<String, Object> mymap :fileList){
			fileName=(String)mymap.get("fileName");
		}
		
		shopVO.setS_Bimage(fileName);
		shopVO.setS_Simage(fileName);
		int C_NO = chiefVO.getC_NO();
		shopVO.setC_NO(C_NO);
		
		int countChief = chiefService.insertChief(chiefVO);
		
		boolean insertResult;
		
		if (countChief == 1) {
			insertResult = true;
			//return "redirect:/chief/m_center.do";
		} else {
			insertResult = false;
			//return "redirect:/chief/addChief.do"; 
		}		

		if (insertResult) {
			int countShop  = shopService.insertShop(shopVO);
			
			if (countShop == 1) {
				return "redirect:/chief/m_center.do";
			} else {
				return "redirect:/chief/addChief.do"; 
			}
		} else {
			return "";
		}
	}
}

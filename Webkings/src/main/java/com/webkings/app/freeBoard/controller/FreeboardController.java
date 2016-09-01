package com.webkings.app.freeBoard.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;

import com.webkings.app.common.FileUploadWebUtil;
import com.webkings.app.freeBoard.model.FreeBoardVO;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	public static final Logger logger=
			LoggerFactory.getLogger(FreeboardController.class);

	@Autowired
	FileUploadWebUtil fileUtil;
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write_get(){
		//1.
		logger.info("자게 글쓰기창 띄우기");
		//2.
		
		//3.
		return "board/freeboard/write";
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String write_post(@ModelAttribute FreeBoardVO fboardVo,
			HttpServletRequest request,
			HttpSession session,Model model){
		//1.
		logger.info("자게 글쓰기 파라미터 fboardVo={}",fboardVo);
		
		//2.
		
		//파일 업로드 처리
		int uploadType=FileUploadWebUtil.IMAGE_UPLOAD;
		
		List<Map<String,Object>> fileList=fileUtil.fileUpload(request, uploadType);
		//업로드된 파일명 구해오기

		String fileName="";
		long fileSize=0;
		for(Map<String, Object> mymap :fileList){
			fileName=(String)mymap.get("fileName");
			fileSize=(Long)mymap.get("fileSize");
		}
		
		fboardVo.setbFilename(fileName);
		fboardVo.setbFilesize(fileSize);
		logger.info("글쓰기 파라미터 fboardVo={}",fboardVo);
		
		//3.
		return "redirect:/board/freeboard/list.do";
	}
	
	@RequestMapping("/list.do")
	public String freeBoardList(){
		//1.
		
		//2.
		
		//3.
		
		return "board/freeboard/list";
	}
	
}

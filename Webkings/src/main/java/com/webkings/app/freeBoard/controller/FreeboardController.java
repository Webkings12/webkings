package com.webkings.app.freeBoard.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.webkings.app.common.FileUploadWabUtil;
import com.webkings.app.common.FreeboardSearchVO;
import com.webkings.app.common.PaginationInfo;
import com.webkings.app.common.SearchVO;
import com.webkings.app.freeBoard.model.BoardViewVO;
import com.webkings.app.freeBoard.model.FreeBoardService;
import com.webkings.app.freeBoard.model.FreeBoardVO;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	public static final Logger logger=
			LoggerFactory.getLogger(FreeboardController.class);
	
	@Autowired
	private FreeBoardService fBoardService;

	@Autowired
	private FileUploadWabUtil fileUtil;
	
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
		
		int uploadTpye=fileUtil.BOARD_IMAGE_UPLOAD;
		//파일 업로드 처리
		
		List<Map<String,Object>> fileList=fileUtil.fileUPload(request, uploadTpye);
		//업로드된 파일명 구해오기

		String fileName="";
		String ofileName="";
		long fileSize=0;
		for(Map<String, Object> mymap :fileList){
			fileName=(String)mymap.get("fileName");
			fileSize=(Long)mymap.get("fileSize");
			ofileName=(String)mymap.get("ofileName");
		}
		fboardVo.setbFilename(fileName);
		fboardVo.setbFilesize(fileSize);
		fboardVo.setbOriginalfilename(ofileName);
		int mNo=(Integer)session.getAttribute("mNo");
		fboardVo.setmNo(mNo);
		
		logger.info("글쓰기 업로드처리, 파라미터 fboardVo={}",fboardVo);
		
		int cnt=fBoardService.insertFreeBoard(fboardVo);
		logger.info("글쓰기 결과cnt={}",cnt);
		
		if(cnt>0){
			logger.info("글쓰기 결과cnt={}",cnt);
			return "redirect:/freeboard/list.do";
		}else{
			logger.info("글쓰기 결과cnt={}",cnt);
			return "redirect:/freeboard/write.do";
			
		}
		
	
	}
	
	@RequestMapping("/list.do")
	public String freeBoardList(FreeboardSearchVO searchVo,Model model){
		/*3. 글목록 조회
		
		reBoard/list.do => ReBoardListController
		=> /reBoard/list.jsp
		//1. 파라미터 읽어오기*/
		logger.info("글목록 조회, 파라미터 searchVo={}",
				searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10); //블록사이즈
		pagingInfo.setRecordCountPerPage(15); //페이지에 보여줄 레코드수
		pagingInfo.setCurrentPage(searchVo.getCurrentPage()); //현제 페이지
		
		searchVo.setBlockSize(10); 
		searchVo.setRecordCountPerPage(15);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex()); //시작 레코드
				
		//2. db작업 - select
		List<BoardViewVO> alist = fBoardService.freeBoardselectAll(searchVo);
		logger.info("글목록 조회 결과 alist.size()={}", 
				alist.size());
		
		//전체 레코드 개수 조회하기
		int totalRecord 
			= fBoardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		//3. 결과 저장, 뷰페이지 리턴
		model.addAttribute("alist", alist);
		model.addAttribute("searchVo", searchVo);
		
		model.addAttribute("pagingInfo", pagingInfo);
		
		
		return "board/freeboard/list";
	}
	
	@RequestMapping("/listView.do")
	public String freeBoardListView(FreeboardSearchVO searchVo,Model model){
		/*3. 글목록 조회
		
		reBoard/list.do => ReBoardListController
		=> /reBoard/list.jsp
		//1. 파라미터 읽어오기*/
		logger.info("글목록 조회, 파라미터 searchVo={}",
				searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10); //블록사이즈
		pagingInfo.setRecordCountPerPage(15); //페이지에 보여줄 레코드수
		pagingInfo.setCurrentPage(searchVo.getCurrentPage()); //현제 페이지
		
		searchVo.setBlockSize(10); 
		searchVo.setRecordCountPerPage(15);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex()); //시작 레코드
				
		//2. db작업 - select
		List<BoardViewVO> alist = fBoardService.freeBoardselectAll(searchVo);
		logger.info("글목록 조회 결과 alist.size()={}", 
				alist.size());
		
		//전체 레코드 개수 조회하기
		int totalRecord 
			= fBoardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		//3. 결과 저장, 뷰페이지 리턴
		model.addAttribute("alist", alist);
		model.addAttribute("searchVo", searchVo);
		
		model.addAttribute("pagingInfo", pagingInfo);
		
		
		return "board/freeboard/listView";
	}
	
	@RequestMapping("/updateCount.do")
	public String updateCount(@RequestParam(defaultValue="0") int no, Model model){
		//1. 파라미터 읽기
		logger.info("조회수 증가, 파라미터 no={}",no);
			
		//2. db작업
		int cnt=fBoardService.updateCount(no);
		
		logger.info("조회수 증가 결과, cnt={}",cnt);
		//3 결과저장 , 뷰 페이지 리턴
		
		return "redirect:/freeboard/detail.do?no="+no;
		
	}
	
	@RequestMapping("/detail.do")
	public String boardDetail(@RequestParam(defaultValue="0") int no
			,Model model){
		//1.파라미터 읽기
		logger.info("글상세보기 파라미터 no={}",no);
		
		//2. db작업
		int cnt=fBoardService.updateCount(no);
		
		logger.info("조회수 증가 결과, cnt={}",cnt);
		//1.파라미터가 x
		if(no==0){
			model.addAttribute("msg","잘못된zzz url입니다");
			model.addAttribute("url","/freeboard/list.do");
			
			return "common/message";
		}
		
		//2. db작업
		BoardViewVO vo=fBoardService.selectByNo(no);
		int beforeNo=fBoardService.selectBefore(no);
		int nextNo=fBoardService.selectNext(no);
		
		//3. 결과저장, 뷰페이지 리턴
		model.addAttribute("vo",vo);
		model.addAttribute("beforeNo",beforeNo);
		model.addAttribute("nextNo",nextNo);
		
		return "board/freeboard/detail";
	}
	
	@RequestMapping(value="/edit.do",method=RequestMethod.GET)
	public String editBoard(@RequestParam(defaultValue="0")int no,Model model){
		//1.
		logger.info("수정화면 보이기 파라미터 no={}",no);
		//2.
		BoardViewVO vo=fBoardService.selectByNo(no);
		logger.info("수정 파라미터 vo={}",vo);
		//3. 결과저장, 뷰페이지 리턴
		model.addAttribute("vo",vo);
		
		return "board/freeboard/edit";
	}
	
	
	
	
	@RequestMapping(value="/edit.do",method=RequestMethod.POST)
	public String edit_post(@ModelAttribute FreeBoardVO fboardVo,HttpServletRequest request,
			@RequestParam String oldFilename,@RequestParam String oldOriginfilename,@RequestParam long oldFilesize
			,Model model){
		
		
		//1.
		logger.info("글 수정 처리, 파라미터 fboardVo={},oldFileName={}", fboardVo,oldFilename);
		logger.info("oldOriginFileName={},oldFileSize={}",oldOriginfilename,oldFilesize);
		
		int uploadTpye=fileUtil.BOARD_IMAGE_UPLOAD;
		
		List<Map<String, Object>> fileList=
				fileUtil.fileUPload(request, uploadTpye);
		String fileName="";
		String ofileName="";
		long fileSize=0;
		if(fileList!=null && !fileList.isEmpty()){
			for( Map<String, Object> mymap:fileList){
				fileName=(String)mymap.get("fileName");
				fileSize=(Long)mymap.get("fileSize");
				ofileName=(String)mymap.get("ofileName");
				fboardVo.setbFilename(fileName);
				fboardVo.setbFilesize(fileSize);
				fboardVo.setbOriginalfilename(ofileName);
			}
			//기존파일 삭제
			String upPath= fileUtil.getUploadPath(request, uploadTpye);
			File oldFile=new File(upPath,oldFilename);
			if(oldFile.exists()){
				boolean bool=oldFile.delete();
				logger.info("기존 파일 삭제 여부={}",bool);
			}
		}else{
			fboardVo.setbFilename(oldFilename);
			fboardVo.setbOriginalfilename(oldOriginfilename);
			fboardVo.setbFilesize(oldFilesize);
		}
		logger.info("업로드 처리 후 , fboardVo,",fboardVo);
		
		int cnt=fBoardService.updateBoard(fboardVo);
		String msg="",url="";
		if(cnt>0){
			msg="수정 완료";
			url="/freeboard/detail.do?no="+fboardVo.getbNo();
		}else{
			msg="수정 실패";
			url="/freeboard/edit.do?no="+fboardVo.getbNo();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam(defaultValue="0") int bNo,Model model){
		//1.
		logger.info("삭제 파라미터 bNo={}",bNo);
		if(bNo==0){
			model.addAttribute("msg","잘못된 url입니다");
			model.addAttribute("url","/freeboard/list.do");
			
			return "common/message";
		}
		//2.
		logger.info("여기서 에러냐?");
		int cnt=fBoardService.deleteBoard(bNo);
		//3.
		String msg="",url="";
		if(cnt>0){
			msg="삭제 완료";
			url="/freeboard/list.do";
		}else{
			msg="삭제 실패";
			url="/freeboard/detail.do?no="+bNo;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}

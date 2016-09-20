package com.webkings.app.admin.controller;

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
import com.webkings.app.freeBoard.model.FreeboardListVO;
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

@Controller
@RequestMapping("/admin/freeboard")
public class AdminFreeboardController {
	public static final Logger logger=
			LoggerFactory.getLogger(AdminFreeboardController.class);
	
	@Autowired
	private FreeBoardService fBoardService;

	@Autowired
	private FileUploadWabUtil fileUtil;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write_get(@RequestParam(defaultValue="F") String gender, Model model){
		//1.
		logger.info("자게 글쓰기창 띄우기");
		//2.
		
		/* [헤더관련 필요한것 승수] 헤더에 라인달기*/
		int pageNum=3;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		
		//3.
		return "board/freeboard/write";
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String write_post(@ModelAttribute FreeBoardVO fboardVo,
			HttpServletRequest request,
			HttpSession session,@RequestParam(defaultValue="F") String gender,Model model){
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
		
		
		/* [헤더관련 필요한것 승수] 헤더에 라인달기*/
		int pageNum=3;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		
		String msg="", url="";
		if(cnt>0){
			msg="";
			url="/freeboard/list.do?gender="+gender;
		}else{
			msg="";
			url="/freeboard/write.do?gender="+gender;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	
	}
	
	@RequestMapping("/list.do")
	public String freeBoardList(FreeboardSearchVO searchVo, @RequestParam(defaultValue="F") String gender, Model model){
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
		
		
		/* [헤더관련 필요한것 승수] 헤더에 라인달기*/
		int pageNum=3;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		
		
		//전체 레코드 개수 조회하기
		int totalRecord 
			= fBoardService.selectTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		//3. 결과 저장, 뷰페이지 리턴
		model.addAttribute("alist", alist);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("pagingInfo", pagingInfo);
		
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		
		return "page/admin/board/freeboardList";
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
	
	
	@RequestMapping("/detail.do")
	public String boardDetail(@RequestParam(defaultValue="0") int no
			,@RequestParam(defaultValue="F") String gender,Model model){
		//1.파라미터 읽기
		logger.info("글상세보기 파라미터 no={}",no);
		
		//2. db작업
		//조회수 증가!
		//int cnt=fBoardService.updateCount(no);
		//logger.info("조회수 증가 결과, cnt={}",cnt);

		//1.파라미터가 x
		if(no==0){
			model.addAttribute("msg","잘못된 url입니다");
			model.addAttribute("url","/admin/board/freeboard/list.do");
			
			return "common/message";
		}
		
		//2. db작업
		BoardViewVO vo=fBoardService.selectByNo(no);
		int beforeNo=fBoardService.selectBefore(no);
		int nextNo=fBoardService.selectNext(no);
		
		int pageNum=3;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		
		//3. 결과저장, 뷰페이지 리턴
		model.addAttribute("vo",vo);
		model.addAttribute("beforeNo",beforeNo);
		model.addAttribute("nextNo",nextNo);
		
		return "page/admin/board/detail";
	}
	
	@RequestMapping(value="/edit.do",method=RequestMethod.GET)
	public String editBoard(@RequestParam(defaultValue="0")int no,@RequestParam(defaultValue="F") String gender, Model model){
		//1.
		logger.info("수정화면 보이기 파라미터 no={}",no);
		//2.
		BoardViewVO vo=fBoardService.selectByNo(no);
		logger.info("수정 파라미터 vo={}",vo);
		
		int pageNum=3;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		//3. 결과저장, 뷰페이지 리턴
		model.addAttribute("vo",vo);
		
		return "page/admin/board/edit";
	}
	
	
	
	
	@RequestMapping(value="/edit.do",method=RequestMethod.POST)
	public String edit_post(@ModelAttribute FreeBoardVO fboardVo,HttpServletRequest request,
			@RequestParam String oldFilename,@RequestParam String oldOriginfilename,@RequestParam long oldFilesize
			,@RequestParam(defaultValue="F") String gender,Model model){
		
		
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
			url="/admin/freeboard/detail.do?no="+fboardVo.getbNo()+"&gender="+gender;
		}else{
			msg="수정 실패";
			url="/admin/freeboard/edit.do?no="+fboardVo.getbNo()+"&gender="+gender;
		}
		
		int pageNum=3;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam(defaultValue="0") int bNo,@RequestParam(defaultValue="F") String gender,Model model){
		//1.
		logger.info("삭제 파라미터 bNo={}",bNo);
		if(bNo==0){
			model.addAttribute("msg","잘못된 url입니다");
			model.addAttribute("url","/freeboard/list.do?gender="+gender);
			
			return "common/message";
		}
		//2.
		logger.info("여기서 에러냐?");
		int cnt=fBoardService.deleteBoard(bNo);
		//3.
		String msg="",url="";
		if(cnt>0){
			msg="삭제 완료";
			url="/freeboard/list.do?gender="+gender;
		}else{
			msg="삭제 실패";
			url="/freeboard/detail.do?no="+bNo;
		}
		
		int pageNum=3;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/deleteMuti.do")
	public String deleteMulit(@ModelAttribute FreeboardListVO listVo,HttpServletRequest request,Model model){
		
		List<BoardViewVO> boardList=listVo.getBoardItem();
		logger.info(boardList.toString());
		
		int cnt=fBoardService.deleteboard(boardList);
		
		String msg="" ,url="/admin/freeboard/list.do";
		
		if(cnt>0){
			
			for(int i=0;i<boardList.size();i++){
				BoardViewVO boardVo=boardList.get(i);
				int bNo=boardVo.getbNo();
				String bFilename=boardVo.getbFilename();
				if(bNo!=0){
					String upPath=fileUtil.getUploadPath(request, fileUtil.BOARD_IMAGE_UPLOAD);
					
					File delFile=new File(upPath,bFilename);
					delFile.delete();
					if(delFile.exists()){
						boolean bool=delFile.delete();
						logger.info("파일 삭제 결과={}",bool);
					}
						
				}
				
			}
			msg="삭제성공";
		}else{
			msg="삭제실패";	
		}		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		//3.
		return "common/message";
		
	}
	
}


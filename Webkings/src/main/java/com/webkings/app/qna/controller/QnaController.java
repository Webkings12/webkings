package com.webkings.app.qna.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.common.PaginationInfo;
import com.webkings.app.common.SearchVO;
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.qna.model.QnaService;
import com.webkings.app.qna.model.QnaVO;
import com.webkings.app.qna.model.QnaViewVo;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	private static final Logger logger
		=LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StyleService styleService;
	
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String qnaView(@RequestParam(defaultValue="F") String gender,Model model){
		//1.
		logger.info("QnA창 보이기");
		//2.
		
		int pageNum=4;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		//3.
		return "board/qna/write";
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String qnaSend(@ModelAttribute QnaVO qnaVo,HttpSession session,@RequestParam(defaultValue="F") String gender,Model model){
		//1.
		
		String mEmail=(String)session.getAttribute("mEmail");
		int mNo=(Integer)session.getAttribute("mNo");
		qnaVo.setmNo(mNo);
		qnaVo.setqEmail(mEmail);
		logger.info("QnA전송 파라미터 QnaVo={}",qnaVo);
		//2.
		
		
		int cnt=0;
		logger.info("Qna 시작전 cnt={}",cnt);
		cnt=qnaService.insertQna(qnaVo);
		logger.info("Qna결과 cnt={}",cnt);
		//3.
		
		String msg="", url="";
		if(cnt>0){
			msg="문의전송";
			url="/qna/list.do?gender="+gender;
		}else{
			msg="전송실패";
			url="/qna/write.do?gender="+gender;
		}
		
		int pageNum=4;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/list.do")
	public String qnaList(SearchVO searchVo,HttpSession session,@RequestParam(defaultValue="F") String gender,Model model){
		//1. 파라미터 읽어오기
		
		String mType=(String)session.getAttribute("mType");
		String mEmail=(String)session.getAttribute("mEmail");
		if(!mType.equals("0")){
			searchVo.setSearchKeyword(mEmail);
			searchVo.setSearchCondition("m_email");
		}
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
		List<QnaViewVo> alist = qnaService.qnaSelectAll(searchVo);
		logger.info("글목록 조회 결과 alist.size()={}", 
				alist.size());
		
		//전체 레코드 개수 조회하기
		int totalRecord 
			= qnaService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		//3. 결과 저장, 뷰페이지 리턴
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		int pageNum=4;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		
		
		return "board/qna/list";
	}
	@RequestMapping("/listView.do")
	public String qnaListView(SearchVO searchVo,HttpSession session,@RequestParam(defaultValue="F") String gender,Model model){
		//1. 파라미터 읽어오기
		String mType=(String)session.getAttribute("mType");
		String mEmail=(String)session.getAttribute("mEmail");
		if(!mType.equals("0")){
			searchVo.setSearchKeyword(mEmail);
			searchVo.setSearchCondition("m_email");
		}
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
		List<QnaViewVo> alist = qnaService.qnaSelectAll(searchVo);
		logger.info("글목록 조회 결과 alist.size()={}", 
				alist.size());
		
		//전체 레코드 개수 조회하기
		int totalRecord 
			= qnaService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		int pageNum=4;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
				
		//3. 결과 저장, 뷰페이지 리턴
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "board/qna/listView";
	}
	
	@RequestMapping("/detail.do")
	public String qnaDetail(@RequestParam(defaultValue="0") int no,HttpSession session,@RequestParam(defaultValue="F") String gender,Model model){
		//1.파라미터 읽기
		logger.info("qna상세보기 파라미터 no={}",no);
		//1.파라미터가 x
		if(no==0){
			model.addAttribute("msg","잘못된 url입니다");
			model.addAttribute("url","/qna/list.do"+"&gender="+gender);
			
			return "common/message";
		}
		
		//2. db작업
		QnaViewVo vo=qnaService.selectByNo(no);
		
		int mNo=(Integer)session.getAttribute("mNo");
		String mType=(String)session.getAttribute("mType");
		
		if(vo.getmNo()!=mNo && !mType.equals("0")){
			model.addAttribute("msg","권한이 없습니다");
			model.addAttribute("url","/qna/list.do");
			
			return "common/message";
		}
		
		int nextNo=qnaService.selectNext(no);
		int beforeNo=qnaService.selectBefore(no);
		logger.info("qna상세보기 결과 vo={}",vo);
		//3. 결과저장, 뷰페이지 리턴
		model.addAttribute("vo",vo);
		model.addAttribute("nextNo",nextNo);
		model.addAttribute("beforeNo",beforeNo);
		
		int pageNum=4;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		return "board/qna/detail";
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam(defaultValue="0") int qNo,@RequestParam(defaultValue="F") String gender,Model model){
		//1.
		logger.info("qna삭제 파라미터 qNo={}",qNo);
		if(qNo==0){
			model.addAttribute("msg","잘못된 url입니다");
			model.addAttribute("url","/qna/list.do"+"&gender="+gender);
			
			return "common/message";
		}
		//2.
		logger.info("여기서 에러냐?");
		int cnt=qnaService.deleteQna(qNo);
		//3.
		String msg="",url="";
		if(cnt>0){
			msg="삭제 완료";
			url="/qna/list.do?gender="+gender;
		}else{
			msg="삭제 실패";
			url="/qna/detail.do?no="+qNo+"&gender="+gender;
		}
		
		int pageNum=4;
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
	@RequestMapping(value="/edit.do",method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue="0") int qNo,HttpSession session,@RequestParam(defaultValue="F") String gender,Model model){
		if(qNo==0){
			model.addAttribute("msg","잘못된 url입니다");
			model.addAttribute("url","/qna/list.do"+"&gender="+gender);
			
			return "common/message";
		}
		
		QnaViewVo vo=qnaService.selectByNo(qNo);
		
		int mNo=(Integer)session.getAttribute("mNo");
		String mType=(String)session.getAttribute("mType");
		
		if(vo.getmNo()!=mNo && !mType.equals("0")){
			model.addAttribute("msg","권한이 없습니다");
			model.addAttribute("url","/qna/list.do"+"&gender="+gender);
			
			return "common/message";
		}
		
		int pageNum=4;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		model.addAttribute("qVo",vo);
		return "board/qna/edit";
	}
	
	@RequestMapping(value="/edit.do",method=RequestMethod.POST)
	public String edit_post(@ModelAttribute QnaVO vo,@RequestParam(defaultValue="F") String gender, Model model){
		logger.info("qna 수정 파라미터 vo={}",vo);
		
		int cnt=qnaService.updateQna(vo);
		logger.info("qna 수정 파라미터 cnt={}",cnt);
		String msg="",url="";
		if(cnt>0){
			msg="수정 완료";
			url="/qna/detail.do?no="+vo.getqNo()+"&gender="+gender;
		}else{
			msg="수정 실패";
			url="/qna/edit.do?qNo="+vo.getqNo()+"&gender="+gender;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		int pageNum=4;
		List<Item_TypeVO> itemList = itemService.selectItemType(gender);
		List<StyleVO> styleList = styleService.selectStyle(gender);
		
		model.addAttribute("styleList", styleList);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gender",gender);
		
		return "common/message";
	}
	
	
}

package com.webkings.app.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.webkings.app.common.FileUploadWabUtil;
import com.webkings.app.common.PaginationInfo;
import com.webkings.app.common.SearchVO;
import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	private static final Logger logger=LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FileUploadWabUtil fileUtil;
	
	@RequestMapping("/memberList.do")
	public String memberList(SearchVO searchVo,  HttpSession session, Model model) {
		String m_Type=(String)session.getAttribute("adminmType"); 
		logger.info("회원리스트 보여주기 mType={}",m_Type);
		PaginationInfo pagingInfo = new PaginationInfo();
		List<MemberVo> memberList=new ArrayList<MemberVo>();
		if(m_Type!=null && !m_Type.isEmpty()){
			if(m_Type.equals("1")){
				model.addAttribute("msg","권한이 없습니다");
				model.addAttribute("url","/admin.do");
				return "common/message";
			}else if(m_Type.equals("0")){
				pagingInfo.setBlockSize(10); //블록사이즈
				pagingInfo.setRecordCountPerPage(5); //페이지에 보여줄 레코드수
				pagingInfo.setCurrentPage(searchVo.getCurrentPage()); //현재 페이지
				
				searchVo.setRecordCountPerPage(5);
				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex()); //시작 레코드
				
				memberList=memberService.selectList(searchVo);
				logger.info("회원리스트 보여주기 memberList={}",memberList.size());
				
				int totalRecord 
				= memberService.TotalRecord(searchVo);
				pagingInfo.setTotalRecord(totalRecord);
			}
		}
		model.addAttribute("memberList",memberList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchVo", searchVo);
		
		return "page/admin/memberList";
	}
	
	@RequestMapping("/memberQuit.do")
	public String memberQuit_post(HttpServletRequest request,HttpSession session ,@RequestParam(defaultValue="") String mImage,
			@RequestParam(defaultValue="") String mEmail, Model model){
		logger.info("회원탈퇴처리 mEmail={},mImage={}",mEmail,mImage);
		
		String msg="",url="/admin/memberList.do";
		
		int cnt=memberService.deleteMember(mEmail);
		logger.info("회원탈퇴처리결과 cnt={}",cnt);
		if(cnt>0){
			String upPath=fileUtil.getUploadPath(request, fileUtil.IMAGE_UPLOAD);
		
			File delfile= new File(upPath, mImage);
			if(delfile.exists()){
				boolean bool= delfile.delete();
				logger.info("파일 삭제 결과={}",bool);	
			}
			
			
				msg="선택한 회원들을 삭제하였습니다.";
			}else{
				msg="선택한 회원들을  삭제하지 못했습니다.";
			}//if	
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
	}
	@RequestMapping("/memberDeleteList.do")
	public String memberDeleteList(
		@ModelAttribute AdminMemberListVO memberDelList, 
		HttpServletRequest request, Model model){
		
		logger.info("관리자 - 선택한 회원 삭제, 파라미터 "
				+ "memberDelList={}", memberDelList);
		
		List<MemberVo> memberList = memberDelList.getMemberDelList();
		logger.info("memberList.size()={}", memberList.size());

		int cnt = memberService.deletememberList(memberList);
		logger.info("선택한 회원 삭제 처리 결과, cnt={}", cnt);
		
		String msg="",url="/admin/memberList.do";
		if(cnt>0){
			for(int i=0;i<memberList.size();i++){
				MemberVo memberVo = memberList.get(i);
				
				int mNo = memberVo.getmNo();
				String mImage = memberVo.getmImage();
				
				logger.info("i={}", i);
				logger.info("mNo={}, mImage={}",
						mNo, mImage);
				
				//체크한 상품만 파일 삭제
				if(mNo!=0){
					// 업로드 경로
					String upPath=fileUtil.getUploadPath(request, fileUtil.IMAGE_UPLOAD);
				
					//File 객체 생성후 파일 삭제
					File delfile= new File(upPath, mImage);
					if(delfile.exists()){
						boolean bool= delfile.delete();
						logger.info("파일 삭제 결과={}",bool);
					}
				}
			}//for
			
			msg="선택한 회원들을 삭제하였습니다.";
		}else{
			msg="선택한 회원들을  삭제하지 못했습니다.";
		}//if	
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "common/message";
	}
	
	@RequestMapping("/adminEdit.do")
	public String memberEdit_post(@ModelAttribute MemberVo membervo, 
			@RequestParam(defaultValue="") String oldmImage, HttpServletRequest request, Model model){
		
		logger.info("관리자-회원수정처리 membervo={}",membervo);
		
		int uploadTpye=fileUtil.IMAGE_UPLOAD;
		
		List<Map<String, Object>> fileList=
				fileUtil.fileUPload(request, uploadTpye);
		String fileName="";
		for(Map<String, Object> mymap:fileList){
			fileName=(String)mymap.get("fileName");
		}
		membervo.setmImage(fileName);
		logger.info("관리자-fileName이름={}",fileName);
		
		if(oldmImage!=""){
			String upPath=fileUtil.getUploadPath(request, fileUtil.IMAGE_UPLOAD);
			logger.info("oldmImage이름={}",oldmImage);
			
			File delfile= new File(upPath, oldmImage);
			if(delfile.exists()){
				boolean bool= delfile.delete();
				logger.info("관리자-파일 삭제 결과={}",bool);
			}	
		}
		String msg="", url="/admin/memberList.do";
		int cnt=memberService.updateAdmin(membervo);
		logger.info("관리자-회원수정처리결과 cnt={}",cnt);
		
		if(cnt>0){
			msg="회원정보가 수정되었습니다";
		}else{
			msg="회원정보 수정이 실패 되었습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
}

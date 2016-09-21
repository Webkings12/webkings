package com.webkings.app.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
	public String memberList(HttpSession session, Model model) {
		String m_Type=(String)session.getAttribute("mType"); 
		logger.info("회원리스트 보여주기 mType={}",m_Type);
		List<MemberVo> memberList=new ArrayList<MemberVo>();
		if(!m_Type.equals("0")){
			model.addAttribute("msg","권한이 없습니다");
			model.addAttribute("url","/admin.do");
			return "common/message";
		}else {
			memberList=memberService.selectList();
			logger.info("회원리스트 보여주기 memberList={}",memberList.size());
		}
		model.addAttribute("memberList",memberList);
		
		return "page/admin/memberList";
	}
	
	@RequestMapping("/memberQuit.do")
	public String memberQuit_post(HttpServletRequest request,HttpSession session ,@RequestParam(defaultValue="") String mImage,
			@RequestParam(defaultValue="") String mEmail){
		logger.info("회원탈퇴처리 mEmail={},mImage={}",mEmail,mImage);
		
		int cnt=memberService.deleteMember(mEmail);
		logger.info("회원탈퇴처리결과 cnt={}",cnt);
		
			String upPath=fileUtil.getUploadPath(request, fileUtil.IMAGE_UPLOAD);
		
			File delfile= new File(upPath, mImage);
			if(delfile.exists()){
				boolean bool= delfile.delete();
				logger.info("파일 삭제 결과={}",bool);	
			}
			
			session.removeAttribute("mEmail");
			session.removeAttribute("mNick");
			session.removeAttribute("mNo");
			session.removeAttribute("mImage");
			session.removeAttribute("mType");
			session.removeAttribute("mPwd");
		
		
			return "page/admin/memberList";
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
	
	
}

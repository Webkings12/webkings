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
	
}

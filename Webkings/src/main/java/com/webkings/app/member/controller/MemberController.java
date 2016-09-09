package com.webkings.app.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.RequestMethod;

import com.webkings.app.common.FileUploadWabUtil;
import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;



@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FileUploadWabUtil fileUtil;
	
	/*@RequestMapping("/tos.do")
	public String tos_get(){
		logger.info("이용약관 화면 보여주기");
		
		return "member/tos";
	}
	*/
	/*@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String register_get(){
		logger.info("회원가입 화면 보여주기");
		
		return "member/register";
	}*/
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register_post(@ModelAttribute MemberVo memberVo,
			HttpServletRequest request, Model model){
		logger.info("회원가입 처리, 파라미터 MemberVo={}",memberVo);
		int count=memberService.selectmCount(memberVo.getmEmail());
		
		int uploadTpye=fileUtil.IMAGE_UPLOAD;
		
		List<Map<String, Object>> fileList=
				fileUtil.fileUPload(request, uploadTpye);
		String fileName="";
		for( Map<String, Object> mymap:fileList){
			fileName=(String)mymap.get("fileName");
		}
			memberVo.setmImage(fileName);
			int cnt= memberService.insertMember(memberVo);
			logger.info("회원가입 처리, 파라미터 cnt={}",cnt);
		return "redirect:/page.do";
	}
	
	/*@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login_get(){
		//1.
		logger.info("로그인 화면 보여주기");
		
		return "member/login";
	}*/
	@RequestMapping(value="/login.do")
	public String login_post(@ModelAttribute MemberVo memberVo,
			HttpServletRequest request,HttpServletResponse response,String chkId,Model model){
		logger.info("로그인 파라미터, memberVo={}",memberVo);
		
		int result=memberService.loginCheck(memberVo);
		
		String msg="", url="/page.do";
		if(result==MemberService.LOGIN_OK){
			
			memberVo =memberService.selectmEmail(memberVo.getmEmail());
			HttpSession session= request.getSession();
			session.setAttribute("mEmail", memberVo.getmEmail());
			session.setAttribute("mNick", memberVo.getmNick());
			session.setAttribute("mNo", memberVo.getmNo());
			session.setAttribute("mType", memberVo.getmType());
			
			Cookie ck= new Cookie("ck_mEmail", memberVo.getmEmail());
			if(chkId!=null){
				ck.setMaxAge(1*24*60*60); 
				response.addCookie(ck);				
			}else{
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			msg=memberVo.getmNick()+"님 환영합니다";
			
		}else if (result==memberService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다";
		}else if (result==memberService.ID_NONE) {
			msg="아이디가 없습니다";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		
		session.removeAttribute("mEmail");
		session.removeAttribute("mNick");
		session.removeAttribute("mNo");
		
		return "redirect:/page.do";
	}
	
}

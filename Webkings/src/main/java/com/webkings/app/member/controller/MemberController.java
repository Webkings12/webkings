package com.webkings.app.member.controller;

import java.io.File;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.common.FileUploadWabUtil;
import com.webkings.app.item.model.ItemService;
import com.webkings.app.item.model.Item_TypeVO;
import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;
import com.webkings.app.style.model.StyleService;
import com.webkings.app.style.model.StyleVO;



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
	@ResponseBody
	public int login_post(@ModelAttribute MemberVo memberVo,
			HttpServletRequest request,HttpServletResponse response,String chkId,Model model){
		logger.info("로그인 파라미터, memberVo={}",memberVo);
		
		int result=memberService.loginCheck(memberVo);
		
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
		
		}
		return result;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		
		session.removeAttribute("mEmail");
		session.removeAttribute("mNick");
		session.removeAttribute("mNo");
		
		return "redirect:/page.do";
	}
	
	
	@RequestMapping("/memberEdit.do")
	public String memberEdit_post(@ModelAttribute MemberVo membervo, 
			@RequestParam(defaultValue="") String oldmImage,
			@RequestParam(defaultValue="") String chgmpwd,
			HttpSession session, HttpServletRequest request, Model model){
		
		String mEmail=(String)session.getAttribute("mEmail");
		logger.info("회원수정처리 membervo={}mEmail={}",membervo,mEmail);
		
		membervo.setmEmail(mEmail);
		if(chgmpwd!=null && !chgmpwd.isEmpty()){
			membervo.setmPwd(chgmpwd);
		}
		
		int uploadTpye=fileUtil.IMAGE_UPLOAD;
		
		List<Map<String, Object>> fileList=
				fileUtil.fileUPload(request, uploadTpye);
		String fileName="";
		for(Map<String, Object> mymap:fileList){
			fileName=(String)mymap.get("fileName");
		}
		membervo.setmImage(fileName);
		logger.info("fileName이름={}",fileName);
		
		if(oldmImage!=""){
			String upPath=fileUtil.getUploadPath(request, fileUtil.IMAGE_UPLOAD);
		
			File delfile= new File(upPath, oldmImage);
			if(delfile.exists()){
				boolean bool= delfile.delete();
				logger.info("파일 삭제 결과={}",bool);
		}	
	
		}
		String msg="", url="/member/memberEdit.do";
		int cnt=memberService.updateMember(membervo);
		logger.info("회원수정처리결과 cnt={}",cnt);
		
		if(cnt>0){
			msg="회원정보가 수정되었습니다";
		}else{
			msg="회원정보 수정이 실패 되었습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/memberQuit.do")
	public String memberQuit_post(HttpSession session,HttpServletRequest request,
			@RequestParam(defaultValue="") String oldmImage){
		String mEmail=(String)session.getAttribute("mEmail");
		logger.info("회원탈퇴처리");
		
		int cnt=memberService.deleteMember(mEmail);
		logger.info("회원탈퇴처리결과 cnt={}",cnt);
		
			String upPath=fileUtil.getUploadPath(request, fileUtil.IMAGE_UPLOAD);
		
			File delfile= new File(upPath, oldmImage);
			if(delfile.exists()){
				boolean bool= delfile.delete();
				logger.info("파일 삭제 결과={}",bool);	
			}
			
		

			
		session.removeAttribute("mEmail");
		session.removeAttribute("mNick");
		session.removeAttribute("mNo");
		
		
		return "redirect:/page.do";
		
	}
	
	@RequestMapping("/apiLogin.do")
	@Transactional
	public String apiLogin(@RequestParam String mEmail, @RequestParam String mNick,
			HttpSession session,HttpServletRequest request ){
		logger.info("apiLogin처리 mEmail={},mNick={}",mEmail,mNick);
		
		int count=memberService.selectmCount(mEmail);
		MemberVo memberVo= new MemberVo();
		if(count<1){
			String newpwd = "";
			for (int i = 1; i <= 6; i++) {
				// 영어
				char chPwd=(char)(Math.random()*26+97);
				if (i % 3 != 0) {
					newpwd +=chPwd;
					// 숫자
				}else {
					newpwd +=(int)(Math.random()*10);
				}
			}
		
			
			memberVo.setmEmail(mEmail);
			memberVo.setmNick(mNick);
			memberVo.setmPwd(newpwd);
			memberVo.setmImage("");
		
			int cnt= memberService.insertMember(memberVo);
			logger.info("회원가입처리 cnt={}",cnt);
			if(cnt>0){
				memberVo =memberService.selectmEmail(mEmail);
				logger.info("로그인 처리 memberVo={}",memberVo);
				
				session= request.getSession();
				session.setAttribute("mEmail", memberVo.getmEmail());
				session.setAttribute("mNick", memberVo.getmNick());
				session.setAttribute("mNo", memberVo.getmNo());
				session.setAttribute("mType", memberVo.getmType());
			}else {
				logger.info("회원가입처리 실패");
			}
		}else {
			memberVo =memberService.selectmEmail(mEmail);
			logger.info("로그인 처리 memberVo={}",memberVo);
			session= request.getSession();
			session.setAttribute("mEmail", memberVo.getmEmail());
			session.setAttribute("mNick", memberVo.getmNick());
			session.setAttribute("mNo", memberVo.getmNo());
			session.setAttribute("mType", memberVo.getmType());
		}
		
		return "redirect:/page.do";
	}
	
	
}

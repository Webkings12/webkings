package com.webkings.app.email;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.webkings.app.member.model.MemberService;
import com.webkings.app.member.model.MemberVo;


@Controller
public class EmailController {
	private static final Logger logger=LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired 
	private MemberService memberService;
	
	@RequestMapping("/email/emailFind.do")
	public String emailTest2(@RequestParam String mEmail){
		logger.info("비밀번호 발송 처리 파라미터,mEmail={}",mEmail);

		int count =memberService.selectmCount(mEmail);

		if(count==memberService.LOGIN_OK){

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


			String receiver=mEmail;
			
			String sender="admin@Webkings.com";

			logger.info("newpwd={}",newpwd);

			String subject="임시비밀번호 안내입니다.";
			String content="임시비밀번호["+newpwd+"]입니다.";
			
			MemberVo vo= new MemberVo();
			vo.setmEmail(mEmail);
			vo.setmPwd(newpwd);
			
			int cnt=memberService.updatePwd(vo);
			
			logger.info("비밀변호 변경 cnt={},",cnt);

			try {
				emailSender.sendEmail(subject, content, 
						receiver, sender);
				logger.info("이메일 발송 성공!!");
			} catch (MessagingException e) {
				logger.info("이메일 발송 실패!!");
				e.printStackTrace();
			}
		}

		return "redirect:/page.do";
	}
	
	@RequestMapping(value="/certify/certifyNo.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String certifyNo(@RequestParam String mEmail){
		logger.info("인증번호 발송 처리 파라미터,mEmail={}",mEmail);
		String certify = "";
		int count =memberService.selectmCount(mEmail);
		logger.info("아이디 존재여부,count={}",count);
		if(count==0){
			certify = "";
			for (int i = 1; i <= 6; i++) {
				// 영어
				char chPwd=(char)(Math.random()*26+97);
				if (i % 3 != 0) {
					certify +=chPwd;
					// 숫자
				}else {
					certify +=(int)(Math.random()*10);
				}
			}


			String receiver=mEmail;
			String sender="admin@Webkings.com";

			logger.info("certify={}",certify);

			String subject="인증번호 안내입니다.";
			String content="인증번호["+certify+"]입니다.";
			

			try {
				emailSender.sendEmail(subject, content, 
						receiver, sender);
				logger.info("이메일 발송 성공!!");
			} catch (MessagingException e) {
				logger.info("이메일 발송 실패!!");
				e.printStackTrace();
			}
			
		}
		else if(count==1){
			certify="이미 존재하는 이메일입니다";
		}
		
		return certify;
	}
	
}

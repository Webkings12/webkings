package com.webkings.app.common;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginIntercepter extends HandlerInterceptorAdapter{

	private static final Logger logger
	=LoggerFactory.getLogger(LoginIntercepter.class);
	
	/*
	memberEdit.do => DispatcherServlet => HandlerMapping
	=>
		[1] preHandle()
	
	=> 해당 Controller의 Handler
		
		[2] postHander()
	
	=> 뷰
	
		[3] afterCompletion()
	 
	*/
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		logger.info("컨트롤러 실행 전 먼저 preHandle()메서드가 실행됨");
		//로그인 안된경우 먼저 로그인 처리
		HttpSession session= request.getSession();
		String mEmail =(String)session.getAttribute("mEmail");
		if(mEmail==null ||mEmail.isEmpty()){
			request.setAttribute("msg", "먼저 로그인하세요");
			request.setAttribute("url", "/page.do");
			
			RequestDispatcher dispatcher
			=request.getRequestDispatcher("/WEB-INF/views/common/message.jsp");
			dispatcher.forward(request, response);
			return false; //다음 컨트롤러가 수행되지 않음
		}
		
		return true; //다음 컨트롤러가 실행됨
	}
	
}

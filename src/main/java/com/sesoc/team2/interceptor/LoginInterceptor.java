package com.sesoc.team2.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("LoginInterceptor 실행");
	
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		//로그인하지 않고 접속할 때 이동할 경로 확인하고 아래 경로를 수정
		if (loginId == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
}

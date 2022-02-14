package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 고객센터에 대한 컨트롤러
 * 자주묻는질문 페이지, 챗봇
 */
@Controller
public class CustomerServiceController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceController.class);
	static HttpSession session;
	/**
	 * 메인 화면으로 이동
	 */
	@RequestMapping(value = "/chathome", method = RequestMethod.GET)
	public String home() {
		return "chat/chathome";
	}
	
	/**
	 * 채팅 화면으로 이동
	 */
	@RequestMapping(value="chatView", method=RequestMethod.GET)
	public String chatView() {
		return "chat/chat";
	}
	
}

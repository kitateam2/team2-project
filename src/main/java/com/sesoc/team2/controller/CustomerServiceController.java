package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	 * FAQ 화면으로 이동
	 */
	@RequestMapping(value = "/userService", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		logger.info("FAQ{}",id);
		return "service/userService";
	}
	
	/**
	 * 채팅 화면으로 이동
	 */
	@RequestMapping(value="chatView", method=RequestMethod.GET)
	public String chatView(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		logger.info("챗뷰{}",id);
		return "service/chat";
	}
	
	@RequestMapping(value = "/chatTest", method = RequestMethod.GET)
	public String chaTest(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		logger.info("FAQ{}",id);
		return "service/test";
	}
	
}

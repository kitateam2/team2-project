package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.team2.vo.Message;

/**
 * 쪽지에 대한 컨트롤러
 */
@Controller
@RequestMapping("message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	
	//쪽지로 이동
			@RequestMapping(value = "window", method = RequestMethod.GET)
			public String messageWindow() {
				return "myblog/messageWindow"; //의문인 것이 블로그 메인이랑 메시지는 같은 위치에 잇는데 왜 앞에 마이블로그를 붙여줘야하지
			}
			
	//쪽지 저장
			@RequestMapping(value = "new", method = RequestMethod.POST)
			public String message_new(Message message
										, HttpSession session
										,  Model model) {
				//보내는 사람의 정보 = 로그인 한 아이디
				String id = (String) session.getAttribute("loginId");	
				
				return "redirect:window"; //의문인 것이 블로그 메인이랑 메시지는 같은 위치에 잇는데 왜 앞에 마이블로그를 붙여줘야하지
			}
	//쪽지 불러오기
	
}

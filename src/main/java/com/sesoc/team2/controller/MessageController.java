package com.sesoc.team2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sesoc.team2.dao.MessageDAO;
import com.sesoc.team2.vo.Message;

/**
 * 쪽지에 대한 컨트롤러
 */
@Controller
@RequestMapping("message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageDAO dao;
	
	//쪽지로 이동
			@RequestMapping(value = "{user_id}/window", method = RequestMethod.GET)
			public String messageWindow(
					@PathVariable String user_id,
					@RequestParam(value="message_no", defaultValue="0" )int message_no, HttpSession session
										,  Model model) {
				String id = (String) session.getAttribute("loginId");
				//보내는 값에 내 아이디를 고정해서 보내야 하니까 고정값을 하나만 주는 거지  
				//딱 열렸을 때 불러오는 받은사람에는 로그인 한 아이디가 그 값이니까 
				//message.setMessage_recv_id(id); 이거 없어도 되고, sql에서 조건절로 주니까 자동으로 불러올 수 있다.
				
				logger.info("쪽지 로그인 된 아이디: {}", id);
				ArrayList<Message> message_list = dao.message_list(id);
				
				model.addAttribute("message_list", message_list);
				//받을 때 나한테 온거, 보낼 때 내가 보낸거를 내부적으로만 통일하려고
				
				logger.info("리스트: {}", message_list);
				
				if(message_no == 0 ) {}
				
				else {
				//전달된 메시지 넘버 가지고 오기
				logger.info("메시지 하나 자세히 보기 {}", message_no);
				Message one_message = dao.one_message(message_no);
				logger.info("메시지 하나 자세히 보기 2222 {}", message_no);
 
				model.addAttribute("one_message", one_message);
				
				}

				return "myblog/messageWindow"; //의문인 것이 블로그 메인이랑 메시지는 같은 위치에 잇는데 왜 앞에 마이블로그를 붙여줘야하지
			}
			
	//쪽지 저장
			@RequestMapping(value = "new", method = RequestMethod.POST)
			public String message_new(Message message
										, HttpSession session
										,  Model model) {
				logger.info("쪽지 저장 me result: {}", message);
				//보내는 사람의 정보 = 로그인 한 아이디
				String id = (String) session.getAttribute("loginId");	
				message.setMessage_sent_id(id);
				
				int result = dao.message_new(message);
				logger.info("쪽지 저장 result: {}", result);
				return "redirect:window";
			}
	//쪽지 불러오기는 펼칠 때 같이 
	//쪽지를 불러오는 마지막 xml에 조건을 줘야해 받는 사람이 내가 되는 것들만 불러오게 
	
	//쪽지 하나 보기
			
			
}

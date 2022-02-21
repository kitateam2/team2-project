package com.sesoc.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class StompController {
	private static final Logger logger = LoggerFactory.getLogger(StompController.class);

	@MessageMapping("/TTT")
	@SendTo("topic/message")
	public String ttt(String message) throws Exception{
		logger.info("messageTTT:{}", message);
		return message;
	}
}

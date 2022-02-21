package com.sesoc.team2.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class StompController {

	/*
	 * @MessageMapping("/TTTx")
	 * 
	 * @SendTo("/topic/message") public String tttx(String message) throws Exception
	 * { System.out.println("TTT>>" + message); return message; }
	 */
	
	@MessageMapping("/TTT")
	@SendTo("/topic/message")
	public String ttt(String message) throws Exception {
		System.out.println("TTT>>" + message);
		//System.out.println("ID=" + message.getId());
		//System.out.println("MSG=" + message.getMsg());
	 
		return message;
	}
}
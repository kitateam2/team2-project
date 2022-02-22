package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class StompController {
	
	@MessageMapping("/TTT")
	@SendTo("/topic/message")
	//public String ttt(String message) throws Exception {
  public ChatMessage ttt(ChatMessage message) throws Exception {
		System.out.println("컨트롤러>>" + message);
		
		//System.out.println("ID=" + message.getId());
		//System.out.println("MSG=" + message.getMsg()); 
		//messagingTemplate.convertAndSend("/topic/" + message.getRoomid(), message.getMsg());
		//messagingTemplate.convertAndSendToUser(message.getId(), "/topic/" + message.getRoomid(), message.getMsg());
		
		return message;
	}
}
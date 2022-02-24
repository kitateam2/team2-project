package com.sesoc.team2.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class StompController {
	
	@MessageMapping("/TTT/{roomid}")
	@SendTo("/topic/message/{roomid}")
  public ChatMessage ttt(@DestinationVariable("roomid") String roomid,ChatMessage message) throws Exception {
		System.out.println("컨트롤러>>" + message);
		System.out.println("roodid 방번호: " + roomid);
		//System.out.println("ID=" + message.getId());
		//System.out.println("MSG=" + message.getMsg()); 
		//messagingTemplate.convertAndSend("/topic/" + message.getRoomid(), message.getMsg());
		//messagingTemplate.convertAndSendToUser(message.getId(), "/topic/" + message.getRoomid(), message.getMsg());
		
		return message;
	}
}
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

		return message;
	}
	
	@MessageMapping("/ADMIN/{roomid1}")
	@SendTo("/topic/admin/{roomid1}")
  public ChatMessage admin(@DestinationVariable("roomid1") String roomid1,ChatMessage message) throws Exception {
		System.out.println("admin 컨트롤러>>" + message);
		System.out.println("admin roodid 방번호: " + roomid1);
		
		return message;
	}
}
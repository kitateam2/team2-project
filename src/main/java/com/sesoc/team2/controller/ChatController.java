package com.sesoc.team2.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.sesoc.team2.vo.Chat;

@Controller
public class ChatController {

	// 채팅 메세지 전달
    @MessageMapping("/hello/{roomNo}")
    @SendTo("/subscribe/chat/{roomNo}")
    public Chat broadcasting(Chat chat) {
 	
        chat.setSendDate(new Date());
        
        return chat;
    }
    
}
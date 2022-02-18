package com.sesoc.team2.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;

//클라이언트와 WebSocket을 이용한 메시지 송수신
public class ChatHandler1 extends AbstractWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);

	//채팅에 참여한 클라이언트들과의 연결
	ArrayList<WebSocketSession> list = new ArrayList<>();
	Map<String, WebSocketSession> userLists = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("세션 오픈 : {}, ID: {}", session.getLocalAddress(), session.getId());
		logger.info("세션 전체 : {}", session); //세션ID와 uri가 온다
		list.add(session);		//연결된 세션들을 보관
		logger.info(list.toString());
		String userId = getId(session);
		userLists.put(userId, session);
		logger.info("유저맵: {} ",userLists);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("세션 클로즈 : {}, ID: {}", session.getLocalAddress(), session.getId());
		list.remove(session);
		logger.info(list.toString());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("서버측 수신 : {}, ID: {}", message.getPayload(), session.getId());
		logger.info("message: {}, session:{}", message, session);
		String userId = getId(session);
		//handshakerinterceptor에서 사용자와 방에대한 정보를 가져와서 list를 다뿌리는게 아니라 조건을 줘야됨
	    //결국 아래 for문을 뿌셔야된다.
		//TextMessage msg = new TextMessage(userId + ": " + message.getPayload());
		//for(WebSocketSession ss: list) {
		//	ss.sendMessage(msg);
		//}
		//protocol: cmd, 댓글작성자, 게시글작성자, bno(reply,user2,user1,234)
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = message.getPayload().split(",");
			//protocol이 4개라 4
			if(strs != null && strs.length == 4 ) {				
				String cmd = strs[0];
				String replyWriter = strs[1];
				String boardWriter = strs[2];
				String bno = strs[3];
				
				WebSocketSession boardWriterSession = userLists.get(boardWriter);  //글작성자 세션
				logger.info("글작성자세션: {}", boardWriterSession);
				if("reply".equals(cmd) && boardWriterSession != null ) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 " + bno + "번 게시글에 댓글을 달았습니다." );
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	
	//세션에서 로그인한 사용자를 읽어오는 메서드
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
	    String userId = (String)httpSession.get("userId"); 
	    if(userId == null)
	    	return session.getId();
	    else
	    	return userId;
	}
}

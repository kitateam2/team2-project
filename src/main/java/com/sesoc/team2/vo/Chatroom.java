package com.sesoc.team2.vo;

public class Chatroom {
	private String chatroom_id;
	
	public Chatroom() {
	}

	public String getChatroom_id() {
		return chatroom_id;
	}

	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}

	@Override
	public String toString() {
		return "Chatroom [chatroom_id=" + chatroom_id + "]";
	}

	
}

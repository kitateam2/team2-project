package com.sesoc.team2.vo;

public class Chat {
	private int chat_id;
	private String chat_message;
	private String chat_time;
	private String chatroom_id;
	private String user_id;
	
	public Chat() {
	}
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public String getChat_message() {
		return chat_message;
	}
	public void setChat_message(String chat_message) {
		this.chat_message = chat_message;
	}
	public String getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getChat_time() {
		return chat_time;
	}
	public void setChat_time(String chat_time) {
		this.chat_time = chat_time;
	}
	@Override
	public String toString() {
		return "Chat [chat_id=" + chat_id + ", chat_message=" + chat_message + ", chat_time=" + chat_time
				+ ", chatroom_id=" + chatroom_id + ", user_id=" + user_id + "]";
	}
	
}

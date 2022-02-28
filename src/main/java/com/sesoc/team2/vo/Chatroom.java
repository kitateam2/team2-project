package com.sesoc.team2.vo;

public class Chatroom {
	private String chatroom_id;
	private String chatroom_lastid;
	private String chatroom_lastchat;
	private String chatroom_lastchattime;
	
	public Chatroom() {
	}

	public String getChatroom_id() {
		return chatroom_id;
	}

	public void setChatroom_id(String chatroom_id) {
		this.chatroom_id = chatroom_id;
	}

	public String getChatroom_lastid() {
		return chatroom_lastid;
	}

	public void setChatroom_lastid(String chatroom_lastid) {
		this.chatroom_lastid = chatroom_lastid;
	}

	public String getChatroom_lastchat() {
		return chatroom_lastchat;
	}

	public void setChatroom_lastchat(String chatroom_lastchat) {
		this.chatroom_lastchat = chatroom_lastchat;
	}

	public String getChatroom_lastchattime() {
		return chatroom_lastchattime;
	}

	public void setChatroom_lastchattime(String chatroom_lastchattime) {
		this.chatroom_lastchattime = chatroom_lastchattime;
	}

	@Override
	public String toString() {
		return "Chatroom [chatroom_id=" + chatroom_id + ", chatroom_lastid=" + chatroom_lastid + ", chatroom_lastchat="
				+ chatroom_lastchat + ", chatroom_lastchattime=" + chatroom_lastchattime + "]";
	}
	
}

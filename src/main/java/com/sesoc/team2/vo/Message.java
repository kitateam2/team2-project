package com.sesoc.team2.vo;

public class Message {
	
	private int message_no;
	private String message_title;
	private String message_contents;
	private String message_date;
	private String message_sent_id;
	private String message_recv_id;
	private int message_hits;
	
	public Message() {
	}
	
	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getMessage_contents() {
		return message_contents;
	}
	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}
	public String getMessage_date() {
		return message_date;
	}
	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}
	public String getMessage_sent_id() {
		return message_sent_id;
	}
	public void setMessage_sent_id(String message_sent_id) {
		this.message_sent_id = message_sent_id;
	}
	public String getMessage_recv_id() {
		return message_recv_id;
	}
	public void setMessage_recv_id(String message_recv_id) {
		this.message_recv_id = message_recv_id;
	}
	public int getMessage_hits() {
		return message_hits;
	}
	public void setMessage_hits(int message_hits) {
		this.message_hits = message_hits;
	}

	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", message_title=" + message_title + ", message_contents="
				+ message_contents + ", message_date=" + message_date + ", message_sent_id=" + message_sent_id
				+ ", message_recv_id=" + message_recv_id + ", message_hits=" + message_hits + "]";
	}
	
	
	
	
}

package com.sesoc.team2.vo;

public class Message {
	
	private int message_no;
	private String message_recv_contents;
	private String message_sent_contents;
	private String message_recv_date;
	private String message_sent_date;
	
	
	public Message() {
	}


	public int getMessage_no() {
		return message_no;
	}


	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}


	public String getMessage_recv_contents() {
		return message_recv_contents;
	}


	public void setMessage_recv_contents(String message_recv_contents) {
		this.message_recv_contents = message_recv_contents;
	}


	public String getMessage_sent_contents() {
		return message_sent_contents;
	}


	public void setMessage_sent_contents(String message_sent_contents) {
		this.message_sent_contents = message_sent_contents;
	}


	public String getMessage_recv_date() {
		return message_recv_date;
	}


	public void setMessage_recv_date(String message_recv_date) {
		this.message_recv_date = message_recv_date;
	}


	public String getMessage_sent_date() {
		return message_sent_date;
	}


	public void setMessage_sent_date(String message_sent_date) {
		this.message_sent_date = message_sent_date;
	}


	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", message_recv_contents=" + message_recv_contents
				+ ", message_sent_contents=" + message_sent_contents + ", message_recv_date=" + message_recv_date
				+ ", message_sent_date=" + message_sent_date + "]";
	}
	
	//보낸 사람이랑 받는 사람은 디비에서는 참조로 가지고 왔는데 그걸 자바에서 정의를 해줘야하나?
	//뭔가 단위로 잠시 받아서 하는 것이 아닌가?
	
	
	
}

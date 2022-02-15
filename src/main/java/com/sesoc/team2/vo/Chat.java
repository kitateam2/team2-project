package com.sesoc.team2.vo;

import java.util.Date;

public class Chat {

    private String from;
    private String text;
    private Date sendDate;
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Chat(String from, String text, Date senddate) {
		super();
		this.from = from;
		this.text = text;
		this.sendDate = senddate;
	}
	@Override
	public String toString() {
		return "Chat [from=" + from + ", text=" + text + ", sendDate=" + sendDate + "]";
	}
    


}

package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Message;

public interface MessageMapper {

	public int message_new(Message message);

	public ArrayList<Message> message_list_recv(String message_recv_id);

	public Message one_message(int message_no);

	public void add_message_hits(int message_no);

	public ArrayList<Message> message_list_sent(String message_sent_id);

	public ArrayList<Message> message_list_all(String message_all_id);


}

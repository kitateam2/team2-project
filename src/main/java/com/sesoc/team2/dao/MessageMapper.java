package com.sesoc.team2.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.team2.vo.Message;

public interface MessageMapper {

	public int message_new(Message message);

	public Message one_message(int message_no);

	public void add_message_hits(int message_no);
	
	public ArrayList<Message> message_list_recv(HashMap<String, String> map, RowBounds rb);

	public ArrayList<Message> message_list_sent(HashMap<String, String> map, RowBounds rb);

	public int get_total_recv(HashMap<String, String> map_recv);

	public int get_total_sent(HashMap<String, String> map_sent);

	public ArrayList<String> get_recv_id();


}

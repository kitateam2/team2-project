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

	public ArrayList<Message> message_list_unopened(HashMap<String, String> map_unopened, RowBounds rb);

	public ArrayList<Message> message_list_fav(HashMap<String, String> map_fav, RowBounds rb);

	public int get_total_recv(HashMap<String, String> map_recv);

	public int get_total_sent(HashMap<String, String> map_sent);

	public int get_total_unopened(HashMap<String, String> map_unopend);
	
	public int get_total_fav(HashMap<String, String> map_fav);
	
	/* 받는 사람 아이디 자동완성 */
	public ArrayList<String> get_recv_id();


}

package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Message;

public interface MessageMapper {

	public int message_new(Message message);

	public ArrayList<Message> message_list();


}

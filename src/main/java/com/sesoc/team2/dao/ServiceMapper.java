package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Chat;
import com.sesoc.team2.vo.Chatroom;
import com.sesoc.team2.vo.User_infoVO;

public interface ServiceMapper {

	public ArrayList<User_infoVO> idList();

	public void insertChatroom(String ids);

	public ArrayList<Chatroom> roomlist(String id);

	public void insertchat(Chat chat);

}

package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Chat;
import com.sesoc.team2.vo.Chatroom;
import com.sesoc.team2.vo.Searchid;
import com.sesoc.team2.vo.User_infoVO;

public interface ServiceMapper {

	public ArrayList<User_infoVO> idList(String id);

	public void insertChatroom(String ids);

	public ArrayList<Chatroom> roomlist(String id);

	public void insertchat(Chat chat);

	public ArrayList<Chat> chatlist(String roomid);

	public ArrayList<User_infoVO> idsearch(Searchid searchid);

	public int updatelastchat(Chat chat);

}

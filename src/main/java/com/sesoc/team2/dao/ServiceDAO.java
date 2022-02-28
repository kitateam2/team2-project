package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.Chat;
import com.sesoc.team2.vo.Chatroom;
import com.sesoc.team2.vo.Searchid;
import com.sesoc.team2.vo.User_infoVO;

@Repository
public class ServiceDAO {
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ServiceDAO.class);

	public ArrayList<User_infoVO> idList(String id) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		ArrayList<User_infoVO> idList = mapper.idList(id);
		return idList;
	}

	public void insertChatroom(String ids) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		mapper.insertChatroom(ids);
	}

	public ArrayList<Chatroom> roomlist(String id) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		ArrayList<Chatroom> roomlist = mapper.roomlist(id);
		return roomlist;
	}

	public void insertchat(Chat chat) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		mapper.insertchat(chat);
	}

	public ArrayList<Chat> chatlist(String roomid) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		ArrayList<Chat> chatlist = mapper.chatlist(roomid);
		return chatlist;
	}

	public ArrayList<User_infoVO> idsearch(Searchid searchid) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		ArrayList<User_infoVO> idsearch = mapper.idsearch(searchid);
		return idsearch;
	}

	public int updatelastchat(Chat chat) {
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		int result = mapper.updatelastchat(chat);
		return result;
	}
	
	
}

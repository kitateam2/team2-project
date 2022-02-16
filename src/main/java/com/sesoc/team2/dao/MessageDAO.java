package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.controller.MainPageController;
import com.sesoc.team2.vo.Message;

@Repository
public class MessageDAO {
	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);


	@Autowired
	SqlSession sqlSession;
	
	public int message_new(Message message) {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		int result = 0;
		result = mapper.message_new(message);
		return result;
	}

	public ArrayList<Message> message_list(String message_recv_id) {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		ArrayList<Message> message_list = mapper.message_list();
		return message_list;
	}


}

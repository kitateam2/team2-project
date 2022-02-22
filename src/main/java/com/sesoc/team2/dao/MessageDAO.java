package com.sesoc.team2.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
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
	//받은메시지
	public ArrayList<Message> message_list_recv(HashMap<String, String> map, int startRecord, int countPerPage) {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Message> message_list_recv = mapper.message_list_recv(map, rb);
		logger.info("<recv 의 값map {}", map);
		logger.info("<recv 의 값rb {}", rb);
		return message_list_recv;
	}
	
	//보낸메시지
	public ArrayList<Message> message_list_sent(HashMap<String, String> map, int startRecord, int countPerPage) {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<Message> message_list_sent = mapper.message_list_sent(map, rb);
		return message_list_sent;
	}
	

	
	public Message one_message(int message_no) {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		logger.info("조회수를 위한 로거 11 : {}", message_no);
		Message message = mapper.one_message(message_no);
		
		mapper.add_message_hits(message_no);
		logger.info("조회수를 위한 로거22 {}", message_no);
		return message;
	}
	
	public int get_total_recv(HashMap<String, String> map_recv) {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		int total_recv = mapper.get_total_recv(map_recv);
		logger.info("get_total_recv {}", map_recv);
		return total_recv;
	}
	public int get_total_sent(HashMap<String, String> map_sent) {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		int total_sent = mapper.get_total_sent(map_sent);
		logger.info("get_total_sent {}", map_sent);
		return total_sent;
	}
	public ArrayList<String> get_recv_id() {
		MessageMapper mapper = sqlSession.getMapper(MessageMapper.class);
		ArrayList<String> array_recv_id = mapper.get_recv_id();
		logger.info("보낼 수 있는 아이디 값들 {}", array_recv_id);
		return array_recv_id;
	}
	


}

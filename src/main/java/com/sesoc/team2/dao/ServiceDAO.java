package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.User_infoVO;

@Repository
public class ServiceDAO {
	@Autowired
	SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(ServiceDAO.class);

	public ArrayList<User_infoVO> idList() {
		//logger.info("서비스다오");
		ServiceMapper mapper = sqlSession.getMapper(ServiceMapper.class);
		ArrayList<User_infoVO> idList = mapper.idList();
		return idList;
	}
	
	
}
package com.sesoc.team2.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.API;


@Repository
public class apiDAO {
	private static final Logger logger = LoggerFactory.getLogger(apiDAO.class);

	@Autowired
	SqlSession sqlSession;
	
	//도서 api_db 저장
	public int insert_db(API api) {
		apiMapper mapper = sqlSession.getMapper(apiMapper.class);
		int result = 0;
		try {
			result = mapper.insert_db(api);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
}

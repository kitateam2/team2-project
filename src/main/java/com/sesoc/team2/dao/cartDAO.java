package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.cart_book;
@Repository
public class cartDAO {
	
	
	@Autowired
	SqlSession sqlSession;
	public ArrayList<cart_book> listcart(String user_id) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<cart_book> list = mapper.list(user_id);
		return list;
	}

}

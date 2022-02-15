package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.cart_book;

@Repository
public class CartDAO {
	
	
	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<cart_book> listcart(String user_id) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<cart_book> list = mapper.list(user_id);
		return list;
	}
	public int insert(cart_book cart_book1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.insertcart_book(cart_book1);
		return result;
		
	}
	public ArrayList<cart_book> select(String cart_book_no) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<cart_book> list = mapper.list(cart_book_no);
		return list;
	}

}
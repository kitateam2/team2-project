package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.sesoc.team2.vo.Book;

public class BookDetailDAO {
	
	@Autowired
	SqlSession sqlsession;
		
	private static final Logger logger = LoggerFactory.getLogger(BookDetailDAO.class);
		
	public ArrayList<Book> bookdetails(String book_title) {
		BookDetailMapper mapper = sqlsession.getMapper(BookDetailMapper.class);
		ArrayList<Book> bookdetails = mapper.bookdetails(book_title);
		return bookdetails;
	}


}

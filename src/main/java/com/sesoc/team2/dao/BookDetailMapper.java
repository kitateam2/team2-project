package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Book;

public interface BookDetailMapper {
	
	ArrayList<Book> bookdetails(String book_title);

}

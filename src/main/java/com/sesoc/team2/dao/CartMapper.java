package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.cart_book;

public interface CartMapper {

	ArrayList<cart_book> list();

	int insertcart_book(cart_book cart_book1);

	String selectbook(String book_isbn);
	
	int selectuser_cart_no(String user_id1);

	
}

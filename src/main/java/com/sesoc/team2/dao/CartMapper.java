package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.cart_book;

public interface CartMapper {

	ArrayList<cart_book> list();

	int insertcart_book(cart_book cart_book1);

	cart_book cartbook(String book_isbn);
	
	int selectuser_cart_no(String user_id1);
	
	ArrayList<cart_book> list1(String user_id1);

	int deletecart(int cart_book_no);

	cart_book getCart_book_count(int cart_book_count);

	int update(cart_book cart_book);

	int total(int user_cart_no);
}

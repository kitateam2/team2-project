package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.cart_book;
import com.sesoc.team2.vo.user_wishlist;

public interface CartMapper {

	ArrayList<cart_book> list();
	
	ArrayList<com.sesoc.team2.vo.user_wishlist> wishlist();

	int insertcart_book(cart_book cart_book1);

	cart_book cartbook(String book_isbn);
	
	int selectuser_cart_no(String user_id1);
	
	ArrayList<cart_book> list1(String user_id1);


	cart_book getCart_book_count(int cart_book_count);

	int update(cart_book cart_book);

	int total(int user_cart_no);
	
	int deletecart(int cart_book_no);

	int selectuser_wish_no(String user_id1);

	user_wishlist user_wishlist(String book_isbn);

	int insertwish_cart(com.sesoc.team2.vo.user_wishlist book);


	
}

package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.cart_book;

public interface CartMapper {

	ArrayList<cart_book> list(String user_id);

	int insertcart_book(cart_book cart_book1);
	
}

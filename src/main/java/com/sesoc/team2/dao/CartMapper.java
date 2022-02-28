package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Order_detail;
import com.sesoc.team2.vo.Order_list;
import com.sesoc.team2.vo.cart_book;
import com.sesoc.team2.vo.user_wishlist;

public interface CartMapper {

	ArrayList<cart_book> list();
	
	ArrayList<user_wishlist> wishlist();

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

	int insertwish_cart(user_wishlist book);

	ArrayList<user_wishlist> wishlist1(String user_id1);

	String booktitle(String book_isbn);

	int deletewish(int user_wish_no);

	int gocartinsert(cart_book cartbook);

	int select_wish_user_cart_no(String user_id1);

	cart_book select_wish_book(String book_isbn);

	//오더 디테일
	int select_order_detail_no(String user_id1);

	ArrayList<cart_book> select_order_book(int user_cart_no);

	int orderdetailinsert(cart_book cartbook);

	int order_no(String user_id1);

	ArrayList<cart_book> orderlist(String user_id1);

	Order_list Order_num(String user_id1);

	int ordertotal(Order_list order_num);

	int updateorder(Order_list order_num);

	void deletewishlist(cart_book cartbook);

	int deletewishcart();

	int deleteorderdetail();

	int orderaddress(Order_list order_list);

	int ordername(Order_list order_list);

	int orderphone(Order_list order_list);

	

	





	
	




	
}

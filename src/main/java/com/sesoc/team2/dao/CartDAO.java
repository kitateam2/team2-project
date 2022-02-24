package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.controller.OrderController;
import com.sesoc.team2.vo.Order_detail;
import com.sesoc.team2.vo.Order_list;
import com.sesoc.team2.vo.cart_book;
import com.sesoc.team2.vo.user_wishlist;



@Repository
public class CartDAO {
	private static final Logger logger = LoggerFactory.getLogger(CartDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	public int insert(cart_book cart_book1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.insertcart_book(cart_book1);
		return result;
		
	}
	public ArrayList<cart_book> select() {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<cart_book> list = mapper.list();
		return list;
	}
	
	 public ArrayList<cart_book> listcart() { 
		 CartMapper mapper = sqlSession.getMapper(CartMapper.class); 
		 ArrayList<cart_book> list = mapper.list(); 
		 return list; 
		 }
	public cart_book selectbook(String book_isbn) {
		logger.debug("카트북 : {} ", book_isbn);
		CartMapper mapper = sqlSession.getMapper(CartMapper.class); 
		cart_book cartbook = mapper.cartbook(book_isbn);
		return cartbook;
	}
	
	public int selectuser_wish_no(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.selectuser_wish_no(user_id1);
		return result;
	}
	
	public int selectuser_cart_no(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.selectuser_cart_no(user_id1);
		return result;
	}
	public ArrayList<cart_book> selectbook1(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<cart_book> list1 = mapper.list1(user_id1);
		return list1;
	}
	public int deletecart(int cart_book_no) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.deletecart(cart_book_no);
		return result;
	}
	public int updatecart(cart_book cart_book) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.update(cart_book);
		return result;
		
	}
	public int total(int user_cart_no) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.total(user_cart_no);
		return  result;
	}
	public user_wishlist selectwishbook(String book_isbn) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class); 
		user_wishlist user_wishlist = mapper.user_wishlist(book_isbn);
		return user_wishlist;
	}
	public int insertwish(user_wishlist book) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.insertwish_cart(book);
		return result;
	}
	public ArrayList<user_wishlist> selectwish() {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<user_wishlist> list = mapper.wishlist();
		return list;
}
	public ArrayList<user_wishlist> selectbookwishlist(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<user_wishlist> wishlist1 = mapper.wishlist1(user_id1);
		return wishlist1;
	}
	public String booktitle(String book_isbn) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		String result = mapper.booktitle(book_isbn);
		return result;
	}
	public int deletewish(int user_wish_no) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.deletewish(user_wish_no);
		return result;
		
	}
	public int gocartinsert(cart_book cartbook) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.gocartinsert(cartbook);
		return result;
		
	}
	public int select_wish_user_cart_no(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.select_wish_user_cart_no(user_id1);
		return result;
	}
	public cart_book select_wish_book(String book_isbn) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class); 
		cart_book cartbook = mapper.select_wish_book(book_isbn);
		return cartbook;
	}
	public int select_order_detail_no(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.select_order_detail_no(user_id1);
		return result;
	}
	
	
	public ArrayList<cart_book> select_order_book(int user_cart_no) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<cart_book> user_cart_num = mapper.select_order_book(user_cart_no);
		return user_cart_num;
	}
	public int orderdetailinsert(cart_book cartbook) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.orderdetailinsert(cartbook);
		return result;
		
	}
	public int order_no(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.order_no(user_id1);
		return result;
	}
	public ArrayList<cart_book> orderlist(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		ArrayList<cart_book> orderlist = mapper.orderlist(user_id1);
		return orderlist;
	}
	public Order_list order_num(String user_id1) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		Order_list orderlist = mapper.Order_num(user_id1);
		return orderlist;
	}
	public int ordertotal(Order_list order_num) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.ordertotal(order_num);
		return result;
	}
	public int updateorder(Order_list order_num) {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.updateorder(order_num);
		return result;
		
	}
	public int deletewishcart() {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.deletewishcart();
		return result;
		
	}
	public int deleteorderdetail() {
		CartMapper mapper = sqlSession.getMapper(CartMapper.class);
		int result = mapper.deleteorderdetail();
		return result;
		
	}
	
}

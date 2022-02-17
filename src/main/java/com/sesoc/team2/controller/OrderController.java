package com.sesoc.team2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sesoc.team2.dao.CartDAO;
import com.sesoc.team2.vo.User_infoVO;
import com.sesoc.team2.vo.cart_book;







/**
 * 주문, 장바구니, 위시리스트, 결제 등 주문상세에 대한 컨트롤러
 */

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

@Autowired
CartDAO dao;	
	
	@ResponseBody
	@RequestMapping(value = "ajaxcart", method = RequestMethod.POST)
	public String list(HttpSession session,String book_isbn) {
		String user_id1 = (String) session.getAttribute("loginId");
		int user_cart_no = dao.selectuser_cart_no(user_id1);
		logger.info("카트넘버{}",user_cart_no);
		String bookisbn = dao.selectbook(book_isbn);
		logger.info("북isbn{}",bookisbn);
		cart_book book = new cart_book();;
		book.setUser_cart_no(user_cart_no);
		book.setBook_isbn(bookisbn);
		logger.info("book{}",book);
		//검색하는 기능 dao.있으면 카트리턴 없으면 인서트
		
		dao.insert(book);
		return "cart/cartForm";
	}

	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String list1(cart_book cart_book1,Model model,HttpSession session) {
		String user_id1 = (String) session.getAttribute("loginId");
		ArrayList<cart_book> cart = dao.selectbook1(user_id1);
		model.addAttribute("Cart_book1",cart);
		return "cart/cartForm";	
	}
	
	//삭제
	@RequestMapping (value="delete", method=RequestMethod.GET)
	public String delete(HttpSession session, int cart_book_no) {
		logger.debug("cart_book_no : {} ", cart_book_no);
		dao.deletecart(cart_book_no);
		
		return "redirect:/cart";
	}
	
	//수정
	@RequestMapping (value="update", method=RequestMethod.POST)
	public String updatecart(cart_book cart_book, HttpSession session, int cart_book_no,int cart_book_count ) {//xx파라미터값 전달
		
		//수정할 글이 로그인한 본인 글인지 확인할 아이디 읽기
		int id = (int) session.getAttribute("loginId");
		//수정할 글 정보에 로그인 아이디 저장
		cart_book.setUser_cart_no(id);
		dao.updatecart(cart_book);
		
		//원래의 글읽기 화면으로 이동 
		return "redirect:/cart";
	}

	
}


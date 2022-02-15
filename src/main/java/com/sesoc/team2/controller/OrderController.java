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

import com.sesoc.team2.dao.CartDAO;
import com.sesoc.team2.vo.cart_book;




/**
 * 주문, 장바구니, 위시리스트, 결제 등 주문상세에 대한 컨트롤러
 */

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

@Autowired
CartDAO dao;	
	
	@ResponseBody
	@RequestMapping(value = "ajaxcart", method = RequestMethod.POST)
	public String list(cart_book cart_book1) {
		logger.info("전달된 장바구니 데이터: {}", cart_book1);
		//세션의 ID읽어서 장바구니 번호 검색해서 cart_book1에 저장
		//dao.insert(cart_book1);
		return "1";
	}

@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String list(cart_book cart_book1, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		ArrayList<cart_book> list = dao.listcart(id);
	
		return "cart/cartForm";
		
		
		
	}
	
	
	@RequestMapping (value="check", method=RequestMethod.GET)
	public String checkForm() {
	return "checkForm";
	}

	
}


package com.sesoc.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 주문, 장바구니, 위시리스트, 결제 등 주문상세에 대한 컨트롤러
 */
@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@RequestMapping (value="cart", method=RequestMethod.GET)
	public String joinForm() {
		return "cartForm";
	}
}

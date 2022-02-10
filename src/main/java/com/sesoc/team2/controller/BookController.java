package com.sesoc.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 책 상세정보 페이지에 대한 컨트롤러
 * 책 검색, 검색했을때 리스트, 책 리뷰 리스트, 책 정보 페이지 등
 */
@Controller
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//책 상세정보
	@RequestMapping (value="bookinfo", method=RequestMethod.GET)
	public String bookinfoForm() {
		return "bookinfoForm";
	}
	
}

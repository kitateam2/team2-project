package com.sesoc.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.team2.dao.BookDBMapper;

public class BookController {

private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	//책 상세정보
	@RequestMapping (value="bookinfo", method=RequestMethod.GET)
	public String bookinfoForm() {
		return "bookinfoForm";
	}
	
	@Autowired
	private BookDBMapper bookDBMapper;
	

	
	

}

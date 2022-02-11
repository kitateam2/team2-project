package com.sesoc.team2.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Element;

import com.sesoc.team2.dao.BookDBMapper;

@Controller
public class BookController {
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	//책 상세정보
	@RequestMapping (value="bookinfo", method=RequestMethod.GET)
	public String bookinfoForm() {
		return "bookinfoForm";
	}
	
	@Autowired
	private BookDBMapper bookDBMapper;
	
	
	public static int page_size = 100;
	public static String url = "https://openapi.naver.com/v1/search/book.xml";
	public static String service_key = "fL7oGeaMDyKTcSQ8K9E7";
	
	public void update() throws Exception {
		int result = 0;
		List<Map<String, String>> list = new ArrayList<>();
		
//		try {
//		//책 목록 읽어오기
//		createDocument(list);
//		
//			for (Map<String, String> bookInfo : list) {
//			createDetailInfo(bookInfo);
//			
//			result += 
//			}
//		}
	}
	
	private void parseDetailXml(Element root, Map<String, String> map) {
		
	}
	
	
}

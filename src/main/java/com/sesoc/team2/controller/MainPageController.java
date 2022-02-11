package com.sesoc.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 메인 페이지에 대한 컨트롤러
 * 베스트셀러, 신작, 블로그 인플루언서등 리스트들
 */
@Controller
public class MainPageController {
	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);
	
	
	@RequestMapping(value = "myblog/main", method = RequestMethod.GET)
	public String myblog() {
		return "myblog/myblogMain";
	}
}

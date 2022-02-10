package com.sesoc.team2.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 블로그 내에서의 컨트롤러
 * 블로그 게시글 리스트, 인플루언서 리스트, 블로그 검색 등
 */

@Controller
public class BlogMainController {
	private static final Logger logger = LoggerFactory.getLogger(BlogMainController.class);
	
		//내 블로그 가기
		@RequestMapping (value="myblog", method=RequestMethod.GET)
		public String myblogForm() {
			return "myblogForm";
		}
		
		//블로그 메인 가기
		@RequestMapping (value="blogmain", method=RequestMethod.GET)
		public String blogmainForm() {
			return "blogmainForm";
		}
}

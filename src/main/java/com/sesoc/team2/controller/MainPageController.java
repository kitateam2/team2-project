package com.sesoc.team2.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.team2.dao.BlogPostDAO;
import com.sesoc.team2.vo.BlogPost;


/**
 * 메인 페이지에 대한 컨트롤러
 * 베스트셀러, 신작, 블로그 인플루언서등 리스트들
 */
@Controller
public class MainPageController {
	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);
	
	@Autowired
	BlogPostDAO dao;
	
	@RequestMapping(value = "myblog/{user_id}", method = RequestMethod.GET)
	public String myblog(@PathVariable String user_id, Model model) {
		ArrayList<BlogPost> postlist =dao.postlist(user_id);
		logger.info("DB에서 가져온 목록{}", postlist);
		model.addAttribute("postlist", postlist);
		model.addAttribute("user_id", user_id);
		return "myblog/myblogMain";
	}
	
}

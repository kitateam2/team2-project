package com.sesoc.team2.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sesoc.team2.dao.BlogMainDAO;
import com.sesoc.team2.vo.BlogMain;

/**
 * 블로그 메인 컨트롤러
 * 블로그 게시글 리스트
 */

@Controller
@RequestMapping("blogmain")
public class BlogMainController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	@Autowired
	BlogMainDAO blogmaindao;	
	
		//내 블로그 이동
		@RequestMapping (value="myblog", method=RequestMethod.GET)
		public String myblogForm() {
			return "myblogForm";
		}
		
		//블로그 목록
		@RequestMapping(value="", method=RequestMethod.GET)	
		public String list(
				@RequestParam(value="page", defaultValue="1") int page
				, @RequestParam(value="searchText", defaultValue="") String searchText				
				, Model model) {
			ArrayList<BlogMain> list = blogmaindao.list(searchText);
			ArrayList<BlogMain> ranklist = blogmaindao.ranklist();
			model.addAttribute("list", list);
			model.addAttribute("ranklist", ranklist);
			model.addAttribute("searchText", searchText);			
			return "blogmain/blogmainForm";
		}
}

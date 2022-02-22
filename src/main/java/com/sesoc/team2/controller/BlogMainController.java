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

import com.sesoc.team2.dao.BlogMainDAO;
import com.sesoc.team2.dao.MemberDAO;
import com.sesoc.team2.vo.BlogMain;
import com.sesoc.team2.vo.User_infoVO;

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
	
	@Autowired
	MemberDAO memberdao;
	
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
				, String id
				, HttpSession session
				, Model model) {
			ArrayList<BlogMain> list = blogmaindao.list(searchText);
			ArrayList<BlogMain> ranklist = blogmaindao.ranklist();			
			model.addAttribute("list", list);
			model.addAttribute("searchText", searchText);
			model.addAttribute("ranklist", ranklist);			
			
			String object = (String) session.getAttribute("loginId");
			if (object == null) {
				return "blogmain/blogmainForm";
			}
			User_infoVO user_id = memberdao.getMember(object);
			BlogMain blogmain = new BlogMain();
			blogmain.setUser_id(user_id.getUser_id());
			Integer grade = blogmaindao.grade(blogmain);			
			model.addAttribute("grade", grade);
			logger.info("grade", grade);
			
			return "blogmain/blogmainForm";
		}
}

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
import com.sesoc.team2.util.PageNavigator;
import com.sesoc.team2.vo.BlogMain;
import com.sesoc.team2.vo.Follow;
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
	
	final int countPerPage = 6; //페이지당 글 수
	final int pagePerGroup = 5; //페이지 이동 링크 표시할 페이지 수
	
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
			int total = blogmaindao.getTotal(searchText);
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);		
			ArrayList<BlogMain> list = blogmaindao.list(searchText, navi.getStartRecord(), navi.getCountPerPage());
			
			model.addAttribute("list", list);			
			model.addAttribute("searchText", searchText);
			model.addAttribute("navi", navi);
			System.out.println("navi"+ navi);
			
			ArrayList<BlogMain> postlist = blogmaindao.postlist();
			model.addAttribute("postlist", postlist);
			
			ArrayList<Follow> bloglist = blogmaindao.bloglist();
			model.addAttribute("bloglist", bloglist);
			
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

package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.team2.dao.ReviewDAO;
import com.sesoc.team2.vo.BookReview;

@Controller
public class BookController {

private static final Logger logger = LoggerFactory.getLogger(BookController.class);
	
	//책 상세정보
//	@RequestMapping (value="/bookInfo", method=RequestMethod.GET)
//	public String bookinfoForm() {
//		return "bookjsp/bookInfo";
//	}
	
	@Autowired
	ReviewDAO dao;
	
	//댓글 저장
	@RequestMapping (value="book_review", method=RequestMethod.POST)
	public String insert(BookReview review, HttpSession session, Model model) {
		/* 로그인한 사람들 정보 저장 */
		String id = (String) session.getAttribute("loginId");
		logger.info("컨트롤러 id체크{}", id);
		review.setBook_review_writer(id);
		logger.info("컨트롤러{}", review);
		dao.insert(review);
		return "redirect:bookInfo"; //나중에 고치기!!!!!!!
	}


//	//리플저장
//		@RequestMapping (value="post_comment", method=RequestMethod.POST)
//		public String post_comment_insert(PostComment postcomment
//					                      , HttpSession session
//					                      ,  Model model){
//			/* 로그인한 사람의 정보를 저장 */
//			String id = (String) session.getAttribute("loginId");	
//			logger.info("컨트롤러{}",id);
//			postcomment.setPost_comment_writter(id);
//			logger.info("컨트롤러{}",postcomment);
//			dao.post_comment_insert(postcomment);
//			return "redirect:one_post?post_no=" + postcomment.getPost_no();
//		}
		
	
	

}

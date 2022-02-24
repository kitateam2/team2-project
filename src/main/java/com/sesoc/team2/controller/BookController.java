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
import com.sesoc.team2.dao.ReviewDAO;
import com.sesoc.team2.util.PageNavigator;
import com.sesoc.team2.vo.Book;
import com.sesoc.team2.vo.BookReview;
import com.sesoc.team2.dao.BookInfoDAO;

@Controller
public class BookController {

private static final Logger logger = LoggerFactory.getLogger(BookController.class);
		
	@Autowired
	ReviewDAO dao;
	
	@Autowired
	BookInfoDAO infodao;
	
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/boardfile";	//파일 업로드 경로
	
	
	
	//글 목록
	@RequestMapping (value="list", method=RequestMethod.GET)
	public String list(
			@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, Model model) {
		
		logger.debug("page: {}, searchText: {}", page, searchText);
		
		int total = infodao.getTotal(searchText);			//전체 글 개수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		logger.info("navi {}", navi);
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<Book> booklist = infodao.listBook(searchText, navi.getStartRecord(), navi.getCountPerPage());	
		logger.info("{} booklist 컨틀롤러", booklist);
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("booklist", booklist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "book/bookInfo";
	}
	
	/**
	 * 글 읽기
	 * @param book_isbn 읽을 글번호
	 * @return 해당 글 정보
	 */
	@RequestMapping (value="read", method=RequestMethod.GET)  //value 확인!!
	public String read(String book_isbn, Model model) {
		logger.debug("read경로에 파라미터 book_isbn: {}", book_isbn);
		//전달된 글 번호로 해당 글정보 읽기
		Book book = infodao.getBook(book_isbn);
		if (book == null) {
			return "redirect:list"; //list가 어디에 있는 경로인지 확인!!
		}
		
		
		//해당 글에 달린 리플목록 읽기
		ArrayList<BookReview> ReviewList = dao.BookReviewList(book_isbn);
		logger.debug("결과값 ReviewList: {}", ReviewList);
		
		//본문글정보와 리플목록을 모델에 저장
		model.addAttribute("book", book);
		model.addAttribute("replylist", ReviewList);
		model.addAttribute("book_isbn", book_isbn);
		
		return "book/bookDetail";
	}
	
	//댓글 저장
	@RequestMapping (value="book_review", method=RequestMethod.POST)    //value 확인!!
	public String insert(BookReview review, HttpSession session, Model model) {
		/* 로그인한 사람들 정보 저장 */
		String id = (String) session.getAttribute("loginId");
		logger.info("컨트롤러 id체크{}", id);
		review.setBook_review_writer(id);
		logger.info("컨트롤러{}", review);
		dao.insert(review);
		logger.info("메서드 끝");
		return "redirect:/bookDetail"; //나중에 고치기!!!!!!!
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

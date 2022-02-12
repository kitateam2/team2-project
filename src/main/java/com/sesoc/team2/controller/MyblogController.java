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

import com.sesoc.team2.dao.BlogPostDAO;
import com.sesoc.team2.vo.BlogPost;

//게시글 쓰기, 게시글 읽기, 팔로우 리스트
@Controller
@RequestMapping("myblog")
public class MyblogController {
	private static final Logger logger = LoggerFactory.getLogger(MyblogController.class);
	
	@Autowired
	BlogPostDAO dao;
	//개인블로그의 메인 (글 목록 나열)(개인 정보 나열)(친구목록)
	/*
	 * @RequestMapping(value = "main", method = RequestMethod.GET) public String
	 * myblog(Model model) { ArrayList<BlogPost> postlist =dao.postlist();
	 * logger.info("DB에서 가져온 목록{}", postlist); model.addAttribute("postlist",
	 * postlist); return "myblog/myblogMain"; }
	 */
	//(글 목록 나열) - 제목, 한줄, 날짜, 조회수 ??
	//(개인정보 나열에 - 세션의 사진, 세션의 회원등급, 회원의 팔로우 수)
	//(친구목록 나열에 - 세션으로 친구를 불러오는데 그 친구의 이름, 아이디)
	
	//글쓰기 페이지로 이동
	@RequestMapping(value = "newPost", method = RequestMethod.GET)
	public String myblogWrite() {
		return "myblog/myblogWrite";
	}
	
		
	//게시글 작성(저장)
	@RequestMapping (value="post_write", method=RequestMethod.POST)
	public String write(BlogPost blogpost, HttpSession session,	Model model) {
		
		//세션에서 로그인한 사용자의 아이디를 읽어서 Board객체의 작성자 정보에 세팅
		String id = (String) session.getAttribute("loginId");
		blogpost.setPost_id(id);
		
		int result = dao.post_write(blogpost);
		logger.debug("결과 값 : ", result);

		return "myblog/myblogWrite";
	}
	//게시글 읽기(전체 페이지, 1개 불러오기)
	/*
	 * @RequestMapping(value = "one_post", method = RequestMethod.GET) 
	 * public String onepost(BlogPost blogpost, Model model,
	 * @RequestParam(value="post_no", defaultValue="1") int post_no) {
	 * blogpost.setPost_no(post_no); 
	 * BlogPost one_post = dao.onepost(post_no);
	 * model.addAttribute("one_post" , one_post); 
	 * logger.debug("결과 값 : ", one_post);
	 * return "myblog/myblogOnePost"; }
	 */
	@RequestMapping(value = "one_post", method = RequestMethod.GET) 
	public String one_post(int post_no, Model model) {
		//전달된 글 번호로 해장 글정보를 읽기
		BlogPost one_post = dao.one_post(post_no);
		
		//해당 번호의 글이 없으면 글목록으로 이동
		if (one_post == null) {
			return "redirect:myblog/myblogMain";
		}
		
		//글 정보를 모델에 저장?
		model.addAttribute("one_post", one_post);
		model.addAttribute("post_id", one_post.getPost_id());
		logger.debug("결과 값 : ", one_post);
		
		return "myblog/myblogOnePost";
	}
	
	
	//게시글 삭제
	@RequestMapping (value="post_delete", method=RequestMethod.GET)
	public String post_delete(int post_no, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		BlogPost blogpost = new BlogPost();
		blogpost.setPost_no(post_no);
		blogpost.setPost_id(id);
		
		dao.post_delete(blogpost);
		
		return "redirect:myblog/myblogMain?id=" +id;
		
	}
	//쪽지로 이동
		@RequestMapping(value = "messageWindow", method = RequestMethod.GET)
		public String messageWindow() {
			return "messageWindow";
		}
	
	//댓글 작성(저장, 등록)
	//댓글 좋아요
	//댓글 삭제 (글을 쓴 사람만 지울 수 잇음, 블로그의 주인이 아니야, 주인도 바꿀 수 있게 할 것인가)
	
	//팔로우하기
	//팔로우취소(한번 더 누르면?)- 누르기 전에는 팔로잉이라고 뜨기
	
	
}

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
import com.sesoc.team2.vo.PostComment;

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
		blogpost.setUser_id(id);
		
		int result = dao.post_write(blogpost);
		logger.info("결과 값 result: ", result);

		return "myblog/myblogWrite";
	}
	//게시글 읽기(전체 페이지, 1개 불러오기)
	@RequestMapping(value = "one_post", method = RequestMethod.GET) 
	public String one_post(int post_no, Model model) {
		//전달된 글 번호로 해장 글정보를 읽기
		BlogPost one_post = dao.one_post(post_no);
		
		//해당 번호의 글이 없으면 글목록으로 이동
		if (one_post == null) {
			return "redirect:myblog/myblogMain";
		}
		
		/*
		 * //해당 글에 달린 리플목록 읽기 ArrayList<PostComment> replylist =
		 * dao.post_reply(post_no);
		 */
		
		//글 정보를 모델에 저장?
		model.addAttribute("one_post", one_post);
		//아이디를 따로 입력하지 않아도 자동으로 로그인 한 값이 들어가게 하는 코드
		model.addAttribute("post_id", one_post.getUser_id());
		logger.info("결과 값 one_post: ", one_post.getPost_no());  
		
		return "myblog/myblogOnePost";
	}
	
	
	//게시글 삭제
	@RequestMapping (value="post_delete", method=RequestMethod.GET)
	public String post_delete(int post_no, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		BlogPost blogpost = new BlogPost();
		blogpost.setPost_no(post_no);
		blogpost.setUser_id(user_id);
		
		dao.post_delete(blogpost);
		
		return "redirect:main";
		
	}
	
	//리플저장
	@RequestMapping (value="post_comment", method=RequestMethod.POST)
	public String post_comment_insert(PostComment postcomment
				                      , HttpSession session
				                      ,  Model model){
		/* 로그인한 사람의 정보를 저장 */
		String id = (String) session.getAttribute("loginId");	
		logger.info("컨트롤러{}",id);
		postcomment.setPost_comment_writter(id);
		logger.info("컨트롤러{}",postcomment);
		dao.post_comment_insert(postcomment);
		return "redirect:one_post?post_no=" + postcomment.getPost_no();
	}
	
	
	
	//리플 불러오기 --는 상세보기에 넣어야하고
	//리플 삭제
	
	//쪽지로 이동
		@RequestMapping(value = "messageWindow", method = RequestMethod.GET)
		public String messageWindow() {
			return "myblog/messageWindow"; //의문인 것이 블로그 메인이랑 메시지는 같은 위치에 잇는데 왜 앞에 마이블로그를 붙여줘야하지
		}
	
	//댓글 작성(저장, 등록)
	//댓글 좋아요
	//댓글 삭제 (글을 쓴 사람만 지울 수 잇음, 블로그의 주인이 아니야, 주인도 바꿀 수 있게 할 것인가)
	
	//팔로우하기
	//팔로우취소(한번 더 누르면?)- 누르기 전에는 팔로잉이라고 뜨기
	
	
}

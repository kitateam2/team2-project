package com.sesoc.team2.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.sesoc.team2.dao.BlogPostDAO;
import com.sesoc.team2.util.FileService;
import com.sesoc.team2.vo.BlogPost;
import com.sesoc.team2.vo.Book;
import com.sesoc.team2.vo.PostComment;

//게시글 쓰기, 게시글 읽기, 팔로우 리스트
@Controller
@RequestMapping("myblog")
public class MyblogController {
	private static final Logger logger = LoggerFactory.getLogger(MyblogController.class);
	
	@Autowired
	BlogPostDAO dao;
	//개인블로그의 메인 (글 목록 나열)(개인 정보 나열)(친구목록)
	//(글 목록 나열) - 제목, 한줄, 날짜, 조회수 ??
	//(개인정보 나열에 - 세션의 사진, 세션의 회원등급, 회원의 팔로우 수)
	//(친구목록 나열에 - 세션으로 친구를 불러오는데 그 친구의 이름, 아이디)
	
	//게시판 관련 상수
	final String uploadPath = "/team2Img";
	
	
	//글쓰기 페이지로 이동
	@RequestMapping(value = "newPost", method = RequestMethod.GET)
	public String myblogWrite() {
		return "myblog/myblogWrite";
	}
	
		
	//게시글 작성(저장)
	@RequestMapping (value="post_write", method=RequestMethod.POST)
	public String write(BlogPost blogpost
						, HttpSession session
						,	Model model
						, 	MultipartFile upload) {
		
		//세션에서 로그인한 사용자의 아이디를 읽어서 Board객체의 작성자 정보에 세팅
		String id = (String) session.getAttribute("loginId");
		
		/* 받은 책 이름을 저장을 해야하는 겅가 
		 * 아니지 이럴 필요가 없지 그냥 스트링으로 blogpost에 저장이 되고 그거를 불러 올 때 그 값으로 객체를 생성해서 lsbn을 불러오고
		 * 그걸로 해당 책을 찯아서 isbn이 같으면 그게 나타나게 해야하는 것인가
		 */
		/* String post_book_title = blogpost.getPost_book_title; */
		
		blogpost.setUser_id(id);
		
		logger.info("파일 정보 : {}", upload.getContentType());
		logger.info("파일 정보 : {}", upload.getName());
		logger.info("파일 정보 : {}", upload.getOriginalFilename());
		logger.info("파일 정보 : {}", upload.getSize());
		logger.info("파일 정보 : {}", upload.isEmpty());
		
		if (!upload.isEmpty()) {
			//uploadPath이거가 위에서 알려준 저장 경로야, 폴더이름 같은거지
			//FileService이거 선생님이 만든거 우리도 만들어야해 
			String savedfile = FileService.saveFile(upload, uploadPath);
			blogpost.setPost_originalfile(upload.getOriginalFilename());
			blogpost.setPost_savedfile(savedfile);
		}
		

		int result = dao.post_write(blogpost);
		logger.info("결과 값 result: ", result);

		return "myblog/myblogWrite";
	}
	
	
	//게시글 읽기(전체 페이지, 1개 불러오기)
	@RequestMapping(value = "{user_id}/one_post", method = RequestMethod.GET) 
	public String one_post(@PathVariable String user_id, int post_no, Model model) {
			//전달된 글 번호로 해장 글정보를 읽기
			BlogPost one_post = dao.one_post(post_no);
			
			//해당 번호의 글이 없으면 글목록으로 이동
			if (one_post == null) {
				return "myblog/myblogMain";
			} //목록에서 누르는 거니까 이게 사실 없어도 되는 건가?
			
			
			//해당 글에 달린 리플목록 읽기
			ArrayList<PostComment> post_comment_list = dao.post_comment_list(post_no);
			
			
			//글 정보를 모델에 저장?
			model.addAttribute("one_post", one_post);
			//아이디를 따로 입력하지 않아도 자동으로 로그인 한 값이 들어가게 하는 코드
			model.addAttribute("post_id", one_post.getUser_id());
			//리플을 모델에 저장
			model.addAttribute("post_comment_list", post_comment_list);
			logger.info("결과 값 one_post: {}", one_post.getPost_no());  
			logger.info("어떤값을 가지고 왔나 ~ 첨부파일이 있나 ~{}", one_post);
			logger.info("결과는 컨트롤러에 댓글 리스트: {}");
			return "myblog/myblogOnePost";
	}
	
	
	//첨부파일 보여주기
	@RequestMapping (value="{user_id}/show_file", method=RequestMethod.GET)
	public String post_show(@PathVariable String user_id,int post_no, Model model, HttpServletResponse response) {
		BlogPost blogpost = dao.one_post(post_no);
		logger.info("쇼파일에 넘버{}", post_no);
		logger.info("쇼파일에 1{}", blogpost);
		
		String post_originalfile = new String(blogpost.getPost_originalfile());
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(post_originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String fullPath = uploadPath + "/" + blogpost.getPost_savedfile();
		logger.info("쇼파일에 2{}", fullPath);
	
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸 이용하여 출력
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	//게시글 삭제
	@RequestMapping (value="post_delete", method=RequestMethod.GET)
	public String post_delete(int post_no, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		BlogPost blogpost = new BlogPost();
		blogpost.setPost_no(post_no);
		blogpost.setUser_id(user_id);
		
		dao.post_delete(blogpost);
		
		return "redirect:"+ user_id;
		
	}
	
	//게시글 수정 폼으로 이동
	@RequestMapping (value="post_edit", method=RequestMethod.GET)
	public String myblog_edit(int post_no, Model model, HttpSession session) {

		BlogPost blogpost = dao.one_post(post_no);
		model.addAttribute("blogpost", blogpost);
		
		return "myblog/myblogEdit";
	}
	
	//게시글 수정하기
	@RequestMapping (value="post_edit", method=RequestMethod.POST)
	public String post_edit(BlogPost blogpost
							, HttpSession session
							, MultipartFile upload) {
		//본인글인지 확인
		String user_id = (String) session.getAttribute("loginId");
		BlogPost old_blogpost = dao.one_post(blogpost.getPost_no());
		//만약에 가지고 온 값이 없거나 내 글이 아니면 리스트로 돌아가라
		if( old_blogpost == null || !old_blogpost.getUser_id().equals(user_id)) {
			return "redirect: "+user_id+"/one_post";
		}
		
		//맞으면
		blogpost.setUser_id(user_id);
		
		if (!upload.isEmpty()) {
			//기존 글에 첨부된 파일의 실제 저장된 이름
			String post_savedfile = old_blogpost.getPost_savedfile();
			//기존 파일이 있으면 삭제
			if (post_savedfile != null) {
				FileService.deleteFile(uploadPath + "/" + post_savedfile);
			}
			
			//새로 업로드한 파일 저장
			post_savedfile = FileService.saveFile(upload, uploadPath);
			
			//수정 정보에 새로 저장된 파일명과 원래의 파일명 저장
			blogpost.setPost_originalfile(upload.getOriginalFilename());
			blogpost.setPost_savedfile(post_savedfile);
		}
		
		//그 뭐야 책이 없는거는 널값도 허용할 거니까 굳이 조건을 넣지 않아도 되지 않은가 

		
		
		
		int result = dao.post_edit(blogpost);
		
		logger.info("수정된 값{}", result);
		
		return "redirect:"+user_id+"/one_post?post_no=" + blogpost.getPost_no();
	}
	
	//게시글 댓글 저장
	@RequestMapping (value="post_comment", method=RequestMethod.POST)
	public String post_comment_insert(PostComment postcomment
				                      , HttpSession session
				                      ,  Model model
				                      , String user_id){
		/* user_id는 게시글 주인 아이디 */
		/* 로그인한 사람의 정보를 저장 */
		String id = (String) session.getAttribute("loginId");	
		logger.info("컨트롤러{}",id);
		postcomment.setPost_comment_writter(id);
		logger.info("컨트롤러{}",postcomment);
		dao.post_comment_insert(postcomment);
		return "redirect:" +user_id+ "/one_post?post_no=" + postcomment.getPost_no();
	}
	
	
	
	//게시글 댓글 불러오기 --는 게시글 상세보기에서 같이 실행
	//게시글 댓글 삭제        //삭제하기에 널값이 들어가는거 어떡하지
	@RequestMapping (value="post_comment_delete", method=RequestMethod.GET) 
	public String post_comment_delete(PostComment postcomment
				                      , HttpSession session
				                      , String user_id){
		/* 로그인한 사람의 정보를 저장 */
		String id = (String) session.getAttribute("loginId");
		postcomment.setPost_comment_writter(id);
		
		dao.post_comment_delete(postcomment);
		logger.info("ㅇㅇ{}", postcomment.getPost_no());
	return "redirect:"+ user_id +"/one_post?post_no=" + postcomment.getPost_no();
	}
	
	//댓글 좋아요
	@RequestMapping (value="post_comment_like", method=RequestMethod.GET) 
	public String post_comment_like(PostComment postcomment, HttpSession session){
		
		//아이디 정보 가지고 와서 조건으로 본인 글에는 못 누르게 해야겠다 
		String id = (String) session.getAttribute("loginId");
		postcomment.setPost_comment_writter(id);
		
		logger.info("좋아요{}", postcomment);
		dao.post_comment_like(postcomment);
		return "redirect:"+ id +"/one_post?post_no=" + postcomment.getPost_no();
	}
	
	//댓글 수정
	@RequestMapping (value="post_comment_edit", method=RequestMethod.POST) 
	public String post_comment_edit(PostComment postcomment
									, HttpSession session
									, String user_id){
		/* 로그인한 사람의 정보를 저장 */
		String id = (String) session.getAttribute("loginId");
		postcomment.setPost_comment_writter(id);
		
		//댓글 수정 처리
		dao.post_comment_edit(postcomment);
		return "redirect:"+ user_id +"/one_post?post_no=" + postcomment.getPost_no(); 
	}
	
	//책 제목 자동완성
	@ResponseBody
	@RequestMapping(value = "/json_auto_book", method = RequestMethod.GET)
	public String json_auto_book(String text) throws Exception {
		ArrayList<Book> array_post_book = dao.array_post_book(text);
		logger.debug("제목 자동완성 {}", array_post_book);
		Gson gson = new Gson();
		return gson.toJson(array_post_book);
	}
		

}

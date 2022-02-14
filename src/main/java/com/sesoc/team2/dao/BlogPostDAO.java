package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.controller.MyblogController;
import com.sesoc.team2.vo.BlogPost;
import com.sesoc.team2.vo.PostComment;

@Repository
public class BlogPostDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MyblogController.class);
	
	@Autowired
	SqlSession sqlSession;

	public int post_write(BlogPost blogpost) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = 0;
		result = mapper.post_write(blogpost);
		return result;
	}

	public ArrayList<BlogPost> postlist() {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		ArrayList<BlogPost> postlist = mapper.postlist();
		return postlist;
	}

	public BlogPost one_post(int post_no) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		BlogPost one_post = mapper.one_post(post_no);
		
		//조회수 1증가
				mapper.add_hits(post_no);
		return one_post;
	}

	public int post_delete(BlogPost blogpost) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = 0;
		result = mapper.post_delete(blogpost);
		return result;
	}
	
	
	//리플저장
	public int post_comment_insert(PostComment postcomment) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = mapper.post_comment_insert(postcomment);
		logger.info("DAO{}",result);
		return result;
	}

	//리플 리스트
	public ArrayList<PostComment> post_reply(int post_no) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		ArrayList<PostComment> replylist = mapper.post_reply(post_no);
		
		return replylist;
	}
}

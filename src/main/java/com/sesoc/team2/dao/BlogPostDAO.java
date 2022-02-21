package com.sesoc.team2.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
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
	
	//게시글 쓰기
	public int post_write(BlogPost blogpost) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = 0;
		result = mapper.post_write(blogpost);
		return result;
	}
	
	//게시글 정렬하기
	public ArrayList<BlogPost> postlist(HashMap<String, String> map, int startRecord, int countPerPage) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		
		//전체 검색 결과 중 읽을 시작위치와 개수 --RowBounds 는 마이바티스에서 제공하는 기능
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		logger.info("map 확인 다오{}", map);
		ArrayList<BlogPost> postlist = mapper.postlist(map, rb);
		return postlist;
	}
	
	//게시글 상세보기
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
	public ArrayList<PostComment> post_comment_list(int post_no) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		ArrayList<PostComment> post_comment_list = mapper.post_comment_list(post_no);
		logger.info("댓글리스트 dao :", post_comment_list);
		return post_comment_list;
	}

	public int post_comment_delete(PostComment postcomment) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = mapper.post_comment_delete(postcomment);
		return result;
	}

	public int post_edit(BlogPost blogpost) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = mapper.post_edit(blogpost);
		return result;
	}

	public int post_comment_like(PostComment postcomment) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = mapper.post_comment_like(postcomment);
		
		logger.info("도움이 되어라{}", result);
		return result;
	}

	public int get_total(String searchText) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int total = mapper.get_total(searchText);
		return total;
	}

}

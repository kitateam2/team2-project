package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.BlogPost;

@Repository
public class BlogPostDAO {
	
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
		return one_post;
	}

	public void post_delete(BlogPost blogpost) {
		BlogPostMapper mapper = sqlSession.getMapper(BlogPostMapper.class);
		int result = 0;
		result = mapper.post_delete(blogpost);
	}

}

package com.sesoc.team2.dao;

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

}
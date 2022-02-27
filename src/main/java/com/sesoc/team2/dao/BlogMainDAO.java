package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.BlogMain;
import com.sesoc.team2.vo.Follow;

@Repository
public class BlogMainDAO {
	@Autowired
	SqlSession sqlSession;

	public ArrayList<BlogMain> list(String searchText, int startRecord, int countPerPage) {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		ArrayList<BlogMain> list = mapper.list(searchText, rb);
		return list;
	}
	
	public int getTotal(String searchText) {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		int total = mapper.getTotal(searchText);
		return total;
	}
	
	public ArrayList<BlogMain> postlist() {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		ArrayList<BlogMain> postlist = mapper.postlist();
		return postlist;
	}
	
	public ArrayList<Follow> bloglist() {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		ArrayList<Follow> bloglist = mapper.bloglist();
		return bloglist;
	}
	
	public Integer grade(BlogMain blogmain) {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		Integer total = mapper.grade(blogmain);
		return total;
	}
}
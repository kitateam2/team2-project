package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.BlogMain;

@Repository
public class BlogMainDAO {
	@Autowired
	SqlSession sqlSession;

	public ArrayList<BlogMain> list(String searchText) {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		ArrayList<BlogMain> list = mapper.list(searchText);
		return list;
	}

	public ArrayList<BlogMain> ranklist() {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		ArrayList<BlogMain> ranklist = mapper.ranklist();
		return ranklist;
	}
	
	public Integer grade(BlogMain blogmain) {
		BlogMainMapper mapper = sqlSession.getMapper(BlogMainMapper.class);
		Integer total = mapper.grade(blogmain);
		return total;
	}
}
package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.Book;

@Repository
public class MainDataDAO {
	
	@Autowired
	SqlSession sqlSession;
	
//	//신작 도서 _메인페이지에 업데이트
	public ArrayList<Book> insertdate() {
		MainDataMapper mapper = sqlSession.getMapper(MainDataMapper.class);
		ArrayList<Book> datelist = mapper.datelist();
		return datelist;
	}
	
	//베스트 셀러 도서 _메인페이지에 업데이트
		public ArrayList<Book> insertBest() {
			MainDataMapper mapper = sqlSession.getMapper(MainDataMapper.class);
			ArrayList<Book> bestlist = mapper.bestlist();
			return bestlist;
		}

}

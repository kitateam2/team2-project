package com.sesoc.team2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.Book;

@Repository
public class MainDataDAO {
	
	@Autowired
	SqlSession sqlSession;
	
//	//신작 도서 _메인페이지에 업데이트
//	public Book get_date(String date_info) {
//		MainDataMapper mapper = sqlSession.getMapper(MainDataMapper.class);
//		//6개의 신작도서 
//		Book mainRecommend = mapper    getBook(date_info);
//		return mainRecommend;
//	}

}

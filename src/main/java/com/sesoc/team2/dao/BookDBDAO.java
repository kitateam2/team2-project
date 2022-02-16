package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.controller.MyblogController;
import com.sesoc.team2.vo.BookDB;
import com.sesoc.team2.vo.BookReview;
import com.sesoc.team2.vo.PostComment;

@Repository
public class BookDBDAO {
	@Autowired
	SqlSession sqlsession;
	
	private static final Logger logger = LoggerFactory.getLogger(MyblogController.class);
	
	
	//도서 api_db 저장
	public int insert_db(BookDB bookDB) {
		BookDBMapper mapper = sqlsession.getMapper(BookDBMapper.class);
		int result = 0;
		try {
			result = mapper.insert_db(bookDB);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//댓글 저장
	public int insert(BookReview review) {
		BookDBMapper mapper = sqlsession.getMapper(BookDBMapper.class);
		int result = mapper.insert(review);
		logger.info("DAO{}", result);
		return result;
	}
	
	//댓글 목록 읽기
	public ArrayList<BookReview> BookReviewList(int book_review_no) {
		BookDBMapper mapper = sqlsession.getMapper(BookDBMapper.class);
		ArrayList<BookReview> BookReviewList = mapper.BookReviewList(book_review_no);
		logger.info("댓글리스트 dao :", BookReviewList);
		return BookReviewList;
	}
	
	//댓글 삭제
	public int bookReview_delete (BookReview review) {
		BookDBMapper mapper = sqlsession.getMapper(BookDBMapper.class);
		int result = mapper.bookReview_delete(review);
		return result;
	}

}

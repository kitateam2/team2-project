package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.BlogPost;
import com.sesoc.team2.vo.BookReview;

@Repository
public class ReviewDAO {
	@Autowired
	SqlSession sqlsession;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewDAO.class);
	

	//댓글 저장
	public int insert(BookReview review) {
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		int result = mapper.insert(review);
		logger.info("DAO{}", result);
		return result;
	}
	
	//댓글 목록 읽기
	public ArrayList<BookReview> BookReviewList(int book_no) {
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		ArrayList<BookReview> BookReviewList = mapper.BookReviewList(book_no);
		logger.info("댓글리스트 dao :", BookReviewList);
		return BookReviewList;
	}
	
	//댓글 삭제
	public int bookReview_delete (BookReview review) {
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		int result = mapper.bookReview_delete(review);
		return result;
	}
	
	//댓글 수정
	public int bookReview_edit(BookReview review) {
		ReviewMapper mapper = sqlsession.getMapper(ReviewMapper.class);
		int result = mapper.bookReview_edit(review);
		return result;
	}

}

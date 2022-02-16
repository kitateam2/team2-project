package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.BookDB;
import com.sesoc.team2.vo.BookReview;

public interface BookDBMapper {

	//db 저장
	public int insert_db(BookDB bookDB);
	
	//public String createDocument();
	public int insert(BookReview review); 
	
	//댓글 목록
	public ArrayList<BookReview> BookReviewList(int book_review_no);
		
	//댓글 삭제
	public int bookReview_delete (BookReview review);
	
}

package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.team2.vo.Book;

public interface BookInfoMapper {
	
	//글번호로 해당 게시글 검색
	public Book getBook(String book_no);
	//검색 후의 총 글 개수
	public int getTotal(String searchText);
	//검색 후의 현재 페이지 목록
	public ArrayList<Book> listBook(String searchText, RowBounds rb);
	//검색어로 db에서 글 목록 가져오기
	public ArrayList<Book> bookListUp(String bookname);
	

	
}

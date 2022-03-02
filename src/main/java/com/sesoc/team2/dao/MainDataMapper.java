package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Book;

public interface MainDataMapper {
	
	//신작도서
	public ArrayList<Book> datelist();
	//베스트셀러 도서
	public ArrayList<Book> bestlist();
	//별점 리뷰순 도서
	public ArrayList<Book> rewardlist();
	//베스트셀러 도서 리스트업
	public ArrayList<Book> bestListUp();
	//베스트셀러 도서 리스트업
	public ArrayList<Book> bestRating();
	//최신 도서 리스트업
	public ArrayList<Book> latest();
}

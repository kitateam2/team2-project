package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Book;

public interface MainDataMapper {
	
	//신작도서
	public ArrayList<Book> datelist();
	//베스트셀러 도서
	public ArrayList<Book> bestlist();
	//베스트셀러 도서
	public ArrayList<Book> rewardlist();

}

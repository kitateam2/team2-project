package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.Book;

@Repository
public class BookInfoDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 글 번호로 해당 게시글 읽기
	 * @param boardnum 검색할 글번호
	 * @return 검색된 게시글 정보. 없으면 null.
	 */
	public Book getBook(String book_no) {
		BookInfoMapper mapper = sqlSession.getMapper(BookInfoMapper.class);
		//해당 번호의 글정보 읽기
		Book book = mapper.getBook(book_no);
		return book;
	}
	
	/**
	 * 검색 결과 레코드 수
	 * @param searchText 검색어
	 * @return 글개수
	 */
	public int getTotal(String searchText) {
		BookInfoMapper mapper = sqlSession.getMapper(BookInfoMapper.class);
		int total = mapper.getTotal(searchText);
		return total;
	}

	
	/**
	 * 한 페이지의 게시글 목록 읽기
	 * @param searchText 검색어
	 * @param startRecord 전체 결과중 읽을 시작 위치 (첫 행은 0)
	 * @param countPerPage 읽을 레코드 수 (한 페이지당 글 개수)
	 * @return 글목록
	 */
	public ArrayList<Book> listBook(String searchText, int startRecord, int countPerPage) {
		BookInfoMapper mapper = sqlSession.getMapper(BookInfoMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		//검색어와 읽을 범위를 전달
		ArrayList<Book> booklist = mapper.listBook(searchText, rb);
		return booklist;
	}

	public ArrayList<Book> bookListUp(String bookname) {
		BookInfoMapper mapper = sqlSession.getMapper(BookInfoMapper.class);
		ArrayList<Book> booklist = mapper.bookListUp(bookname);
		return booklist;
	}

}

package com.sesoc.team2.vo;

public class API {

	private String book_title; 					//책 이름
	private String book_isbn;	 					//ISBN 번호
	private String book_author;	 				//저자 이름
	private String book_publisher; 				//출판사
	private int book_price; 					//가격
	private String book_image; 					//책 표지
	private String book_desc;					//책 내용
	private String book_pubDate; 				//출판일자
	
	public API() {
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public String getBook_desc() {
		return book_desc;
	}

	public void setBook_desc(String book_desc) {
		this.book_desc = book_desc;
	}

	public String getBook_pubDate() {
		return book_pubDate;
	}

	public void setBook_pubDate(String book_pubDate) {
		this.book_pubDate = book_pubDate;
	}

	@Override
	public String toString() {
		return "BookDB [book_title=" + book_title + ", book_isbn=" + book_isbn + ", book_author=" + book_author
				+ ", book_publisher=" + book_publisher + ", book_price=" + book_price + ", book_image=" + book_image
				+ ", book_desc=" + book_desc + ", book_pubDate=" + book_pubDate + "]";
	}
}

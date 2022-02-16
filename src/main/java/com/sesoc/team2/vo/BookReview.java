package com.sesoc.team2.vo;

public class BookReview {
	private int book_review_no;
	private String book_review_writer;
	private String book_review_short;
	private String book_review_date;
	private int book_review_star;
	private String book_isbn;
	
	public BookReview() {
	}
	
	public BookReview(int book_review_no, String book_review_writer, String book_review_short, String book_review_date, int book_review_star, String book_isbn) {
		this.book_review_no = book_review_no;
		this.book_review_writer = book_review_writer;
		this.book_review_short = book_review_short;
		this.book_review_date = book_review_date;
		this.book_review_star = book_review_star;
		this.book_isbn = book_isbn;
	}

	public int getBook_review_no() {
		return book_review_no;
	}

	public void setBook_review_no(int book_review_no) {
		this.book_review_no = book_review_no;
	}

	public String getBook_review_writer() {
		return book_review_writer;
	}

	public void setBook_review_writer(String book_review_writer) {
		this.book_review_writer = book_review_writer;
	}

	public String getBook_review_short() {
		return book_review_short;
	}

	public void setBook_review_short(String book_review_short) {
		this.book_review_short = book_review_short;
	}

	public String getBook_review_date() {
		return book_review_date;
	}

	public void setBook_review_date(String book_review_date) {
		this.book_review_date = book_review_date;
	}

	public int getBook_review_star() {
		return book_review_star;
	}

	public void setBook_review_star(int book_review_star) {
		this.book_review_star = book_review_star;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	@Override
	public String toString() {
		return "BookReview [book_review_no=" + book_review_no + ", book_review_writer=" + book_review_writer
				+ ", book_review_short=" + book_review_short + ", book_review_date=" + book_review_date
				+ ", book_review_star=" + book_review_star + ", book_isbn=" + book_isbn + "]";
	}
	
}

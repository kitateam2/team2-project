package com.sesoc.team2.vo;

public class user_wishlist {
int user_wish_no;
String user_id;
String book_isbn;
String book_title;

public user_wishlist() {
}

public int getUser_wish_no() {
	return user_wish_no;
}

public void setUser_wish_no(int user_wish_no) {
	this.user_wish_no = user_wish_no;
}

public String getUser_id() {
	return user_id;
}

public void setUser_id(String user_id) {
	this.user_id = user_id;
}

public String getBook_isbn() {
	return book_isbn;
}

public void setBook_isbn(String book_isbn) {
	this.book_isbn = book_isbn;
}

public String getBook_title() {
	return book_title;
}

public void setBook_title(String book_title) {
	this.book_title = book_title;
}

@Override
public String toString() {
	return "user_wishlist [user_wish_no=" + user_wish_no + ", user_id=" + user_id + ", book_isbn=" + book_isbn
			+ ", book_title=" + book_title + "]";
}





}

package com.sesoc.team2.vo;

public class user_wishlist {
int user_wish_no;
String user_id;
String book_isbn;

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

@Override
public String toString() {
	return "user_wishlist [user_wish_no=" + user_wish_no + ", user_id=" + user_id + ", book_isbn=" + book_isbn + "]";
}


}

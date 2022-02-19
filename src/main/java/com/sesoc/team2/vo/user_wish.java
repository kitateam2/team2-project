package com.sesoc.team2.vo;

public class user_wish {
String book_isbn;
String user_id;
int user_wish_no;


public user_wish() {

}


public String getBook_isbn() {
	return book_isbn;
}


public void setBook_isbn(String book_isbn) {
	this.book_isbn = book_isbn;
}


public String getUser_id() {
	return user_id;
}


public void setUser_id(String user_id) {
	this.user_id = user_id;
}


public int getUser_wish_no() {
	return user_wish_no;
}


public void setUser_wish_no(int user_wish_no) {
	this.user_wish_no = user_wish_no;
}


@Override
public String toString() {
	return "user_wish [book_isbn=" + book_isbn + ", user_id=" + user_id + ", user_wish_no=" + user_wish_no + "]";
}





}

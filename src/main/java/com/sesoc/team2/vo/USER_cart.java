package com.sesoc.team2.vo;

public class USER_cart {
int user_cart_no;
String cart_date;
String book_isbn;
String user_id;
int user_cart_count;
public USER_cart() {
	super();
}
public int getUser_cart_no() {
	return user_cart_no;
}
public void setUser_cart_no(int user_cart_no) {
	this.user_cart_no = user_cart_no;
}
public String getCart_date() {
	return cart_date;
}
public void setCart_date(String cart_date) {
	this.cart_date = cart_date;
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
public int getUser_cart_count() {
	return user_cart_count;
}
public void setUser_cart_count(int user_cart_count) {
	this.user_cart_count = user_cart_count;
}
@Override
public String toString() {
	return "USER_cart [user_cart_no=" + user_cart_no + ", cart_date=" + cart_date + ", book_isbn=" + book_isbn
			+ ", user_id=" + user_id + ", user_cart_count=" + user_cart_count + "]";
}


}



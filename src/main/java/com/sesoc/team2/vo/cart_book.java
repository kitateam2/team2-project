package com.sesoc.team2.vo;

public class cart_book {
int cart_book_no;
String cart_book_inputdate;
int cart_book_count;
String book_isbn;
int user_cart_no;
public cart_book() {
	super();
}
public int getCart_book_no() {
	return cart_book_no;
}
public void setCart_book_no(int cart_book_no) {
	this.cart_book_no = cart_book_no;
}
public String getCart_book_inputdate() {
	return cart_book_inputdate;
}
public void setCart_book_inputdate(String cart_book_inputdate) {
	this.cart_book_inputdate = cart_book_inputdate;
}
public int getCart_book_count() {
	return cart_book_count;
}
public void setCart_book_count(int cart_book_count) {
	this.cart_book_count = cart_book_count;
}
public String getBook_isbn() {
	return book_isbn;
}
public void setBook_isbn(String book_isbn) {
	this.book_isbn = book_isbn;
}
public int getUser_cart_no() {
	return user_cart_no;
}
public void setUser_cart_no(int user_cart_no) {
	this.user_cart_no = user_cart_no;
}
@Override
public String toString() {
	return "cart_book [cart_book_no=" + cart_book_no + ", cart_book_inputdate=" + cart_book_inputdate
			+ ", cart_book_count=" + cart_book_count + ", book_isbn=" + book_isbn + ", user_cart_no=" + user_cart_no
			+ "]";
}


}

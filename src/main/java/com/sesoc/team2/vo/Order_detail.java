package com.sesoc.team2.vo;

public class Order_detail {
int odrer_detail_no;
int book_price;
int oder_detail_count;
String book_isbn;
int order_no;




public Order_detail() {

}




public int getOdrer_detail_no() {
	return odrer_detail_no;
}




public void setOdrer_detail_no(int odrer_detail_no) {
	this.odrer_detail_no = odrer_detail_no;
}




public int getBook_price() {
	return book_price;
}




public void setBook_price(int book_price) {
	this.book_price = book_price;
}




public int getOder_detail_count() {
	return oder_detail_count;
}




public void setOder_detail_count(int oder_detail_count) {
	this.oder_detail_count = oder_detail_count;
}




public String getBook_isbn() {
	return book_isbn;
}




public void setBook_isbn(String book_isbn) {
	this.book_isbn = book_isbn;
}




public int getOrder_no() {
	return order_no;
}




public void setOrder_no(int order_no) {
	this.order_no = order_no;
}




@Override
public String toString() {
	return "Order_detail [odrer_detail_no=" + odrer_detail_no + ", book_price=" + book_price + ", oder_detail_count="
			+ oder_detail_count + ", book_isbn=" + book_isbn + ", order_no=" + order_no + "]";
}









}




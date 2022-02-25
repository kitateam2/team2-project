package com.sesoc.team2.vo;

public class Order_list {
int order_no;
String oder_date;
int order_totalprice;
String order_state;
String user_id;
String order_address;


public Order_list() {
	
}


public int getOrder_no() {
	return order_no;
}


public void setOrder_no(int order_no) {
	this.order_no = order_no;
}


public String getOder_date() {
	return oder_date;
}


public void setOder_date(String oder_date) {
	this.oder_date = oder_date;
}


public int getOrder_totalprice() {
	return order_totalprice;
}


public void setOrder_totalprice(int order_totalprice) {
	this.order_totalprice = order_totalprice;
}


public String getOrder_state() {
	return order_state;
}


public void setOrder_state(String order_state) {
	this.order_state = order_state;
}


public String getUser_id() {
	return user_id;
}


public void setUser_id(String user_id) {
	this.user_id = user_id;
}


public String getOrder_address() {
	return order_address;
}


public void setOrder_address(String order_address) {
	this.order_address = order_address;
}


@Override
public String toString() {
	return "Order_list [order_no=" + order_no + ", oder_date=" + oder_date + ", order_totalprice=" + order_totalprice
			+ ", order_state=" + order_state + ", user_id=" + user_id + ", order_address=" + order_address + "]";
}









}

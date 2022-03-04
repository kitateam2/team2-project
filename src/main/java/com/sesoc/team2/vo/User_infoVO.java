package com.sesoc.team2.vo;

public class User_infoVO {
String user_id;
String user_pw;
String user_name;
String user_birth;
String user_phone;
String user_address;
String user_genre;
String user_grade;


public User_infoVO() {

}


public String getUser_id() {
	return user_id;
}


public void setUser_id(String user_id) {
	this.user_id = user_id;
}


public String getUser_pw() {
	return user_pw;
}


public void setUser_pw(String user_pw) {
	this.user_pw = user_pw;
}


public String getUser_name() {
	return user_name;
}


public void setUser_name(String user_name) {
	this.user_name = user_name;
}


public String getUser_birth() {
	return user_birth;
}


public void setUser_birth(String user_birth) {
	this.user_birth = user_birth;
}


public String getUser_phone() {
	return user_phone;
}


public void setUser_phone(String user_phone) {
	this.user_phone = user_phone;
}


public String getUser_address() {
	return user_address;
}


public void setUser_address(String user_address) {
	this.user_address = user_address;
}


public String getUser_genre() {
	return user_genre;
}


public void setUser_genre(String user_genre) {
	this.user_genre = user_genre;
}


public String getUser_grade() {
	return user_grade;
}


public void setUser_grade(String user_grade) {
	this.user_grade = user_grade;
}


@Override
public String toString() {
	return "User_infoVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_birth="
			+ user_birth + ", user_phone=" + user_phone + ", user_address=" + user_address + ", user_genre="
			+ user_genre + ", user_grade=" + user_grade + "]";
}





}

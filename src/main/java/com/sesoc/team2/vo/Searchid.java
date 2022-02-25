package com.sesoc.team2.vo;

public class Searchid {
	String user_id;
	String searchtext;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSearchtext() {
		return searchtext;
	}
	public void setSearchtext(String searchtext) {
		this.searchtext = searchtext;
	}
	public Searchid() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Searchid [user_id=" + user_id + ", searchtext=" + searchtext + "]";
	}
	
	
}

package com.sesoc.team2.vo;

public class BlogMain {
	int post_no;
	String user_id;
	String post_title;
	String post_contents;
	String post_uploaddate;
	String post_originalfile;
	String post_savedfile;
	
	public BlogMain() {		
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_contents() {
		return post_contents;
	}

	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}

	public String getPost_uploaddate() {
		return post_uploaddate;
	}

	public void setPost_uploaddate(String post_uploaddate) {
		this.post_uploaddate = post_uploaddate;
	}

	public String getPost_originalfile() {
		return post_originalfile;
	}

	public void setPost_originalfile(String post_originalfile) {
		this.post_originalfile = post_originalfile;
	}

	public String getPost_savedfile() {
		return post_savedfile;
	}

	public void setPost_savedfile(String post_savedfile) {
		this.post_savedfile = post_savedfile;
	}

	@Override
	public String toString() {
		return "BlogMain [post_no=" + post_no + ", user_id=" + user_id + ", post_title=" + post_title
				+ ", post_contents=" + post_contents + ", post_uploaddate=" + post_uploaddate + ", post_originalfile="
				+ post_originalfile + ", post_savedfile=" + post_savedfile + "]";
	}
}

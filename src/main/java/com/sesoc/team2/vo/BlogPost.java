package com.sesoc.team2.vo;

public class BlogPost {
	private int post_no;
	private String post_title;
	private String post_contents;
	private String post_uploaddate;
	private int post_hits;
	private String post_originalfile;
	private String post_savedfile;
	private String user_id;
	
	public BlogPost() {
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
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

	public int getPost_hits() {
		return post_hits;
	}

	public void setPost_hits(int post_hits) {
		this.post_hits = post_hits;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "BlogPost [post_no=" + post_no + ", post_title=" + post_title + ", post_contents=" + post_contents
				+ ", post_uploaddate=" + post_uploaddate + ", post_hits=" + post_hits + ", post_originalfile="
				+ post_originalfile + ", post_savedfile=" + post_savedfile + ", user_id=" + user_id + "]";
	}

	
	
	
}

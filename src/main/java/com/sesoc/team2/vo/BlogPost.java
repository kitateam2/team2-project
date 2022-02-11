package com.sesoc.team2.vo;

public class BlogPost {
	private int post_no;
	private String post_title;
	private String post_contents;
	private String post_uploaddate;
	private int post_hits;
	private String post_file;
	private String post_id;
	
	public BlogPost() {
	}
	
	public String getPost_id() {
		return post_id;
	}


	public void setPost_id(String post_id) {
		this.post_id = post_id;
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


	public String getPost_file() {
		return post_file;
	}


	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}


	@Override
	public String toString() {
		return "BlogPost [post_no=" + post_no + ", post_id="+ post_id +", post_title=" + post_title + ", post_contents=" + post_contents
				+ ", post_uploaddate=" + post_uploaddate + ", post_hits=" + post_hits + ", post_file=" + post_file
				+ "]";
	}
	
	
	
	
	
}

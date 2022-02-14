package com.sesoc.team2.vo;

public class PostComment {
	
	private int post_comment_no;
	private String post_comment_writter;
 	private String post_comment_content;
	private String post_comment_date;
	private int post_comment_like;
	private int post_no;
	
	public PostComment() {
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getPost_comment_no() {
		return post_comment_no;
	}

	public void setPost_comment_no(int post_comment_no) {
		this.post_comment_no = post_comment_no;
	}

	public String getPost_comment_writter() {
		return post_comment_writter;
	}

	public void setPost_comment_writter(String post_comment_writter) {
		this.post_comment_writter = post_comment_writter;
	}

	public String getPost_comment_content() {
		return post_comment_content;
	}

	public void setPost_comment_content(String post_comment_content) {
		this.post_comment_content = post_comment_content;
	}

	public String getPost_comment_date() {
		return post_comment_date;
	}

	public void setPost_comment_date(String post_comment_date) {
		this.post_comment_date = post_comment_date;
	}

	public int getPost_comment_like() {
		return post_comment_like;
	}

	public void setPost_comment_like(int post_comment_like) {
		this.post_comment_like = post_comment_like;
	}

	@Override
	public String toString() {
		return "PostComment [post_comment_no=" + post_comment_no + ", post_comment_writter=" + post_comment_writter
				+ ", post_comment_content=" + post_comment_content + ", post_comment_date=" + post_comment_date
				+ ", post_comment_like=" + post_comment_like + ", post_no=" + post_no + "]";
	}

	
	
}

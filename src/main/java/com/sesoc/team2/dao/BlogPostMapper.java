package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.BlogPost;
import com.sesoc.team2.vo.PostComment;

public interface BlogPostMapper {
	
	//게시글 저장
	public int post_write(BlogPost blogpost);

	public ArrayList<BlogPost> postlist();

	public BlogPost one_post(int post_no);

	public int post_delete(BlogPost blogpost);

	public void add_hits(int post_no);

	public ArrayList<PostComment> post_reply(int post_no);

	public int post_comment_insert(PostComment postcomment);

	

}

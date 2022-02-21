package com.sesoc.team2.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.team2.vo.BlogPost;
import com.sesoc.team2.vo.PostComment;

public interface BlogPostMapper {
	
	//게시글 저장
	public int post_write(BlogPost blogpost);

	public ArrayList<BlogPost> postlist(HashMap<String, String> map, RowBounds rb);

	public BlogPost one_post(int post_no);

	public int post_delete(BlogPost blogpost);

	public void add_hits(int post_no);

	public int post_comment_insert(PostComment postcomment);

	public ArrayList<PostComment> post_comment_list(int post_no);

	public int post_comment_delete(PostComment postcomment);

	public int post_edit(BlogPost blogpost);

	public int post_comment_like(PostComment postcomment);

	public int get_total(String searchText);


	

}

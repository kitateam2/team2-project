package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.BlogPost;

public interface BlogPostMapper {
	
	//게시글 저장
	public int post_write(BlogPost blogpost);

	public ArrayList<BlogPost> postlist();

	public BlogPost onepost();

	

}

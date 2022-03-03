package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.team2.vo.BlogMain;
import com.sesoc.team2.vo.Follow;

public interface BlogMainMapper {
	public ArrayList<BlogMain> list(String searchText, RowBounds rb);	
	
	public int getTotal(String searchText);
	
	public ArrayList<BlogMain> postlist();
	
	public ArrayList<Follow> bloglist();

}
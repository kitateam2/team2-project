package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.BlogMain;

public interface BlogMainMapper {
	public ArrayList<BlogMain> list(String searchText);
}
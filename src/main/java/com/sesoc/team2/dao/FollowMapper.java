package com.sesoc.team2.dao;

import java.util.ArrayList;

import com.sesoc.team2.vo.Follow;

public interface FollowMapper {

	int insert(Follow follow);
	int delete(Follow follow);
	ArrayList<Follow> followingList(String follow_ed_id);
	ArrayList<Follow> followedList(String follow_ing_id);	
	int checkFollow(Follow follow);
	int countFollowing(String follow_ed_id);
	int countFollowed(String follow_ing_id);
}

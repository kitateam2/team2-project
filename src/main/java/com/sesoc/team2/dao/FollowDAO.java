package com.sesoc.team2.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.Follow;

@Repository
public class FollowDAO {
	@Autowired
	SqlSession sqlSession;

	// 팔로우
	public int insert(Follow follow) {
		FollowMapper mapper = sqlSession.getMapper(FollowMapper.class);
		int result = mapper.insert(follow);
		return result;
	}

	
	// 언팔로우
	public int delete(Follow follow) {
		FollowMapper mapper = sqlSession.getMapper(FollowMapper.class);
		int result = mapper.delete(follow);
		return result;
	}

	// 팔로잉 목록
	public ArrayList<Follow> followingList(String follow_ed_id) {
		FollowMapper mapper = sqlSession.getMapper(FollowMapper.class);
		ArrayList<Follow> followingList = mapper.followingList(follow_ed_id);
		return followingList;
	}

	// 팔로워 목록
	public ArrayList<Follow> followedList(String follow_ing_id) {
		FollowMapper mapper = sqlSession.getMapper(FollowMapper.class);
		ArrayList<Follow> followedList = mapper.followedList(follow_ing_id);
		return followedList;
	}
	
	// 팔로우 유무
	public int checkFollow(Follow follow) {
		FollowMapper mapper = sqlSession.getMapper(FollowMapper.class);
		int result = mapper.checkFollow(follow);
		return result;
	}
	
	// 팔로잉 수
	public int countFollowing(String follow_ed_id) {
		FollowMapper mapper = sqlSession.getMapper(FollowMapper.class);
		int total = mapper.countFollowing(follow_ed_id);
		return total;
	}
	
	//팔로워 수
	public int countFollowed(String follow_ing_id) {
		FollowMapper mapper = sqlSession.getMapper(FollowMapper.class);
		int total = mapper.countFollowed(follow_ing_id);
		return total;
	}
	
}




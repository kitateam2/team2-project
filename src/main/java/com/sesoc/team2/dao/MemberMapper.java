package com.sesoc.team2.dao;

import com.sesoc.team2.vo.User_infoVO;

public interface MemberMapper {

	public int insertMember(User_infoVO user_info);

	public User_infoVO selectMember(String user_id);

	public int insertusercart(User_infoVO user_info);
	
	

}

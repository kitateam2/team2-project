package com.sesoc.team2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.User_infoVO;
@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertMember(User_infoVO user_info) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.insertMember(user_info);
		return result;
	}
}

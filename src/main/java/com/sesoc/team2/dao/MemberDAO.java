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

	public User_infoVO getMember(String user_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		User_infoVO member = mapper.selectMember(user_id);
		return member;
	}

	public int insertusercart(User_infoVO user_info) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.insertusercart(user_info);
		return result;
		
	}

	public int updatemember(User_infoVO member) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.updatemember(member);
		return result;
	}
		
	public int insertwishcart(User_infoVO user_info) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.insertwishcart(user_info);
		return result;
		
	}
	
	public int insertordercart(User_infoVO user_info) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		int result = mapper.insertordercart(user_info);
		return result;
	}

	public User_infoVO getMemberid(String user_id) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		User_infoVO member = null;

		try {
			member = mapper.getMemberid(user_id);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
}

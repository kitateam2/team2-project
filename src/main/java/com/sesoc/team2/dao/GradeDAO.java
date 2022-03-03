package com.sesoc.team2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.team2.vo.User_infoVO;

@Repository
public class GradeDAO {
	@Autowired
	SqlSession sqlSession;
	
	public Integer grade(User_infoVO member) {
		GradeMapper mapper = sqlSession.getMapper(GradeMapper.class);
		Integer total = mapper.grade(member);
		return total;
	}
	
	public int updateGrade(User_infoVO member) {
		GradeMapper mapper = sqlSession.getMapper(GradeMapper.class);
		int result = mapper.updateGrade(member);		
		return result;
	}
}

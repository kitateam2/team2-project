package com.sesoc.team2.dao;

import com.sesoc.team2.vo.User_infoVO;

public interface GradeMapper {
	
	public Integer grade(User_infoVO member);
	
	public int updateGrade(User_infoVO member);

}

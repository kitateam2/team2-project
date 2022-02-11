package com.sesoc.team2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDBDAO {
	@Autowired
	SqlSession sqlsession;

}

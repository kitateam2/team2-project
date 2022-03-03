package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.team2.dao.GradeDAO;
import com.sesoc.team2.dao.MemberDAO;
import com.sesoc.team2.vo.User_infoVO;

@Controller

public class GradeController {
	private static final Logger logger = LoggerFactory.getLogger(GradeController.class);
	
	@Autowired
	MemberDAO memberdao;
	
	@Autowired
	GradeDAO gradedao;

	
	@ResponseBody
	@RequestMapping(value="grade", method=RequestMethod.GET)	
	public String grade(HttpSession session) {		
		String object = (String) session.getAttribute("loginId");
		if(object == null) {
			System.out.println("id널일때");
			String idnull = "null";
			return idnull;
		}
		System.out.println("id널아닐때");
		User_infoVO user_id = memberdao.getMember(object);		
		User_infoVO member = new User_infoVO();
		member.setUser_id(user_id.getUser_id());
		Integer grade = gradedao.grade(member);		
		String color; 		
		if(grade >= 500000) {
			color = "Gold";	
			member.setUser_grade(color);
			logger.info("{}", color);
		} else if(grade < 500000 && grade >= 100000) {
			color = "Silver";	
			member.setUser_grade(color);
			logger.info("{}", color);
		} else {
			color = "Bronze";
			member.setUser_grade(color);
			logger.info("{}", color);
		}	
		gradedao.updateGrade(member);
		return color;		
	}
}

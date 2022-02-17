package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.team2.dao.MemberDAO;
import com.sesoc.team2.vo.User_infoVO;



		
/**
 * 회원 정보에 대한 컨트롤러. 
 * 회원가입, 로그인, 로그아웃
 */
@Controller
public class MemberController {
	@Autowired
	MemberDAO memberDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원가입
	@RequestMapping (value="join", method=RequestMethod.GET)
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String signup(User_infoVO user_info) {
		memberDAO.insertMember(user_info);
		memberDAO.insertusercart(user_info);
		return "redirect:/";
	}
	
	//로그인
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(User_infoVO member, HttpSession session) {
		User_infoVO resultMember = memberDAO.getMember(member.getUser_id());
		
		if (resultMember != null && member.getUser_pw().equals(resultMember.getUser_pw())) {
			session.setAttribute("loginId", member.getUser_id());
			logger.info("{}",session.getAttribute("loginId"));
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "redirect:/";
	}
	
	
	@RequestMapping (value="home", method=RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping (value="condition", method=RequestMethod.GET)
	public String condition() {
		return "condition";
	}
	
}

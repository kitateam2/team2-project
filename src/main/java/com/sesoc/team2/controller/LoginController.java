package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.team2.dao.MemberDAO;
import com.sesoc.team2.vo.User_infoVO;

@Controller
@RequestMapping("blogmain")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	MemberDAO memberdao;
	
	/**
	 * 로그인 폼으로 이동
	 */
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String login() {
		return "loginForm";
	}
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(User_infoVO member, HttpSession session) {
		User_infoVO resultMember = memberdao.getMember(member.getUser_id());
		
		if (resultMember != null && member.getUser_pw().equals(resultMember.getUser_pw())) {
			session.setAttribute("loginId", member.getUser_id());
		}
		return "redirect:/blogmain";
	}
	
	/**
	 * 로그아웃
	 */
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");		
		return "redirect:/blogmain";
	}
}

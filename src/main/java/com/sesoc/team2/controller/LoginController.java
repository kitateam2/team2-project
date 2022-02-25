package com.sesoc.team2.controller;

import javax.servlet.http.HttpServletRequest;
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
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	MemberDAO memberdao;
	
	/**
	 * 로그인 폼으로 이동
	 */
	@RequestMapping (value="blogmain/login", method=RequestMethod.GET)
	public String login() {
		return "loginForm";
	}
	
	/**
	 * 로그인 처리
	 */
	@RequestMapping(value = "blogmain/login", method = RequestMethod.POST)
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
	@RequestMapping (value="blogmain/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");		
		return "redirect:/blogmain";
	}
	
	
	/**
	 * 개인블로그에서 로그인 폼으로 이동
	 */
	@RequestMapping (value="myblog/login", method=RequestMethod.GET)
	public String myblog_login(Model model, String url) {
		logger.info("이전주소 1 :{}", url);
		model.addAttribute(url);
		return "loginForm";
	}
	
	/**
	 * 개인블로그에서 로그인 처리
	 */
	@RequestMapping(value = "myblog/login", method = RequestMethod.POST)
	public String myblog_login(Model model, User_infoVO member, HttpSession session, String url ) {
		logger.info("이전주소 2 :{}", url);
		model.addAttribute(url);
		User_infoVO resultMember = memberdao.getMember(member.getUser_id());
		if (resultMember != null && member.getUser_pw().equals(resultMember.getUser_pw())) {
			session.setAttribute("loginId", member.getUser_id());
		}

		if (url != null && !url.isEmpty()) {
			return "redirect:" + url;
		}
		return "redirect:/";
	}
	
	/**
	 * 개인블로그에서 로그아웃
	 */
	@RequestMapping (value="myblog/logout", method=RequestMethod.GET)
	public String myblog_logout(HttpSession session, String user_id) {
		session.removeAttribute("loginId");		
		return "redirect:/myblog/" + user_id;
	}
	
	
}

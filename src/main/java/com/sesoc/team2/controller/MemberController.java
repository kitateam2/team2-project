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
		memberDAO.insertwishcart(user_info);
		memberDAO.insertordercart(user_info);
		return "redirect:/";
	}
	
	//로그인
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(User_infoVO member, HttpSession session, Model model) {
		User_infoVO resultMember = memberDAO.getMember(member.getUser_id());
		
		if (resultMember != null && member.getUser_pw().equals(resultMember.getUser_pw())) {
			session.setAttribute("loginId", member.getUser_id());
			logger.info("{}",session.getAttribute("loginId"));
			return "redirect:/";
		}		
		
		else {
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			return "loginForm";
		}		
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
	
	@RequestMapping(value = "updatemember", method = RequestMethod.GET)
	public String update(HttpSession session,Model model) {
		//세션의 아이디를 읽어서 db에서 개인정보를 검색 
		String id = (String) session.getAttribute("loginId");
		User_infoVO member = memberDAO.getMember(id);
		//개인정보를 모델에 저장
		model.addAttribute("member",member);
		 //세션의 아이디를 읽어서  DB에서 개인정보를 검색
		return "updateForm";
	}
	
	@RequestMapping(value = "updatemember", method = RequestMethod.POST)
	public String update(User_infoVO member,HttpSession session) {
		logger.debug("수정폼에서 전달된 값{}",member);
		String id = (String) session.getAttribute("loginId");
		member.setUser_id(id);
		memberDAO.updatemember(member);
		
		return "redirect:/";
	}
	
}

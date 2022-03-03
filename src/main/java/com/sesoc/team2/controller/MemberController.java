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
	public String loginForm(HttpSession session, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		System.out.println("referererere: "+referer);
		session.setAttribute("referer", referer);
		return "loginForm";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(User_infoVO member, HttpSession session, Model model) {
		User_infoVO resultMember = memberDAO.getMember(member.getUser_id());
		
		if (resultMember != null && member.getUser_pw().equals(resultMember.getUser_pw())) {
			session.setAttribute("loginId", member.getUser_id());
			logger.info("{}",session.getAttribute("loginId"));
			String referer = (String) session.getAttribute("referer");
			session.removeAttribute("referer");
			String chatmain = (String) session.getAttribute("chatmain");
			if(chatmain!=null) {
				session.removeAttribute("chatmain");
				return "redirect:/chatmain";
			}
			return "redirect:" + referer;
		}		
		
		
		else {
			model.addAttribute("errorMsg", "ID 또는 비밀번호가 틀립니다.");
			return "loginForm";
		}		
	}
	
	//로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("loginId");
		String referrer = request.getHeader("referer");
		return "redirect:" + referrer;
	}
	
	
	//홈으로
	@RequestMapping (value="home", method=RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	//이용약관폼
	@RequestMapping (value="condition", method=RequestMethod.GET)
	public String condition() {
		return "condition";
	}
	
	//회원정보수정
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
	
	//회원정보수정
	@RequestMapping(value = "updatemember", method = RequestMethod.POST)
	public String update(User_infoVO member,HttpSession session) {
		logger.debug("수정폼에서 전달된 값{}",member);
		String id = (String) session.getAttribute("loginId");
		member.setUser_id(id);
		memberDAO.updatemember(member);
		
		return "redirect:/";
	}
	
	//id중복체크
	@RequestMapping (value="idcheck", method=RequestMethod.GET)
	public String idcheck(Model model) {
		return "idcheck";
	}
	
	//id중복체크
	@RequestMapping (value="idcheck", method=RequestMethod.POST)
	public String idcheck(Model model, String searchId) {
		User_infoVO member = memberDAO.getMemberid(searchId);
		model.addAttribute("member", member);		//검색 결과가 없으면 null
		model.addAttribute("searchId", searchId); 	//사용자가 검색한 ID
		return "idcheck";
	}
}

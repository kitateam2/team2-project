package com.sesoc.team2.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.team2.dao.FollowDAO;
import com.sesoc.team2.dao.MemberDAO;
import com.sesoc.team2.vo.Follow;
import com.sesoc.team2.vo.User_infoVO;

@Controller
@RequestMapping("myblog")
public class FollowController {	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@Autowired
	FollowDAO followdao;
	
	@Autowired
	MemberDAO memberdao;
	
	//팔로우
	@RequestMapping (value="{user_id}/follow", method=RequestMethod.POST)
	public String insert(@PathVariable String user_id, HttpSession session) {		
		String object = (String) session.getAttribute("loginId");		
		User_infoVO follow_ing_id = memberdao.getMember(object);		
		User_infoVO follow_ed_id = memberdao.getMember(user_id);
		
		Follow follow = new Follow();
		follow.setFollow_ing_id(follow_ing_id.getUser_id());
		follow.setFollow_ed_id(follow_ed_id.getUser_id());
		
		followdao.insert(follow);		
		return "redirect:../{user_id}";
	}

	// 언팔로우
	@RequestMapping (value="{user_id}/unfollow", method=RequestMethod.POST)
	public String delete(@PathVariable String user_id, HttpSession session) {		
		String object = (String) session.getAttribute("loginId");		
		User_infoVO follow_ing_id = memberdao.getMember(object);		
		User_infoVO follow_ed_id = memberdao.getMember(user_id);
		
		Follow follow = new Follow();
		follow.setFollow_ing_id(follow_ing_id.getUser_id());
		follow.setFollow_ed_id(follow_ed_id.getUser_id());
		
		followdao.delete(follow);		
		return "redirect:../{user_id}";
	}
}

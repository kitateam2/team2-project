package com.sesoc.team2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.team2.dao.ServiceDAO;
import com.sesoc.team2.vo.Chat;
import com.sesoc.team2.vo.Chatroom;
import com.sesoc.team2.vo.User_infoVO;

/**
 * 고객센터에 대한 컨트롤러
 * 자주묻는질문 페이지, 챗봇
 */
@Controller
public class CustomerServiceController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerServiceController.class);
	@Autowired
	ServiceDAO sdao;	
	/**
	 * FAQ 화면으로 이동
	 */
	@RequestMapping(value = "/userService", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		logger.info("FAQ{}",id);
		return "service/userService";
	}
	
	/**
	 * 채팅 화면으로 이동
	 */
	@RequestMapping(value="chatView", method=RequestMethod.GET)
	public String chatView(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		logger.info("챗뷰{}",id);
		return "service/chat";
	}
	
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public String chaTest(HttpSession session, Model model, String roomid) {
		String id = (String)session.getAttribute("loginId");
		logger.info("chatting{}",roomid);
		model.addAttribute("roomid",roomid);
		return "service/chatting";
	}
	
	//사용자 초대페이지 이동
	@RequestMapping(value = "/chatinvite", method = RequestMethod.GET)
	public String chatinvite(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		ArrayList<User_infoVO> idList = sdao.idList();
		//logger.info("리스트{}", idList);
		model.addAttribute("idlist",idList);
		return "service/chatinvite";
	}
	
	//아이디검색
	@RequestMapping(value = "/chatinvite", method = RequestMethod.POST)
	public String chatinvite1(HttpSession session, String searchId) {
		logger.info("포스트{}", searchId);
		String id = (String)session.getAttribute("loginId");
		
		return "redirect:/chatinvite";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertchat", method = RequestMethod.POST)
	public void insertchat(@RequestParam(value = "insertchat", required = false) String insertchat) {
		System.out.println("insertchat ajax: "+insertchat);
		String[] insertchats = insertchat.split("/");				
		String id = insertchats[0];
		String new_chat = insertchats[1];
		String time = insertchats[2];
		String roomid = insertchats[3];
		
		Chat chat = new Chat();
		chat.setChat_message(new_chat);
		chat.setChat_time(time);
		chat.setChatroom_id(roomid);
		chat.setUser_id(id);
		sdao.insertchat(chat);
	}
	
	//사용자 초대 ajax
	@ResponseBody
	@RequestMapping(value = "/createroom", method = RequestMethod.POST)
	public String createroom(@RequestParam(value = "checkId", required = false) String[] ids, HttpSession session, HttpServletRequest req) {
		//String[] ids = req.getParameterValues("checkId");
		int idcount = ids.length;
		System.out.println(idcount);
		String idsum = "";

		for (int i = 0; i < ids.length; i++) {
			idsum += ids[i];
			if(i != idcount-1) {
				idsum += ",";
			}
		}
		idsum = idsum.replace("[", "");
		idsum = idsum.replace("]", "");
		idsum = idsum.replaceAll("\"", "");
		String id = (String)session.getAttribute("loginId");
		System.out.println(idsum);
		return idsum;
	}
	
	//ajax후에 DB에 초대한 사용자들 저장
	@RequestMapping(value = "/createroom", method = RequestMethod.GET)
	public String chatmain(HttpSession session, Model model, String ids) {
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("ids",ids);
		sdao.insertChatroom(ids);
		return "redirect:/chatmain";
	}
	
	//채팅메인페이지
	@RequestMapping(value="/chatmain", method=RequestMethod.GET)
	public String chatmain(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		ArrayList<Chatroom> roomlist = sdao.roomlist(id);
		model.addAttribute("roomlist",roomlist);
		return "service/chatmain";
	}
}

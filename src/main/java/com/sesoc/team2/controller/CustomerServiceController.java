package com.sesoc.team2.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

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
import com.sesoc.team2.vo.BlogPost;
import com.sesoc.team2.vo.Book;
import com.sesoc.team2.vo.Chat;
import com.sesoc.team2.vo.Chatroom;
import com.sesoc.team2.vo.PostComment;
import com.sesoc.team2.vo.Searchid;
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
	
	//방 클릭시 roomid 받아와서 채팅페이지로 이동
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public String chaTest(HttpSession session, Model model, String roomid) {
		String id = (String)session.getAttribute("loginId");
		logger.info("roomid{}",roomid);
		ArrayList<Chat> chatlist = sdao.chatlist(roomid);
		logger.info("chatlist{}",chatlist);
		model.addAttribute("roomid",roomid);
		model.addAttribute("chatlist",chatlist);
		return "service/chatting";
	}
	
	//관리자 페이지 이동
		@RequestMapping(value = "/chatadmin", method = RequestMethod.GET)
		public String chatadmin(HttpSession session, Model model, String roomid1) {
			String id = (String)session.getAttribute("loginId");
			logger.info("chatadmin jsp로 이동");
			model.addAttribute("roomid1",roomid1);
			ArrayList<Chatroom> roomlist = sdao.roomlist(id);
			for (Chatroom chatroom : roomlist) {
				if(chatroom.getChatroom_id().equals(roomid1)) {
					ArrayList<Chat> chatlist = sdao.chatlist(roomid1);
					model.addAttribute("chatlist",chatlist);
					return "service/chatadmin";
				}
			}
			sdao.insertChatroom("admin,"+id);
			
			return "service/chatadmin";
		}
	
	//사용자 초대페이지 이동
	@RequestMapping(value = "/chatinvite", method = RequestMethod.GET)
	public String chatinvite(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		ArrayList<User_infoVO> idList = sdao.idList(id);
		for(Iterator<User_infoVO> it = idList.iterator() ; it.hasNext() ; ) {
			User_infoVO value = it.next();
			if(value.getUser_id().equals("admin")) {
				it.remove();
			}
		}
		model.addAttribute("idlist",idList);
		return "service/chatinvite";
	}
	//방생성 오류시 사용자 초대페이지 이동
	@RequestMapping(value = "/chatinviteerror", method = RequestMethod.GET)
	public String chatinviteerror(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		ArrayList<User_infoVO> idList = sdao.idList(id);
		for(Iterator<User_infoVO> it = idList.iterator() ; it.hasNext() ; ) {
			User_infoVO value = it.next();
			if(value.getUser_id().equals("admin")) {
				it.remove();
			}
		}
		model.addAttribute("idlist",idList);
		model.addAttribute("error", "1");
		return "service/chatinvite";
	}
	
	//아이디검색
	@RequestMapping(value = "/chatinvite", method = RequestMethod.POST)
	public String chatinvite1(HttpSession session, String searchId, Model model) {
		logger.info("포스트{}", searchId);
		String id = (String)session.getAttribute("loginId");
		
		searchid.setUser_id(id);
		searchid.setSearchtext(searchId);
		//ArrayList<User_infoVO> idsearch = sdao.idsearch(searchid);
		return "redirect:/idsearchresult";
	}
	Searchid searchid = new Searchid();
	//아이디검색한거 get으로 반환
	@RequestMapping(value = "/idsearchresult", method = RequestMethod.GET)
	public String idsearchresult(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		ArrayList<User_infoVO> idsearch = sdao.idsearch(searchid);
		for(Iterator<User_infoVO> it = idsearch.iterator() ; it.hasNext() ; ) {
			User_infoVO value = it.next();
			if(value.getUser_id().equals("admin")) {
				it.remove();
			}
		}
		model.addAttribute("idlist", idsearch);
		return "service/chatinvite";
	}
	
	//DB에 채팅한 내용 저장
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
		logger.info("채팅 인서트 직전");
		sdao.insertchat(chat);
		
		sdao.updatelastchat(chat);
	}
	
	//사용자 초대 ajax
	@ResponseBody
	@RequestMapping(value = "/createroom", method = RequestMethod.POST)
	public String createroom(@RequestParam(value = "checkId", required = false) String[] ids, HttpSession session, HttpServletRequest req) {
		String id = (String)session.getAttribute("loginId");
		String idsum = "";
		for (int i = 0; i < ids.length; i++) {
			idsum += ids[i];
			if(i != ids.length-1) {
				idsum += ",";
			}
		}
		idsum = idsum.replace("[", "");
		idsum = idsum.replace("]", "");
		idsum = idsum.replaceAll("\"", "");
		idsum = idsum + "," + id;
		String[] idsorts = idsum.split(",");
		Arrays.sort(idsorts);
		String idsumsort = "";
		for (int i = 0; i < idsorts.length; i++) {
			idsumsort += idsorts[i];
			if(i != idsorts.length-1) {
				idsumsort += ",";
			}
		}
		return idsumsort;
	}
	
	//ajax후에 DB에 초대한 사용자들 저장
	@RequestMapping(value = "/createroom", method = RequestMethod.GET)
	public String chatmain(HttpSession session, String ids, Model model) {
		String id = (String)session.getAttribute("loginId");
		ArrayList<Chatroom> roomlist = sdao.roomlist(id);
		for (Chatroom chatroom : roomlist) {
			if(chatroom.getChatroom_id().contains(ids) || ids.equals(","+id)) {
				return "redirect:/chatinviteerror";
			}
		}
		
		sdao.insertChatroom(ids);
		return "redirect:/chatmain";
	}
	
	//채팅메인페이지
	@RequestMapping(value="/chatmain", method=RequestMethod.GET)
	public String chatmain(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		System.out.println("roomlist전");
		ArrayList<Chatroom> roomlist = sdao.roomlist(id);

		for(Iterator<Chatroom> it = roomlist.iterator() ; it.hasNext() ; ) {
			Chatroom value = it.next();
			if(value.getChatroom_id().equals("admin,"+id)) {
				it.remove();
			}
		}
		
		System.out.println("roomlist후"+roomlist);
		model.addAttribute("roomlist",roomlist);
		return "service/chatmain";
	}
	
	//채팅메인페이지 이동전 로그인인터셉터 피하기위해 만든 메서드
	@RequestMapping(value = "/prechatmain", method = RequestMethod.GET)
	public String prechatmain(HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		session.setAttribute("chatmain", "chatmain");
		return "redirect:/chatmain";
	}
	
	//관리자 페이지로 이동
		@RequestMapping(value = "/admin", method = RequestMethod.GET)
		public String admin(HttpSession session, Model model) {
			String id = (String)session.getAttribute("loginId");
			ArrayList<Chatroom> adminroomlist = sdao.roomlist(id);
			ArrayList<User_infoVO> idList = sdao.idList(id);
			ArrayList<Book> bookList = sdao.bookList();
			ArrayList<BlogPost> postList = sdao.postList();
			ArrayList<PostComment> commentList = sdao.commentList();
			for(Iterator<User_infoVO> it = idList.iterator() ; it.hasNext() ; ) {
				User_infoVO value = it.next();
				if(value.getUser_id().equals("admin")) {
					it.remove();
				}
			}
			model.addAttribute("adminroomlist",adminroomlist);
			model.addAttribute("idList",idList);
			model.addAttribute("postList",postList);
			model.addAttribute("commentList",commentList);
			model.addAttribute("bookList",bookList);
			
			return "service/adminForm";
		}
		
		//관리자페이지. 유저삭제 메서드
		@RequestMapping(value = "/deleteuser", method = RequestMethod.GET)
		public String deleteuser(HttpSession session, Model model, String deleteid) {
			String id = (String)session.getAttribute("loginId");
			System.out.println("유저삭제 직전");
			sdao.deleteuser(deleteid);
			return "redirect:/admin";
		}
		
		//관리자페이지. 책삭제 메서드
		@RequestMapping(value = "/deletebook", method = RequestMethod.GET)
		public String deletebook(HttpSession session, Model model, String deletebook) {
			String id = (String)session.getAttribute("loginId");
			System.out.println("책삭제 직전");
			sdao.deletebook(deletebook);
			return "redirect:/admin";
		}
		
		//관리자페이지. 게시글삭제 메서드
		@RequestMapping(value = "/deletepost", method = RequestMethod.GET)
		public String deletepost(HttpSession session, Model model, int deletepost) {
			String id = (String)session.getAttribute("loginId");
			System.out.println("게시글삭제 직전");
			sdao.deletepost(deletepost);
			return "redirect:/admin";
		}
		
		//관리자페이지. 댓글삭제 메서드
		@RequestMapping(value = "/deletecomment", method = RequestMethod.GET)
		public String deletecomment(HttpSession session, Model model, int deletecomment) {
			String id = (String)session.getAttribute("loginId");
			System.out.println("댓글삭제 직전");
			sdao.deletecomment(deletecomment);
			return "redirect:/admin";
		}
}

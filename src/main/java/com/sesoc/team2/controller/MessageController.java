package com.sesoc.team2.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.sesoc.team2.dao.MessageDAO;
import com.sesoc.team2.util.PageNavigator;
import com.sesoc.team2.vo.Message;

/**
 * 쪽지에 대한 컨트롤러
 */
@Controller
@RequestMapping("message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	MessageDAO dao;
	
	//쪽지 관련 상수 값 정의 
	final int countPerPage = 5;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수

	
	//쪽지로 이동
			@RequestMapping(value = "{user_id}/window", method = RequestMethod.GET)
			public String messageWindow(
					@PathVariable String user_id
					, 	@RequestParam(value="message_no", defaultValue="0" )int message_no
					, 	HttpSession session
					, 	@RequestParam(value="page", defaultValue="1") int page
					, 	@RequestParam(value="searchText", defaultValue="") String searchText
					, 	 Model model) {
				String id = (String) session.getAttribute("loginId");
				//보내는 값에 내 아이디를 고정해서 보내야 하니까 고정값을 하나만 주는 거지  
				//딱 열렸을 때 불러오는 받은사람에는 로그인 한 아이디가 그 값이니까 
				//message.setMessage_recv_id(id); 이거 없어도 되고, sql에서 조건절로 주니까 자동으로 불러올 수 있다.
				
				HashMap<String, String> map_recv = new HashMap<String, String>();

				map_recv.put("login_id", id);
				map_recv.put("searchText", searchText);
				
				HashMap<String, String> map_sent = new HashMap<String, String>();
			
				map_sent.put("login_id", id);
				map_sent.put("searchText", searchText);
				
				HashMap<String, String> map_unopened = new HashMap<String, String>();

				map_unopened.put("login_id", id);
				map_unopened.put("searchText", searchText);
				
				HashMap<String, String> map_fav = new HashMap<String, String>();

				map_fav.put("login_id", id);
				map_fav.put("searchText", searchText);
				
				logger.debug("page: {}, searchText: {}", page, searchText);
				logger.debug("map_recv 컨트롤러 int{} ", map_recv);
				logger.debug("map_sent 컨트롤러 {}", map_sent);
				
				int total_recv = 0;
				int total_sent = 0;
				int total_unopened = 0;
				int total_fav = 0;
				
				total_recv = dao.get_total_recv(map_recv);			//받은 쪽지 개수
				total_sent = dao.get_total_sent(map_sent);			//보낸 쪽지 개수
				total_unopened = dao.get_total_unopened(map_unopened);
				total_fav = dao.get_total_fav(map_fav);
				
				logger.debug("total_recv int 컨트롤러", total_recv);
				logger.debug("total_sent int 컨트롤러", total_sent);
				
				//페이지 계산을 위한 객체 생성
				//                                     여기 10개        여기 5개      1개   100개 
				PageNavigator navi_recv = new PageNavigator(countPerPage, pagePerGroup, page, total_recv); 
				PageNavigator navi_sent = new PageNavigator(countPerPage, pagePerGroup, page, total_sent); 
				PageNavigator navi_unopened = new PageNavigator(countPerPage, pagePerGroup, page, total_unopened); 
				PageNavigator navi_fav = new PageNavigator(countPerPage, pagePerGroup, page, total_fav); 
	
				ArrayList<Message> message_list_recv = dao.message_list_recv(map_recv, navi_recv.getStartRecord(), navi_recv.getCountPerPage());
				ArrayList<Message> message_list_sent = dao.message_list_sent(map_sent, navi_sent.getStartRecord(), navi_sent.getCountPerPage());
				ArrayList<Message> message_list_unopened = dao.message_list_unopened(map_unopened, navi_unopened.getStartRecord(), navi_unopened.getCountPerPage());
				ArrayList<Message> message_list_fav = dao.message_list_fav(map_fav, navi_fav.getStartRecord(), navi_fav.getCountPerPage());
				
				model.addAttribute("navi_recv", navi_recv);
				model.addAttribute("navi_sent", navi_sent);
				model.addAttribute("navi_unopened", navi_unopened);
				model.addAttribute("navi_fav", navi_fav);
				
				model.addAttribute("message_list_recv", message_list_recv);
				model.addAttribute("message_list_sent", message_list_sent);
				model.addAttribute("message_list_unopened", message_list_unopened);
				model.addAttribute("message_list_fav", message_list_fav);
				
				logger.info("리스트: {}", message_list_recv);
				
				if(message_no == 0 ) {}
				
				else {
				//전달된 메시지 넘버 가지고 오기
				logger.info("메시지 하나 자세히 보기 {}", message_no);
				Message one_message = dao.one_message(message_no);
				logger.info("메시지 하나 자세히 보기 2222 {}", message_no);
 
				model.addAttribute("one_message", one_message);
				
				}

				return "myblog/messageWindow"; //의문인 것이 블로그 메인이랑 메시지는 같은 위치에 잇는데 왜 앞에 마이블로그를 붙여줘야하지
			}
			
	//쪽지 저장
			@RequestMapping(value = "{user_id}/new", method = RequestMethod.POST)
			public String message_new(@PathVariable String user_id, Message message
										, HttpSession session
										,  Model model) {
				logger.info("쪽지 저장 me result: {}", message);
				//보내는 사람의 정보 = 로그인 한 아이디
				String id = (String) session.getAttribute("loginId");	
				message.setMessage_sent_id(id);
				
				int result = dao.message_new(message);
				logger.info("쪽지 저장 result: {}", result);
				return "redirect:window";
			}
	//보내는 사람 자동완성
			@RequestMapping(value = "{user_id}/json_auto", method = RequestMethod.POST)
			public String json_auto(Locale locale, Model model) {
				ArrayList<String> array_recv_id = dao.get_recv_id();
				logger.info("array_recv_id{}", array_recv_id);
				//어레이를 가지고 와서 불러와야지
				Gson gson = new Gson();
				return gson.toJson(array_recv_id);
			}
			
			
}

package com.sesoc.team2.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sesoc.team2.dao.BlogPostDAO;
import com.sesoc.team2.dao.FollowDAO;
import com.sesoc.team2.dao.MemberDAO;
import com.sesoc.team2.util.PageNavigator;
import com.sesoc.team2.vo.BlogPost;
import com.sesoc.team2.vo.Follow;
import com.sesoc.team2.vo.User_infoVO;


/**
 * 메인 페이지에 대한 컨트롤러
 * 베스트셀러, 신작, 블로그 인플루언서등 리스트들
 */
@Controller
public class MainPageController {
	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);
	
	@Autowired
	BlogPostDAO dao;
	
	@Autowired
	FollowDAO followdao;
	
	@Autowired
	MemberDAO memberdao;
	
		//게시판 관련 상수값들
		final int countPerPage = 10;			//페이지당 글 수
		final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	
		@RequestMapping(value = "myblog/{user_id}", method = RequestMethod.GET)
		public String myblog(@PathVariable String user_id,
							@RequestParam(value="page", defaultValue="1") int page
							, @RequestParam(value="searchText", defaultValue="") String searchText
							,Model model
							,HttpSession session) {
			//해시맵
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("user_id", user_id);
			map.put("searchText", searchText);
			
			logger.debug("page: {}, searchText: {}", page, searchText);
			int total = dao.get_total(map);//전체 글 개수
			
			//페이지 계산을 위한 객체 생성
			//                                     여기 10개        여기 5개      1개   100개 
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
			
			
					
			logger.info("컨트롤러 확인 map{}", map);
			ArrayList<BlogPost> postlist =dao.postlist(map, navi.getStartRecord(), navi.getCountPerPage());
			logger.info("DB에서 가져온 목록{}", postlist);
			
			model.addAttribute("postlist", postlist);
			model.addAttribute("user_id", user_id);
			model.addAttribute("navi", navi);
			model.addAttribute("searchText", searchText);
			
			
			
			//팔로잉 목록
			ArrayList<Follow> followingList = followdao.followingList(user_id);
			logger.info("followingList{}", followingList);
			model.addAttribute("followingList", followingList);
			
			//팔로워 목록
			ArrayList<Follow> followedList = followdao.followedList(user_id);
			logger.info("followedList{}", followedList);
			model.addAttribute("followedList", followedList);
			
			// 팔로잉 수
			int countFollowing = followdao.countFollowing(user_id);
			logger.info("countFollowing{}", countFollowing);
			model.addAttribute("countFollowing", countFollowing);
			
			// 팔로워 수
			int countFollowed = followdao.countFollowed(user_id);
			logger.info("countFollowed{}", countFollowed);
			model.addAttribute("countFollowed", countFollowed);
			
			//팔로우 유무
			String object = (String) session.getAttribute("loginId");
			if (object == null) {
				return "myblog/myblogMain";
			}
			User_infoVO follow_ing_id = memberdao.getMember(object);
			User_infoVO follow_ed_id = memberdao.getMember(user_id);
			
			Follow follow = new Follow();
			follow.setFollow_ing_id(follow_ing_id.getUser_id());
			follow.setFollow_ed_id(follow_ed_id.getUser_id());
			
			int checkFollow = followdao.checkFollow(follow);
			logger.info("checkFollow{}", checkFollow);	
			model.addAttribute("checkFollow", checkFollow);
			
			
			
			return "myblog/myblogMain";			
		}
	
}

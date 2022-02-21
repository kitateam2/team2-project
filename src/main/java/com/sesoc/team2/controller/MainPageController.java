package com.sesoc.team2.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import com.sesoc.team2.util.PageNavigator;
import com.sesoc.team2.vo.BlogPost;


/**
 * 메인 페이지에 대한 컨트롤러
 * 베스트셀러, 신작, 블로그 인플루언서등 리스트들
 */
@Controller
public class MainPageController {
	private static final Logger logger = LoggerFactory.getLogger(MainPageController.class);
	
	@Autowired
	BlogPostDAO dao;
	
	//게시판 관련 상수값들
		final int countPerPage = 10;			//페이지당 글 수
		final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	
		@RequestMapping(value = "myblog/{user_id}", method = RequestMethod.GET)
		public String myblog(@PathVariable String user_id,
							@RequestParam(value="page", defaultValue="1") int page
							, @RequestParam(value="searchText", defaultValue="") String searchText
							,Model model) {
			
			logger.debug("page: {}, searchText: {}", page, searchText);
			int total = dao.get_total(searchText);//전체 글 개수
			
			//페이지 계산을 위한 객체 생성
			//                                     여기 10개        여기 5개      1개   100개 
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
			
			//해시맵
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("user_id", user_id);
			map.put("searchText", searchText);
					
			logger.info("컨트롤러 확인 map{}", map);
			ArrayList<BlogPost> postlist =dao.postlist(map, navi.getStartRecord(), navi.getCountPerPage());
			logger.info("DB에서 가져온 목록{}", postlist);
			
			model.addAttribute("postlist", postlist);
			model.addAttribute("user_id", user_id);
			model.addAttribute("navi", navi);
			model.addAttribute("searchText", searchText);
			return "myblog/myblogMain";
		}
	
}

package com.sesoc.team2;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//메인화면에 출력할 책정보를 ArrayList에 저장
		//ArrayList를 Model에 저장해서  
		//home.jsp 에서 상품정보 출력
		
		return "home";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String home() {
		
		return "book/searchPage";
	}
	
	@RequestMapping (value="list", method=RequestMethod.GET)
	public String list(
			@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, Model model) {
		
		logger.debug("page: {}, searchText: {}", page, searchText);
		//ArrayList<cart_book> list = dao.list(searchText, navi.getStartRecord(), navi.getCountPerPage());	
		//model.addAttribute("list", list);
		
		return "boardjsp/boardList";
	}
	
}

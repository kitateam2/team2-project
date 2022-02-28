package com.sesoc.team2;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.team2.dao.CartDAO;
import com.sesoc.team2.dao.MainDataDAO;
import com.sesoc.team2.vo.Book;
import com.sesoc.team2.vo.cart_book;
import com.sesoc.team2.vo.user_wishlist;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	CartDAO dao;

	@Autowired
	MainDataDAO mdao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		ArrayList<cart_book> listcart = dao.select();
		ArrayList<user_wishlist> wishlistcart = dao.selectwish();
		model.addAttribute("Cart_book1", listcart);
		model.addAttribute("wishCart_book1", wishlistcart);
		logger.info("Welcome home! The client locale is {}.", listcart);


		ArrayList<Book> insertdate = mdao.insertdate();
		model.addAttribute("insert_date", insertdate);
		
		ArrayList<Book> insertBest = mdao.insertBest();
		model.addAttribute("insert_best", insertBest);
		 
		return "home";
	}

}

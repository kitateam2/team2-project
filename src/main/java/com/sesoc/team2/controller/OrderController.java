
 package com.sesoc.team2.controller;
 
 import java.util.ArrayList;
  
 import javax.servlet.http.HttpSession;
  
 import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 org.springframework.beans.factory.annotation.Autowired; import
 org.springframework.stereotype.Controller; import
 org.springframework.ui.Model; import
  org.springframework.web.bind.annotation.RequestMapping; import
  org.springframework.web.bind.annotation.RequestMethod; import
  org.springframework.web.bind.annotation.RequestParam; import
  org.springframework.web.bind.annotation.ResponseBody; import
  org.springframework.web.multipart.MultipartFile;
  
 import com.sesoc.team2.dao.CartDAO; import com.sesoc.team2.vo.User_infoVO;
 import com.sesoc.team2.vo.cart_book; import com.sesoc.team2.vo.user_wishlist;

 
	/*주문, 장바구니, 위시리스트, 결제 등 주문상세에 대한 컨트롤러*/
	 
		  
		  @Controller public class OrderController { private static final Logger logger
		  = LoggerFactory.getLogger(OrderController.class);
		  
		  @Autowired CartDAO dao;
		  
		  @ResponseBody
		  //장바구니 담기
		  @RequestMapping(value = "ajaxcart", method = RequestMethod.POST) //책을 담는 메서드
		  public String list(HttpSession session,String book_isbn) { 
			  String user_id1 = (String) session.getAttribute("loginId"); 
			  int user_cart_no = dao.selectuser_cart_no(user_id1); 
			  cart_book cartbook = dao.selectbook(book_isbn); 
			  cart_book book = new cart_book();
		  book.setUser_cart_no(user_cart_no);
		  logger.debug("유저카트넘버 : {} ", user_cart_no);
		  book.setBook_isbn(cartbook.getBook_isbn());
		  book.setBook_price(cartbook.getBook_price());
		  book.setBook_title(cartbook.getBook_title()); //검색하는 기능 dao.있으면 카트리턴 없으면 인서트
		  dao.insert(book); return "cart/cartForm"; 
		  
		  }
		  
		  
		  //장바구니에 뿌려주기
		  @RequestMapping(value = "cart", method = RequestMethod.GET) //담은걸 뿌리는 메서드
		  public String list1( cart_book cart_book1,Model model,HttpSession session) {
		  String user_id1 = (String) session.getAttribute("loginId");
		  ArrayList<cart_book> cart = dao.selectbook1(user_id1);
		  
		  model.addAttribute("Cart_book1",cart);
		  
		  int cart_total = dao.total(cart_book1.getUser_cart_no()); //토탈 찍고 모델에 담아서 뿌리기
		  model.addAttribute("cart_total", cart_total);
		  
		  return "cart/cartForm"; }
		  
		  //위시리스트에 담기
		  @RequestMapping(value = "ajaxwishlist", method = RequestMethod.POST) //책을 담는 메서드
		  public String wishlist(HttpSession session,String book_isbn) { String
		  user_id1 = (String) session.getAttribute("loginId"); int user_wish_no =
		  dao.selectuser_wish_no(user_id1); 
		  user_wishlist wishcartbook = dao.selectwishbook(book_isbn); 
		  user_wishlist book = new user_wishlist();
		  book.setUser_wish_no(user_wish_no);
		  logger.debug("유저위시넘버 : {} ", user_wish_no);
		  book.setBook_isbn(wishcartbook.getBook_isbn());
		  dao.insertwish(book); return "cart/wishForm"; 
		  
		  }
		  
		  //삭제
		  
		  @RequestMapping (value="delete", method=RequestMethod.GET) 
		  public String delete(HttpSession session, int cart_book_no) {
		  logger.debug("cart_book_no : {} ", cart_book_no);
		  dao.deletecart(cart_book_no);
		  
		  return "redirect:/cart"; }
		  
		  //수정
		  
		  @RequestMapping (value="update", method=RequestMethod.GET)
			public String updatecart(cart_book cart_book, HttpSession session, int cart_book_no,int cart_book_count ) {//xx파라미터값 전달
				logger.debug("수정{}", cart_book_count);
				//수정할 글이 로그인한 본인 글인지 확인할 아이디 읽기
				String id = (String) session.getAttribute("loginId");
				//수정할 글 정보에 로그인 아이디 저장
				cart_book.setCart_book_count(cart_book_count);
				cart_book.setCart_book_no(cart_book_no);
				
				dao.updatecart(cart_book);
				
				//원래의 글읽기 화면으로 이동 
				return "redirect:/cart";
			}
		  
		  @RequestMapping (value="checkout", method=RequestMethod.GET) 
		  public String checkout(Model model) { 
			  
			  return "cart/checkoutForm"; 
			  
		  }
		  
		  @RequestMapping (value="complete", method=RequestMethod.GET) 
		  public String complete(Model model) { 
			  
			  return "cart/completeForm"; 
			  
		  }
		  
		  }
		  
		 
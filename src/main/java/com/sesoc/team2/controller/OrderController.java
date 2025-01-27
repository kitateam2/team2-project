
 package com.sesoc.team2.controller;
 
 import java.util.ArrayList;
  
 import javax.servlet.http.HttpSession;
  
 import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 org.springframework.beans.factory.annotation.Autowired; import
 org.springframework.stereotype.Controller; import
 org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import
  org.springframework.web.bind.annotation.RequestMapping; import
  org.springframework.web.bind.annotation.RequestMethod; import
  org.springframework.web.bind.annotation.RequestParam; import
  org.springframework.web.bind.annotation.ResponseBody; import
  org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.team2.dao.CartDAO;
import com.sesoc.team2.dao.MemberDAO;
import com.sesoc.team2.vo.Order_detail;
import com.sesoc.team2.vo.Order_list;
import com.sesoc.team2.vo.User_infoVO;
 import com.sesoc.team2.vo.cart_book; import com.sesoc.team2.vo.user_wishlist;

 
	/*주문, 장바구니, 위시리스트, 결제 등 주문상세에 대한 컨트롤러*/
	 
		  
		  @Controller public class OrderController {
			  
			  private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
		  
		  @Autowired CartDAO dao;
		  @Autowired MemberDAO memberDAO;
		  @ResponseBody
		  //장바구니 담기
		  @RequestMapping(value = "ajaxcart", method = RequestMethod.POST) //책을 담는 메서드
		  public String list(HttpSession session,String book_isbn) { 
			  String user_id1 = (String) session.getAttribute("loginId"); 
			  int user_cart_no = dao.selectuser_cart_no(user_id1); 
			  logger.info("북isbn {}" , book_isbn);
			  cart_book cartbook = dao.selectbook(book_isbn); 
			  logger.info("카트북 : {} ", cartbook);
			  cart_book book = new cart_book();
		  book.setUser_cart_no(user_cart_no);
		  logger.debug("유저카트넘버 : {} ", user_cart_no);
		  book.setBook_isbn(cartbook.getBook_isbn());
		  book.setBook_price(cartbook.getBook_price());
		  book.setBook_title(cartbook.getBook_title()); 
		  dao.insert(book); 
		  return "cart/cartForm"; 
		  
		  }
		  
		  
		  //장바구니에 뿌려주기
		  @RequestMapping(value = "cart", method = RequestMethod.GET) //담은걸 뿌리는 메서드
		  public String list1(Model model,HttpSession session) {
		  String user_id1 = (String) session.getAttribute("loginId");
		  ArrayList<cart_book> cart = dao.selectbook1(user_id1);
		  logger.info("if문 위에: {}", cart);
		  if(!cart.isEmpty()) {
			  logger.info("카트가 널일때");
			  cart_book cb = cart.get(0);
			  int user_cart_no = cb.getUser_cart_no();
			  model.addAttribute("Cart_book1",cart);
			  model.addAttribute("user_cart_no",user_cart_no);
			  int cart_total = dao.total(user_cart_no); 
			  model.addAttribute("cart_total", cart_total);
			  cart_total_sum = cart_total;
		  }
		  return "cart/cartForm"; 
		  
		  }
		  
		  //위시리스트에 담기
		  @RequestMapping(value = "ajaxwishlist", method = RequestMethod.POST) //책을 담는 메서드
		  public String wishlist(HttpSession session,String book_isbn) { 
			  String user_id1 = (String) session.getAttribute("loginId"); 
			  int user_wish_no = dao.selectuser_wish_no(user_id1); 
			  user_wishlist wishcartbook = dao.selectwishbook(book_isbn); 
			  user_wishlist book = new user_wishlist();
			  String book_title = dao.booktitle(book_isbn);
			  book.setUser_id(user_id1);
			  logger.debug("유저위시넘버 : {} ", user_id1);
			  book.setUser_wish_no(user_wish_no);
			  logger.debug("유저위시넘버 : {} ", user_wish_no);
			  book.setBook_isbn(wishcartbook.getBook_isbn());
			  book.setBook_title(book_title);
			  dao.insertwish(book); 
			  return "cart/wishForm"; 
		  
		  }
		  
		  //위시리스트에 뿌려주기
		  @RequestMapping(value = "wish", method = RequestMethod.GET) //담은걸 뿌리는 메서드
		  public String wishlistcart(user_wishlist userwishlist,Model model,HttpSession session) {
			  logger.debug("wish컨트롤러 -=-=-=-=-=-=-=-=-=-=-=-=-=");
		  String user_id1 = (String) session.getAttribute("loginId");
		  ArrayList<user_wishlist> wish = dao.selectbookwishlist(user_id1);
		  model.addAttribute("userwishlist",wish);
		  logger.debug("내용 : {} ", wish);
		  
		  return "cart/wishForm"; 
		  
		  }
		  
		  //장바구니삭제
		  
		  @RequestMapping (value="delete", method=RequestMethod.GET) 
		  public String delete(HttpSession session, int cart_book_no) {
		  logger.debug("cart_book_no : {} ", cart_book_no);
		  dao.deletecart(cart_book_no);
		  
		  
		  return "redirect:/cart"; 
		  
		  }
		  
			//위시리스트 삭제
			 @RequestMapping (value="deletewish", method=RequestMethod.GET) 
			 public String deletewish(HttpSession session, int user_wish_no) {
			 dao.deletewish(user_wish_no);
			 
			 return "redirect:/wish";
			  
			 }
			 
			 //위시리스트에서 장바구니로 보내는 메서드
			 @RequestMapping (value="gocart", method=RequestMethod.GET) 
			 public String gocart(HttpSession session, String book_isbn) {
				String user_id1 = (String) session.getAttribute("loginId");
				int user_cart_no1 = dao.select_wish_user_cart_no(user_id1);
				logger.info("아이에ㅡ{}",book_isbn);
				cart_book cartbook = dao.select_wish_book(book_isbn);
				logger.debug("user_cart_no1ddddd : {} ", cartbook);
				 cartbook.setUser_cart_no(user_cart_no1);
				dao.gocartinsert(cartbook);
				dao.deletewishcart(cartbook);
			 
			 return "redirect:/cart"; 
			  
			 }
			 
			  //주문상세페이지로
			  @RequestMapping (value="orderdetail", method=RequestMethod.GET) 
				 public String orderdetail(HttpSession session, int user_cart_no, Model model) {
				  String user_id1 = (String) session.getAttribute("loginId");
				  
				  System.out.println("오더디테일 시작");
				  int order_no = dao.order_no(user_id1);		  
				  logger.info("유저카트넘버ㅡ{}",user_cart_no);
				  ArrayList<cart_book> cartbook = dao.select_order_book(user_cart_no);
				  logger.info("카sdfnsdfjsndfjsndfjㅡ{}",cartbook);
				  ArrayList<cart_book> cartbook2 = dao.orderlist(user_id1);
				  logger.info("카트북222222222ㅡ{}",cartbook);
				  model.addAttribute("orderlistcart",cartbook);
				  model.addAttribute("cart_book1", user_cart_no);
				  for (cart_book cartbook1 : cartbook) {
					  cartbook1.setOrder_no(order_no);
					  dao.orderdetailinsert(cartbook1);
					  dao.deleteorderdetail();
					  
				  }
				  
				  return "order/orderdetail";
			  
			  }
			  
		  int cart_total_sum;
			  
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
		  
		  //결제메서드
		  @RequestMapping (value="checkout", method=RequestMethod.POST) 
		  public String checkout(HttpSession session, String order_address, Model model,String order_name,String order_phone) {
			  String user_id1 = (String) session.getAttribute("loginId");
			  //Order_list order_list = dao.order_num(user_id1);
			  model.addAttribute("order_address",order_address);
			  model.addAttribute("order_name" , order_name);
			  model.addAttribute("order_phone",order_phone);
			  User_infoVO user_info = new User_infoVO();
			  user_info.setUser_id(user_id1);
			  memberDAO.insertordercart(user_info);
				
			  return "cart/checkoutForm"; 
			  
		  }
		  
		  
		  //결제버튼을 눌렀을떄 결제가 되는 메서드
		  @RequestMapping (value="complete", method=RequestMethod.POST) 
		  public String complete(Model model,HttpSession session,String order_address,String order_name,String order_phone) {
			  logger.info("오더어드레스{}", order_address);
			  String user_id1 = (String) session.getAttribute("loginId");
			  Order_list order_list = dao.order_num(user_id1);
			  logger.info("아아아아아아앙아{}", order_list);
				/* int cart_total = dao.ordertotal(order_list) */; 
				order_list.setOrder_no(order_list.getOrder_no());
				order_list.setOrder_totalprice(cart_total_sum);
				order_list.setOrder_address(order_address);
				order_list.setOrder_name(order_name);
				order_list.setOrder_phone(order_phone);
				
				logger.info("토탈{}", order_name);
				
				dao.updateorder(order_list);
				dao.updateaddress(order_list);
				dao.updatename(order_list);
				dao.updatephone(order_list);
			
			  return "cart/completeForm"; 
			  
		  }
		  
		
		  }
		  
		 
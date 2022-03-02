<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>

</head>

<body>

<body class="right-sidebar woocommerce-cart">
<%@ include file="../header.jsp" %> 
    <!--===== HEADER CONTENT =====-->
    


    <!-- ====== MAIN CONTENT ====== -->
    <div class="page-header border-bottom">
        <div class="container">
            <div class="d-md-flex justify-content-between align-items-center py-4">
                <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">나의 장바구니</h1>
                <nav class="woocommerce-breadcrumb font-size-2">
                    <a href="#" class="h-primary">Home</a>
                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
                    <a href="#" class="h-primary">Shop</a>
                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>Shop Single
                </nav>
            </div>
        </div>
    </div>
    <div class="site-content bg-punch-light overflow-hidden" id="content">
        <div class="container">


            <div class="row pb-8">
                <div id="primary" class="content-area">
                    <main id="main" class="site-main ">
                        <div class="page type-page status-publish hentry">
                            <!-- .entry-header -->
                            <div class="entry-content">
                                <div class="woocommerce">
                                        <table class="shop_table shop_table_responsive cart woocommerce-cart-form__contents">
                                            <thead>
                                                <tr>
                                                    <th  class="product-name">Product</th>
                                                    <th class="product-price">Price</th>
                                                    <th class="product-quantity">Quantity</th>
                                                    <th class="product-subtotal">번호</th>
                                                    <th class="product-subtotal">카트북넘버</th>
                                                    <th class="product-remove">수량변경 및 삭제</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach var="cart" items="${Cart_book1}">
                                            <form action="update" method="get">
                                                <tr class="woocommerce-cart-form__cart-item cart_item">
                                                    <td  class="product-name" data-title="Product">
                                                        <div class="d-flex align-items-center">
                                                            <a href="#">
                                                                <img src="https://placehold.it/80x120" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="">
                                                            </a>
                                                            <div class="ml-3 m-w-200-lg-down">                                                            
                                                                ${cart.book_title}                                                          
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="product-price" data-title="Price">                                      
                                                         
                                                         ${cart.book_price}
                                                                
                                                    </td>

                                                    <td class="product-quantity" data-title="Quantity">
                                                        <div class="quantity d-flex align-items-center">
                                                            <!-- Quantity -->
                                                            
                                                                      
                                                                        <input type="hidden" id=cart_book_no name="cart_book_no" value="${cart.cart_book_no}">
                                                                        <input type="number" name="cart_book_count" placeholder="${cart.cart_book_count}" id="count" style="width:50px">
                                                                       
                                                                   
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- End Quantity -->
                                                        </div>
                                                    </td>

                                                    <td class="product-subtotal" data-title="Total">
                                                  
                                                        ${cart.user_cart_no}
                                                        
                                                    </td>
                                                    
                                                    <td class="product-remove">
                                             
                                                       ${cart.cart_book_no}                                                           
                                                    </td>
                                                    <td class="product-remove">
                                             
                                                        <a href="delete?cart_book_no=${cart.cart_book_no}" class="remove" aria-label="Remove this item">삭제</a>
                                                        <input type="submit" value="수량변경">                                                            
                                                    </td>
                                                    </tr>
													 </form>
                                                </c:forEach>                             
                                            </tbody>
                                        </table>
                                  
                                </div>
                            </div>
                            <!-- .entry-content -->
                        </div>
                    </main>
                </div>
                <div id="secondary" class="sidebar cart-collaterals order-1" role="complementary">
                    <div id="cartAccordion" class="border border-gray-900 bg-white mb-5">
                        <div  class="p-4d875 border">
                            <div id="cartHeadingOne" class="cart-head">
                                <a class="d-flex align-items-center justify-content-between text-dark" href="#"
                                    data-toggle="collapse"
                                    data-target="#cartCollapseOne"
                                    aria-expanded="true"
                                    aria-controls="cartCollapseOne">

                                    <h3 class="cart-title mb-0 font-weight-medium font-size-3">Cart Totals</h3>

                                    <svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                    </svg>

                                    <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                    </svg>
                                </a>
                            </div>

                            <div id="cartCollapseOne" class="mt-4 cart-content collapse show"
                                aria-labelledby="cartHeadingOne"
                                data-parent="#cartAccordion">
                                <table class="shop_table shop_table_responsive">
                                    <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Subtotal</th>
                                            <td data-title="Subtotal"></td>
                                        </tr>

                                        <tr class="order-shipping">
                                            <th>Shipping</th>
                                            <td data-title="Shipping">Free Shipping</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="p-4d875 border">
                            <div id="cartHeadingTwo" class="cart-head">
                                <a class="d-flex align-items-center justify-content-between text-dark" href="#"
                                    data-toggle="collapse"
                                    data-target="#cartCollapseTwo"
                                    aria-expanded="true"
                                    aria-controls="cartCollapseTwo">

                                    <h3 class="cart-title mb-0 font-weight-medium font-size-3">Shipping</h3>

                                    <svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                    </svg>

                                    <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                    </svg>
                                </a>
                            </div>

                            <div id="cartCollapseTwo" class="mt-4 cart-content collapse show"
                                aria-labelledby="cartHeadingTwo"
                                data-parent="#cartAccordion">
                                <!-- Checkboxes -->
                                <ul id="shipping_method">
                                    <li>
                                        <input type="radio" name="shipping_method[0]" data-index="0" id="shipping_method_0_flat_rate1" value="flat_rate:1" class="shipping_method">
                                        <label for="shipping_method_0_flat_rate1">Free shipping</label>
                                    </li>
                                </ul>
                                <!-- End Checkboxes -->
                                
                            </div>
                        </div>

                       

                        <div class="p-4d875 border">
                            <table class="shop_table shop_table_responsive">
                                <tbody>
                                    <tr class="order-total">
                                        <th>Total</th>
                                        <td data-title="Total">${cart_total}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="wc-proceed-to-checkout">

                        <a href="orderdetail?user_cart_no=${user_cart_no}" onclick="aa()" id="aa" class="checkout-button button alt wc-forward btn btn-dark btn-block rounded-0 py-4">Proceed to checkout</a>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
  
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="resources/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
    <script src="resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="resources/assets/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="resources/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="resources/assets/vendor/slick-carousel/slick/slick.min.js"></script>
    <script src="resources/assets/vendor/multilevel-sliding-mobile-menu/dist/jquery.zeynep.js"></script>
    <script src="resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>


    <!-- JS HS Components -->
    <script src="resources/assets/js/hs.core.js"></script>
    <script src="resources/assets/js/components/hs.unfold.js"></script>
    <script src="resources/assets/js/components/hs.malihu-scrollbar.js"></script>
    <script src="resources/assets/js/components/hs.header.js"></script>
    <script src="resources/assets/js/components/hs.slick-carousel.js"></script>
    <script src="resources/assets/js/components/hs.selectpicker.js"></script>
    <script src="resources/assets/js/components/hs.show-animation.js"></script>
    <script>
    	function aa() {
    		var bb = document.getElementById('aa');
    		if (aa < 1) {
				alert('장바구니가 비었습니다');
				return false;
			}
    		return true;
    	}
    	
    	
    	 
    </script>

    <!-- JS Bookworm -->
    <!-- <script src="../../assets/js/bookworm.js"></script> -->
   
    <%@ include file = "../footer.jsp" %>
</body>
 <%-- <div class="container">
        <div class="tab"></div>
        <div class="paid"><p>Receipt Paid successfully</p></div>
        <div class="receipt">
        <div class="paper">
          <div class="title">장바구니</div>
          <div class="date">Date: 20/07/2013</div>    
          <table>
            <tbody>
            <tr>
		<th>번호</th>
		<th>책제목</th>
		<th style="width:220px">날짜</th>
		<th>수량</th>
		<th>유저카트넘버</th>
		<th>가격</th> 
	</tr>
	
	
              <c:forEach var="cart" items="${Cart_book1}">
		<form action="update" method="get">
		<tr>
			<th>${cart.cart_book_no}</th>
			<th>${cart.book_title}</th>
			<th>${cart.cart_book_inputdate}</th>                                
			<th>
				<input type="hidden" id=cart_book_no name="cart_book_no" value="${cart.cart_book_no}">
				<input type="number" name="cart_book_count" placeholder="${cart.cart_book_count}" id="count" style="width:50px">
			</th>
			<th>${cart.user_cart_no}</th>
			<th>${cart.book_price}₩</th>
			<th><a href="delete?cart_book_no=${cart.cart_book_no}"  class="btn btn-primary">삭제</a></th>
			<th><input type="submit" value="수정"></th>
			
			
		</tr> 
		</form>
		</c:forEach>
		
      
          </tbody>
          </table>
          <form action="checkout" method="get">
          <table>
          <tr>
          <td colspan="2" class="center"><a href="orderdetail?user_cart_no=${user_cart_no}" class="btn btn-primary"><input type="button" value="Pay Now"></a></td>
          <td colspan="2" class="center"><a href="/team2" class="btn btn-primary"><input type="button" value="home"></a></td>
          <td>합계${cart_total}원 </td>
          </tr>
           </table>
          </form>
          
          </div>
          </div>
   
        </div>
        
        <div>
      </div>

</body>

<footer class="footer">
<div class="sign center">
            <div class="barcode"></div>
            <br/>
            <!-- 0123456789 -->
            <br/>
            <div class="thankyou">
            Thank you for your business 
            </div>
          </div>
</div>
</footer> --%>
            
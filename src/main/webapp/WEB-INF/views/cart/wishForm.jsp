<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.png">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- CSS Bookworm Template -->
<!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="resources/assets/vendor/animate.css/animate.css">
    <link rel="stylesheet" href="resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/slick-carousel/slick/slick.css"/>
    <link rel="stylesheet" href="resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">

    <link rel="stylesheet" href="resources/assets/css/theme.css">
</head>
<body>
<%@ include file="header.jsp" %> 
<body class="right-sidebar woocommerce-cart">

    <div class="page-header border-bottom">
        <div class="container">
            <div class="d-md-flex justify-content-between align-items-center py-4">
                <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">나의 위시리스트</h1>
                <nav class="woocommerce-breadcrumb font-size-2">
                    <a href="/team2" class="h-primary">Home</a>
                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
                    <a href="cart" class="h-primary">장바구니</a>
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
                                                    <th  class="product-name">위시넘버</th>
                                                    <th class="product-price">책제목</th>                 
                                                    <th class="product-subtotal">번호</th>
                                                    <th class="product-subtotal"></th>
                                                    <th class="product-subtotal"></th>
                                                    <th class="product-subtotal"></th>
                                                 
                                                </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach var="wish" items="${userwishlist}"> 
                                                <tr class="woocommerce-cart-form__cart-item cart_item">
                                                    <td  class="product-name" data-title="Product">
                                                        <div class="d-flex align-items-center">
                                                            <a href="#">
                                                                <img src="https://placehold.it/80x120" class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image" alt="">
                                                            </a>
                                                            <div class="ml-3 m-w-200-lg-down">                                                            
                                                                ${wish.user_wishlist_no}                                                        
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="product-price" data-title="Price">                                      
                                                         
                                                         ${wish.book_title}
                                                                
                                                    </td>

                                                    <td class="product-quantity" data-title="Quantity">
                                                        <div class="quantity d-flex align-items-center">
                                                            <!-- Quantity -->
                                                            
                                                                <div class="js-quantity">
                                                                    <div class="d-flex align-items-center">
                                                                        <label class="screen-reader-text sr-only">Quantity</label>
                                                                       
                                                                        ${wish.user_wish_no}
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- End Quantity -->
                                                        </div>
                                                    </td>

                                                    <td class="product-subtotal" data-title="Total">
                                                  
                                                  
                                                        
                                                    </td>
                                                    
                                                    <td class="product-remove">
                                             
                                                       <a href="gocart?book_isbn=${wish.book_isbn}">장바구니이동</a>
                                                       <a href="deletewish?user_wish_no=${wish.book_isbn}">삭제</a>                                                          
                                                    </td>
                                                    <td class="product-remove">
                                             	
                                                  
                                                    </td>
                                                    </tr>
													 </form>
                                                </c:forEach>
                                              
                                                <tr>
                                                    <td colspan="5" class="actions">
                                                        <!-- <div class="coupon">
                                                            <label for="coupon_code">Coupon:</label>
                                                            <input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code" autocomplete="off"> <input type="submit" class="button" name="apply_coupon" value="Apply coupon">
                                                        </div> -->

                                                       

                                                        <input type="hidden" id="_wpnonce" name="_wpnonce" value="db025d7a70"><input type="hidden" name="_wp_http_referer" value="/storefront/cart/">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                            <!-- .entry-content -->
                        </div>
                    </main>
                </div>
                <div id="secondary" class="sidebar cart-collaterals order-1" role="complementary">
  

                           
                        </div>

                            </div>
                        </div>

                        <div class="p-4d875 border">
                            <div id="cartHeadingThree" class="cart-head">
                                <a class="d-flex align-items-center justify-content-between text-dark" href="#"
                                    data-toggle="collapse"
                                    data-target="#cartCollapseThree"
                                    aria-expanded="true"
                                    aria-controls="cartCollapseThree">

                                   

                              
                                </a>
                            </div>

                            <div id="cartCollapseThree" class="mt-4 cart-content collapse show"
                                aria-labelledby="cartHeadingThree"
                                data-parent="#cartAccordion">
                               
                            </div>
                        </div>

                       
                    </div>
                   
  
    <!-- ====== END MAIN CONTENT ====== -->

   
    <!-- ========== END FOOTER ========== -->

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

    <!-- JS Bookworm -->
    <!-- <script src="../../assets/js/bookworm.js"></script> -->
    <script>
    $(document).on('ready', function () {
        // initialization of unfold component
        $.HSCore.components.HSUnfold.init($('[data-unfold-target]'));

        // initialization of slick carousel
        $.HSCore.components.HSSlickCarousel.init('.js-slick-carousel');

        // initialization of header
        $.HSCore.components.HSHeader.init($('#header'));

        // initialization of malihu scrollbar
        $.HSCore.components.HSMalihuScrollBar.init($('.js-scrollbar'));

        // initialization of show animations
        $.HSCore.components.HSShowAnimation.init('.js-animation-link');

        // init zeynepjs
        var zeynep = $('.zeynep').zeynep({
            onClosed: function () {
                // enable main wrapper element clicks on any its children element
                $("body main").attr("style", "");

                console.log('the side menu is closed.');
            },
            onOpened: function () {
                // disable main wrapper element clicks on any its children element
                $("body main").attr("style", "pointer-events: none;");

                console.log('the side menu is opened.');
            }
        });

        // handle zeynep overlay click
        $(".zeynep-overlay").click(function () {
            zeynep.close();
        });

        // open side menu if the button is clicked
        $(".cat-menu").click(function () {
            if ($("html").hasClass("zeynep-opened")) {
                zeynep.close();
            } else {
                zeynep.open();
            }
        });
    });
    </script>
 <%--  <div class="container">
        <div class="tab"></div>
        <div class="paid"><p>Receipt Paid successfully</p></div>
        <div class="receipt">
        <div class="paper">
          <div class="title">위시리스트</div>
          <table>
            <tbody>
            <tr>
            <th>넘버</th>
		<th>책제목</th>
		<th>번호</th>
		<th>북isbn</th>
	</tr>
	
<c:forEach var="wish" items="${userwishlist}"> 


		<tr>
			<th>${wish.user_wishlist_no}</th>
			<th>${wish.book_title}</th>
			<th>${wish.user_wish_no}</th>
			<th>${wish.book_isbn}</th>
			
			
			<th><a href="deletewish?user_wish_no=${wish.book_isbn}"  class="btn btn-primary">삭제</a></th>
			<th><a href="gocart?book_isbn=${wish.book_isbn}" type="button"  class="btn btn-primary">장바구니이동</a></th>
			
						
						</tr> 
			</c:forEach>
			  </tbody>
          </table>
          <form action="checkout" method="get">
          <table>
          <tr>
          <td colspan="2" class="center"><a href="/team2" class="btn btn-primary"><input type="button" value="home"></a></td>
          </tr>
           </table>
          </form>
         
          
          </div>
          </div>
   
        </div>
        
        <div>
      </div> --%>
      <%@ include file = "footer.jsp" %>
</body>
</html>
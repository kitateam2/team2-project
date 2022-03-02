<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Title -->
    <title>Shop Checkout | Bookworm</title>

    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link rel="shortcut icon" href="../../assets/img/favicon.png">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="resources/assets/vendor/animate.css/animate.css">
    <link rel="stylesheet" href="resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/slick-carousel/slick/slick.css"/>
    <link rel="stylesheet" href="resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">

    <!-- CSS Bookworm Template -->
    <link rel="stylesheet" href="resources/assets/css/theme.css">
</head>
<body class="right-sidebar woocommerce-checkout">
  <%@ include file="../header.jsp" %> 

    <!-- ====== MAIN CONTENT ====== -->
    <div class="page-header border-bottom">
        <div class="container">
            <div class="d-md-flex justify-content-between align-items-center py-4">
                <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">Shop Single</h1>
                <nav class="woocommerce-breadcrumb font-size-2">
                    <a href="#" class="h-primary">Home</a>
                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
                    <a href="#" class="h-primary">Shop</a>
                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>Shop Single
                </nav>
            </div>
        </div>
    </div>
    <div id="content" class="site-content bg-punch-light space-bottom-3">
        <div class="col-full container">
            <div id="primary" class="content-area">
                <main id="main" class="site-main">
                    <article id="post-6" class="post-6 page type-page status-publish hentry">
                        <header class="entry-header space-top-2 space-bottom-1 mb-2">
                            <h4 class="entry-title font-size-7 text-center">Checkout</h4>
                        </header>
                        <!-- .entry-header -->
                        <div class="entry-content">
                            <div class="woocommerce">
                              

                                <form id="collapseExample9" class="collapse checkout_coupon mt-4 p-4 bg-white border" method="post">
                                    <div class="row d-flex">
                                        <p class="col-md-4 d-inline form-row form-row-first mb-3 mb-md-0">
                                            <input type="text" name="coupon_code1" class="input-text form-control" placeholder="Coupon code" id="coupon_code1" value="">
                                        </p>

                                        <p class="col-md-3 d-inline form-row form-row-last">
                                            <input type="submit" class="button form-control border-0 height-4 btn btn-dark rounded-0" name="apply_coupon" value="Apply coupon">
                                        </p>
                                    </div>

                                    <div class="clear"></div>
                                </form>

                                <form action="checkout" method="post" class="checkout woocommerce-checkout row mt-8" action="https://themes.woocommerce.com/storefront/checkout/" enctype="multipart/form-data" novalidate="novalidate">
                                    <div class="col2-set col-md-6 col-lg-7 col-xl-8 mb-6 mb-md-0" id="customer_details">
                                        <div class="px-4 pt-5 bg-white border">
                                            <div class="woocommerce-billing-fields">

                                                <h3 class="mb-4 font-size-3">배송지 정보</h3>

                                                <div class="woocommerce-billing-fields__field-wrapper row">
                                                    <p class="col-lg-6 mb-4d75 form-row form-row-first validate-required woocommerce-invalid woocommerce-invalid-required-field" id="billing_first_name_field" data-priority="10">
                                                        <label for="billing_first_name" class="form-label">이름입력 <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" class="input-text form-control" name="order_name" id="billing_first_name" placeholder="" value="" autocomplete="given-name" autofocus="autofocus">
                                                    </p>

                                                    

                                                  

                                                    <p class="col-12 mb-3 form-row form-row-wide address-field validate-required" id="billing_address_1_field" data-priority="50">
                                                        <label for="billing_address_1" class="form-label">주소입력 <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" class="input-text form-control" name="order_address" id="billing_address_1" placeholder="House number and street name" value="" autocomplete="address-line1">
                                                    </p>

                                                    
                                                    <p class="col-12 mb-4d75 form-row form-row-first validate-required validate-phone" id="billing_phone_field" data-priority="100">
                                                        <label for="billing_phone" class="form-label">Phone <abbr class="required" title="required">*</abbr></label>
                                                        <input type="tel" class="input-text form-control" name="order_phone" id="billing_phone" placeholder="" value="" autocomplete="tel">
                                                    </p>

                                               
                                                </div>
                                            </div>
                                        </div>

                                        <div class="px-4 pt-5 bg-white border border-top-0 mt-n-one">
                                            <div class="woocommerce-additional-fields">
                                                <h3 class="mb-4 font-size-3">Additional information</h3>
                                                <div class="woocommerce-additional-fields__field-wrapper">
                                                    <p class="col-12 mb-4d75 px-0 form-row notes" id="order_comments_field" data-priority="">
                                                        <label for="order_comments" class="form-label">Order notes (optional)</label>
                                                        <textarea name="order_comments" class="input-text form-control" id="order_comments" placeholder="Notes about your order, e.g. special notes for delivery." rows="8" cols="5"></textarea>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <h3 id="order_review_heading" class="d-none">Your order</h3>

                                    <div id="order_review" class="col-md-6 col-lg-5 col-xl-4 woocommerce-checkout-review-order">
                                        <div id="checkoutAccordion" class="border border-gray-900 bg-white mb-5">
                                            <div  class="p-4d875 border">
                                                <div id="checkoutHeadingOnee" class="checkout-head">
                                                  
                                                </div>

                                                <div id="checkoutCollapseOnee" class="mt-4 checkout-content collapse show"
                                                    aria-labelledby="checkoutHeadingOnee"
                                                    data-parent="#checkoutAccordion">
                                                     
                                                    <table class="shop_table woocommerce-checkout-review-order-table">
                                                     <h4>Your order</h4>
                                                   <c:forEach var="order" items="${orderlistcart}">
                                                       
                                                        <tbody>
                                                       
                                                            <tr class="cart_item">
                                                                <td class="product-name">
                                                                    ${order.book_title}
                                                                </td>
                                                                
                                                            </tr>
														</c:forEach>
                                                        </tbody>
                                                        <tfoot class="d-none">
                                                           

                                                            
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>

                                        

                                            

                                            <div class="p-4d875 border">
                                                <div id="checkoutHeadingThree" class="checkout-head">
                                                  
                                                      
                                                </div>

                                                <div id="checkoutCollapseThree" class="mt-4 checkout-content collapse show"
                                                    aria-labelledby="checkoutHeadingThree"
                                                    data-parent="#checkoutAccordion">
                                                   
                                                </div>
                                            </div>

                                          

                                            <div class="p-4d875 border">
                                                <div id="checkoutHeadingThreee" class="checkout-head">
                                                    <a href="#" class="text-dark d-flex align-items-center justify-content-between"
                                                        data-toggle="collapse"
                                                        data-target="#checkoutCollapseThreee"
                                                        aria-expanded="true"
                                                        aria-controls="checkoutCollapseThreee">

                                                        <h3 class="checkout-title mb-0 font-weight-medium font-size-3">Payment</h3>

                                                        <svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                                        </svg>

                                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                                        </svg>
                                                    </a>
                                                </div>

                                                <div id="checkoutCollapseThreee" class="mt-4 checkout-content collapse show"
                                                    aria-labelledby="checkoutHeadingThreee"
                                                    data-parent="#checkoutAccordion">
                                                    <div id="payment" class="woocommerce-checkout-payment">
                                                        <ul class="wc_payment_methods payment_methods methods">
                                           

                                                            <li class="wc_payment_method payment_method_cheque">
                                                                <input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="cheque" data-order_button_text="">

                                                                <label for="payment_method_cheque">신용카드 결제 </label>
                                                                <div class="payment_box payment_method_cheque" style="display: block;">
                                                                    <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                                                                </div>
                                                            </li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row place-order">
                                            <input type="submit" class="button alt btn btn-dark btn-block rounded-0 py-4" name="woocommerce_checkout_place_order" id="place_order" value="Place order" data-value="Place order">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- .entry-content -->
                    </article>
                    <!-- #post-## -->
                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
        </div>
        <!-- .col-full -->
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
 <%-- <table>
            <tbody>
            <tr>
		<th>책제목</th>
		<th>책isbn</th>
		<th>가격</th>
		<th>오더넘버</th>
	</tr>
<h1>오더</h1>
 <c:forEach var="order" items="${orderlistcart}">
 <tr>
 <th>${order.book_title}</th>
 <th>${order.book_isbn}</th>
 <th>${order.book_price}</th>
 <th>${order.order_no}</th>
 
 </c:forEach>
 </tbody>
          </table>
          <form action="checkout" method="post">
           이름입력<input type="text" name="order_name"><br>
            주소입력 <input type="text" name="order_address"><br>
 <input type="submit" value="Pay Now">
 </form> --%>
 <%@ include file = "../footer.jsp" %>
</body>
</html>
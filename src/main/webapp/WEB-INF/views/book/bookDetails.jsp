<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세 페이지</title>

<!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/img/favicon.png">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="resources/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="resources/css/slick.css"/>
    <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.css">

    <!-- CSS Bookworm Template -->
    <link rel="stylesheet" href="resources/css/theme.css">
    
  <script>
    
  //bt1 버튼 클릭했을때 실행될 함수
    function bt1Click(n){
	 	alert(n);
    	alert('장바구니 이동');
    	$.ajax({
    		url:'ajaxcart',
    		type:'post',
    		data: {book_isbn: n},
    		dataType:'text',
    		success: function() { alert('장바구니에 담았습니다.'); },
    		error: function() { alert('로그인을 해주세요'); }
    	});
    }

    function bt2Click(n){
    	alert(n);
    	alert('위시리스트이동');
    	$.ajax({
    		url:'ajaxwishlist',
    		type:'post',
    		data: {book_isbn: n},
    		dataType:'text',
    		success: function() { alert('위시리스트에 담았습니다.'); },
    		error: function() { alert('로그인을 해주세요'); }
    	});
    }

    //검색 페이지 이동
    function bookPage() {
    	var bookname = document.getElementById("bookName").value;
    	location.href = 'bookInfo?bookname='+bookname;
    }

    //댓글 쓰기 폼 체크
    function book_review_form() {
    	var text = document.getElementById('book_review_short');

    	if (text.value.length < 3) {
    		alert('댓글 내용을 3글자 이상 입력하세요.');
    		text.focus();
    		text.select();
    		return false;
    	}
    	return true;			
    }

    //댓글 삭제하기
    function book_review_delete(book_review_no, book_review_star){
    	if (confirm('댓글을 삭제하시겠습니까?')){
    		location.href='book_review_delete?book_review_no=' + book_review_no;
    	}
    }
    </script>
    
</head>
<body class="">
  <%@ include file="../header.jsp" %>


    

    <!-- Account Sidebar Navigation - Desktop -->
    <aside id="sidebarContent" class="u-sidebar u-sidebar__lg" aria-labelledby="sidebarNavToggler">
        <div class="u-sidebar__scroller">
            <div class="u-sidebar__container">
                <div class="u-header-sidebar__footer-offset">
                    <!-- Toggle Button -->
                    <div class="d-flex align-items-center position-absolute top-0 right-0 z-index-2 mt-5 mr-md-6 mr-4">
                        <button type="button" class="close ml-auto"
                            aria-controls="sidebarContent"
                            aria-haspopup="true"
                            aria-expanded="false"
                            data-unfold-event="click"
                            data-unfold-hide-on-scroll="false"
                            data-unfold-target="#sidebarContent"
                            data-unfold-type="css-animation"
                            data-unfold-animation-in="fadeInRight"
                            data-unfold-animation-out="fadeOutRight"
                            data-unfold-duration="500">
                            <span aria-hidden="true">Close <i class="fas fa-times ml-2"></i></span>
                        </button>
                    </div>
                    <!-- End Toggle Button -->

                    
                </div>
            </div>
        </div>
    </aside>
    <!-- End Account Sidebar Navigation - Desktop -->

    <!-- Cart Sidebar Navigation -->
    <aside id="sidebarContent1" class="u-sidebar u-sidebar__xl" aria-labelledby="sidebarNavToggler1">
        <div class="u-sidebar__scroller js-scrollbar">
            <div class="u-sidebar__container">
                <div class="u-header-sidebar__footer-offset">
                    <!-- Toggle Button -->
                    <div class="d-flex align-items-center position-absolute top-0 right-0 z-index-2 mt-5 mr-md-6 mr-4">
                        <button type="button" class="close ml-auto"
                            aria-controls="sidebarContent1"
                            aria-haspopup="true"
                            aria-expanded="false"
                            data-unfold-event="click"
                            data-unfold-hide-on-scroll="false"
                            data-unfold-target="#sidebarContent1"
                            data-unfold-type="css-animation"
                            data-unfold-animation-in="fadeInRight"
                            data-unfold-animation-out="fadeOutRight"
                            data-unfold-duration="500">
                            <span aria-hidden="true">Close <i class="fas fa-times ml-2"></i></span>
                        </button>
                    </div>
                    <!-- End Toggle Button -->

                    <!-- Content -->
                    <div class="u-sidebar__body">
                        <div class="u-sidebar__content u-header-sidebar__content">
                            <!-- Title -->
                            <header class="border-bottom px-4 px-md-6 py-4">
                                <h2 class="font-size-3 mb-0 d-flex align-items-center"><i class="flaticon-icon-126515 mr-3 font-size-5"></i>Your shopping bag (3)</h2>
                            </header>
                            <!-- End Title -->








                        </div>
                    </div>
                    <!-- End Content -->
                </div>
            </div>
        </div>
    </aside>
    <!-- End Cart Sidebar Navigation -->

    <!-- Categories Sidebar Navigation -->
    <aside id="sidebarContent2" class="u-sidebar u-sidebar__md u-sidebar--left" aria-labelledby="sidebarNavToggler2">
        <div class="u-sidebar__scroller js-scrollbar">
            <div class="u-sidebar__container">
                <div class="u-header-sidebar__footer-offset">
                    <!-- Content -->
                    <div class="u-sidebar__body">
                        <div class="u-sidebar__content u-header-sidebar__content">
                            <!-- Title -->
                            <header class="border-bottom px-4 px-md-5 py-4 d-flex align-items-center justify-content-between">
                                <h2 class="font-size-3 mb-0">SHOP BY CATEGORY</h2>

                                <!-- Toggle Button -->
                                <div class="d-flex align-items-center">
                                    <button type="button" class="close ml-auto"
                                        aria-controls="sidebarContent2"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        data-unfold-event="click"
                                        data-unfold-hide-on-scroll="false"
                                        data-unfold-target="#sidebarContent2"
                                        data-unfold-type="css-animation"
                                        data-unfold-animation-in="fadeInLeft"
                                        data-unfold-animation-out="fadeOutLeft"
                                        data-unfold-duration="500">
                                        <span aria-hidden="true"><i class="fas fa-times ml-2"></i></span>
                                    </button>
                                </div>
                                <!-- End Toggle Button -->
                            </header>
                            <!-- End Title -->

                            <div class="border-bottom">
                                <div class="zeynep pt-4">
                                    <ul>
                                        <li class="has-submenu">
                                            <a href="#" data-submenu="off-pages">Pages</a>
                               			</li>

                                                    <li class="has-submenu">
                                                        <a href="#" data-submenu="off-blog">Blog</a>

                                                        <div id="off-blog" class="submenu js-scrollbar">
                                                            <div class="submenu-header" data-submenu-close="off-blog">
                                                                <a href="#">Blog</a>
                                                            </div>

                                                            
                                                        </div>
                                                    </li>

                                                    <li class="has-submenu">
                                                        <a href="#" data-submenu="off-others">Others</a>

                                                        <div id="off-others" class="submenu js-scrollbar">
                                                            <div class="submenu-header" data-submenu-close="off-others">
                                                                <a href="#">Others</a>
                                                            </div>

                                                            
                                                        </div>
                                                    </li>

                                                    <li class="px-5">
                                                        <a href="../../documentation/index.html" class="btn btn-primary mb-3 mb-md-0 mb-xl-3 mt-4 font-size-2 btn-block">Documentation</a>
                                                    </li>

                                                    <li class="px-5 mb-4">
                                                        <a href="../../starter/index.html" class="btn btn-secondary font-size-2 btn-block mb-2">Starter</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>

                                        <li class="has-submenu">
                                            <a href="#" data-submenu="art-photo">Arts & Photography</a>

                                            <div id="art-photo" class="submenu">
                                                <div class="submenu-header" data-submenu-close="art-photo">
                                                    <a href="#">Arts & Photography</a>
                                                </div>

                                                <ul>
                                                    <li>
                                                        <a href="#">Architecture</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Business of Art</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Collections, Catalogs & Exhibitions</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Decorative Arts & Design</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Drawing</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Fashion</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Graphic Design</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>



      


                                        <li class="has-submenu">
                                            <a href="#" data-submenu="cookbook">Cookbooks, Food & Wine</a>

                                            <div id="cookbook" class="submenu">
                                                <div class="submenu-header" data-submenu-close="cookbook">
                                                    <a href="#">Cookbooks, Food & Wine</a>
                                                </div>

                                                <ul>
                                                    <li>
                                                        <a href="#">Istanbul</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Mardin</a>
                                                    </li>

                                                    <li>
                                                        <a href="#">Amed</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>




                                    </ul>
                                </div>
                            </div>

                            <div class="px-4 px-md-5 pt-5 pb-4 border-bottom">
                                <h2 class="font-size-3 mb-3">HELP & SETTINGS </h2>
                                <ul class="list-group list-group-flush list-group-borderless">
                                    <li class="list-group-item px-0 py-2 border-0"><a href="#" class="h-primary">Your Account</a></li>
                                    <li class="list-group-item px-0 py-2 border-0"><a href="#" class="h-primary">Help</a></li>
                                    <li class="list-group-item px-0 py-2 border-0"><a href="#" class="h-primary">Sign In</a></li>
                                </ul>
                            </div>

                            <div class="px-4 px-md-5 py-5">
                                <select class="custom-select mb-4 rounded-0 pl-4 height-4 shadow-none text-dark">
                                    <option selected>English (United States)</option>
                                    <option value="1">English (UK)</option>
                                    <option value="2">Arabic (Saudi Arabia)</option>
                                    <option value="3">Deutsch</option>
                                </select>
                                <select class="custom-select mb-4 rounded-0 pl-4 height-4 shadow-none text-dark">
                                    <option selected>$ USD</option>
                                    <option value="1">د.إ AED</option>
                                    <option value="2">¥ CNY</option>
                                    <option value="3">€ EUR</option>
                                </select>
                                <!-- Social Networks -->
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item">
                                        <a class="h-primary pr-2 font-size-2" href="#">
                                            <span class="fab fa-facebook-f btn-icon__inner"></span>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="h-primary pr-2 font-size-2" href="#">
                                            <span class="fab fa-google btn-icon__inner"></span>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="h-primary pr-2 font-size-2" href="#">
                                            <span class="fab fa-twitter btn-icon__inner"></span>
                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a class="h-primary pr-2 font-size-2" href="#">
                                            <span class="fab fa-github btn-icon__inner"></span>
                                        </a>
                                    </li>
                                </ul>
                                <!-- End Social Networks -->
                            </div>
                        </div>
                    </div>
                    <!-- End Content -->
                </div>
            </div>
        </div>
    </aside>
    <!-- End Categories Sidebar Navigation -->

    <!--===== END HEADER CONTENT =====-->

    <!-- ====== MAIN CONTENT ====== -->
    <div class="page-header border-bottom">
        <div class="container">
            <div class="d-md-flex justify-content-between align-items-center py-4">
                <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">Book Information</h1>
                <nav class="woocommerce-breadcrumb font-size-2">
                    <a href="../home/index.html" class="h-primary">Home</a>
                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
                    <a href="../shop/v1.html" class="h-primary">Book List</a>
                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>Book Information
                </nav>
            </div>
        </div>
    </div>
    <div id="primary" class="content-area">
        <main id="main" class="site-main ">
            <div class="product">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 woocommerce-product-gallery woocommerce-product-gallery--with-images images">
                            <figure class="woocommerce-product-gallery__wrapper pt-8 mb-0">
                                <div class="js-slick-carousel u-slick"
                                data-pagi-classes="text-center u-slick__pagination my-4">
                                    <div class="js-slide">
                                        <img src="download?filename=${book.book_image}" alt="Image Description" class="mx-auto img-fluid" style="object-fit:cover; width:390px; height:620px; vertical-align:top;">
                                    </div>
                                </div>
                            </figure>
                        </div>
                        <div class="col-md-7 pl-0 summary entry-summary border-left">
                            <div class="space-top-2 px-4 px-xl-7 border-bottom pb-5">
                                <h1 class="product_title entry-title font-size-7 mb-3">${book.book_title}</h1>
                                <div class="font-size-2 mb-4">
                                    <span class="text-yellow-darker">
                                        <span class="fas fa-star"></span>
                                        <span class="fas fa-star"></span>
                                        <span class="fas fa-star"></span>
                                        <span class="fas fa-star"></span>
                                        <span class="fas fa-star"></span>
                                    </span>
                                    <span class="ml-3">(3,714)</span>
                                    <span class="ml-3 font-weight-medium">By (author)</span>
                                    <span class="ml-2 text-gray-600">${book.book_author}</span>
                                </div>
                                <p class="price font-size-22 font-weight-medium mb-3">
                                    <span class="woocommerce-Price-amount amount">
                                        <span class="woocommerce-Price-currencySymbol"><fmt:formatNumber value="${book.book_price}" pattern="###,###" /></span>원
                                    </span>
                                </p>
                                <div class="mb-2 font-size-2">
                                    
                                </div>
                                <!-- Radio Checkbox Group -->
                                <div class="row mx-gutters-2 mb-4">
                                    <div class="col-6 col-md-3 mb-3 mb-md-0">
                                        <div class="">
                                            <input type="radio" id="typeOfListingRadio1" name="typeOfListingRadio1" class="custom-control-input checkbox-outline__input">
                                            <label class="border-bottom d-block checkbox-outline__label py-3 px-1 mb-0" for="typeOfListingRadio1">
                                                <span class="d-block">정가</span>
                                                <span class=""><fmt:formatNumber value="${book.book_price}" pattern="###,###" />원</span>
                                            </label>
                                        </div>
                                    </div>
      
              
                                </div>
                                <!-- End Radio Checkbox Group -->

                                <div class="woocommerce-product-details__short-description font-size-2 mb-5">
                                    <p class="">${book.book_contents}</p>
                                </div>

                                <form class="cart d-md-flex align-items-center" method="post" enctype="multipart/form-data">
                                    <div class="quantity mb-4 mb-md-0 d-flex align-items-center">
                                        <!-- Quantity -->
                                        <div class="border px-3 width-120">
                                            <div class="js-quantity">
                                                <div class="d-flex align-items-center">
                                                    <label class="screen-reader-text sr-only">Quantity</label>
                                                    <a class="js-minus text-dark" href="javascript:;">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="10px" height="1px">
                                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M-0.000,-0.000 L10.000,-0.000 L10.000,1.000 L-0.000,1.000 L-0.000,-0.000 Z" />
                                                        </svg>
                                                    </a>
                                                    <input type="number" class="input-text qty text js-result form-control text-center border-0" step="1" min="1" max="100" name="quantity" value="1" title="Qty">
                                                    <a class="js-plus text-dark" href="javascript:;">
                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="10px" height="10px">
                                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M10.000,5.000 L6.000,5.000 L6.000,10.000 L5.000,10.000 L5.000,5.000 L-0.000,5.000 L-0.000,4.000 L5.000,4.000 L5.000,-0.000 L6.000,-0.000 L6.000,4.000 L10.000,4.000 L10.000,5.000 Z" />
                                                        </svg>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End Quantity -->
                                    </div>
								<div class="product__hover d-flex align-items-center" value="${book.book_isbn}">
                                    <button name="add-to-cart" value="7145" class="btn btn-dark border-0 rounded-0 p-3 min-width-250 ml-md-4 single_add_to_cart_button button alt" onclick="bt1Click('${book.book_isbn}');">Add to cart</button>&nbsp;&nbsp;&nbsp;
									 <input type="hidden" id="book_isbn_param${status.count}" value="${book.book_isbn}">
									 <a href="#" onclick="bt2Click('${book.book_isbn}');" class="fa fa-heart fa"> Add to Wishlist</a>
                                </div>
                                </form>
                               
                            </div>
                            <div class="px-4 px-xl-7 py-5 d-flex align-items-center">
                                <ul class="list-unstyled nav">
                                    <li class="mr-6 mb-4 mb-md-0">
                                       
                                    </li>
                            
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Nav Classic -->
                <div class="js-scroll-nav mb-10">
                    <div class="woocommerce-tabs wc-tabs-wrapper  2 mx-lg-auto">
                        <div id="Description" class="">
                            <div class="border-top border-bottom">
                                <ul class="container tabs wc-tabs nav justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                        <a class="nav-link py-4 font-weight-medium active" href="#Description">
                                            Description
                                        </a>
                                    </li>
                     
                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                        <a class="nav-link py-4 font-weight-medium" href="#ProductReviews">
                                            Reviews
                                        </a>
                                    </li>
                                </ul>
                            </div>

                            <!-- Tab Content -->
                            <div class="tab-content font-size-2 container">
                                <div class="row">
                                    <div class="col-xl-8 offset-xl-2">
                                        <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab pt-9">
                                            <!-- Mockup Block -->
                                            <p class="mb-0">We aim to show you accurate product information. Manufacturers, suppliers and others provide what you see here, and we have not verified it. See our disclaimer</p>
                                            <p class="mb-0">#1 New York Times Bestseller</p>
                                            <p class="mb-0">A Reese Witherspoon x Hello Sunshine Book Club Pick</p>
                                            <p class="mb-4">"I can't even express how much I love this book! I didn't want this story to end!"--Reese Witherspoon</p>
                                            <p class="mb-4">"Painfully beautiful."--The New York Times Book Review</p>
                                            <p>"Perfect for fans of Barbara Kingsolver."--Bustle</p>
                                            <p class="mb-4">For years, rumors of the "Marsh Girl" have haunted Barkley Cove, a quiet town on the North Carolina coast. So in late 1969, when handsome Chase Andrews is found dead, the locals immediately suspect Kya Clark, the so-called Marsh Girl. But Kya is not what they say. Sensitive and intelligent, she has survived for years alone in the marsh that she calls home, finding friends in the gulls and lessons in the sand. Then the time comes when she yearns to be touched and loved. When two young men from town become intrigued by her wild beauty, Kya opens herself to a new life--until the unthinkable happens.</p>
                                            <p class="mb-4">Perfect for fans of Barbara Kingsolver and Karen Russell, Where the Crawdads Sing is at once an exquisite ode to the natural world, a heartbreaking coming-of-age story, and a surprising tale of possible murder. Owens reminds us that we are forever shaped by the children we once were, and that we are all subject to the beautiful and violent secrets that nature keeps</p>
                                            <p>WHERE THE CRAWDADS LP</p>
                                            <!-- End Mockup Block -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Tab Content -->
                        </div>

                        <div id="ProductDetails" class="">
                            

                            
                        </div>


                        <div id="ProductReviews" class="">
                            <div class="border-top border-bottom">
                                <ul class="container tabs wc-tabs nav justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble">
                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item">
                                        <a class="nav-link py-4 font-weight-medium" href="#Description">
                                            Description
                                        </a>
                                    </li>
                       
                                    <li class="flex-shrink-0 flex-md-shrink-1 nav-item active">
                                        <a class="nav-link py-4 font-weight-medium active" href="#ProductReviews">
                                            Reviews
                                        </a>
                                    </li>
                                </ul>
                            </div>


                            <!-- Tab Content -->
                            <div class="tab-content font-size-2 container">
                                <div class="row">
                                    <div class="col-xl-8 offset-xl-2">
                                        <div class="woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab pt-9">
                                            <!-- Mockup Block -->
                                            <h4 class="font-size-3">Customer Reviews </h4>
                                            <div class="row mb-8">
                                                <div class="col-md-6 mb-6 mb-md-0">
                                                    <div class="d-flex  align-items-center mb-4">
                                                        <span class="font-size-15 font-weight-bold">4.6</span>
                                                        <div class="ml-3 h6 mb-0">
                                                            <span class="font-weight-normal">3,714 reviews</span>
                                                            <div class="text-yellow-darker">
                                                                <small class="fas fa-star"></small>
                                                                <small class="fas fa-star"></small>
                                                                <small class="fas fa-star"></small>
                                                                <small class="fas fa-star"></small>
                                                                <small class="far fa-star"></small>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="d-md-flex">
                                                        <button type="button" class="btn btn-outline-dark rounded-0 px-5 mb-3 mb-md-0">See all reviews</button>
                                                        <button type="button" class="btn btn-dark ml-md-3 rounded-0 px-5">Write a review</button>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <!-- Ratings -->
                                                    <ul class="list-unstyled pl-xl-4">
                                                        <li class="py-2">
                                                            <a class="row align-items-center mx-gutters-2 font-size-2" href="javascript:;">
                                                                <div class="col-auto">
                                                                    <span class="text-dark">5 stars</span>
                                                                </div>
                                                                <div class="col px-0">
                                                                    <div class="progress bg-white-100" style="height: 7px;">
                                                                        <div class="progress-bar bg-yellow-darker" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                    <span class="text-secondary">205</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                        <li class="py-2">
                                                            <a class="row align-items-center mx-gutters-2 font-size-2" href="javascript:;">
                                                                <div class="col-auto">
                                                                    <span class="text-dark">4 stars</span>
                                                                </div>
                                                                <div class="col px-0">
                                                                    <div class="progress bg-white-100" style="height: 7px;">
                                                                        <div class="progress-bar bg-yellow-darker" role="progressbar" style="width: 53%;" aria-valuenow="53" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                    <span class="text-secondary">55</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                        <li class="py-2">
                                                            <a class="row align-items-center mx-gutters-2 font-size-2" href="javascript:;">
                                                                <div class="col-auto">
                                                                    <span class="text-dark">3 stars</span>
                                                                </div>
                                                                <div class="col px-0">
                                                                    <div class="progress bg-white-100" style="height: 7px;">
                                                                        <div class="progress-bar bg-yellow-darker" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                    <span class="text-secondary">23</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                        <li class="py-2">
                                                            <a class="row align-items-center mx-gutters-2 font-size-2" href="javascript:;">
                                                                <div class="col-auto">
                                                                    <span class="text-dark">2 stars</span>
                                                                </div>
                                                                <div class="col px-0">
                                                                    <div class="progress bg-white-100" style="height: 7px;">
                                                                        <div class="progress-bar bg-yellow-darker" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                    <span class="text-secondary">0</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                        <li class="py-2">
                                                            <a class="row align-items-center mx-gutters-2 font-size-2" href="javascript:;">
                                                                <div class="col-auto">
                                                                    <span class="text-dark">1 stars</span>
                                                                </div>
                                                                <div class="col px-0">
                                                                    <div class="progress bg-white-100" style="height: 7px;">
                                                                        <div class="progress-bar bg-yellow-darker" role="progressbar" style="width: 1%;" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2">
                                                                    <span class="text-secondary">4</span>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <!-- End Ratings -->
                                                </div>
                                            </div>

                                            <h4 class="font-size-3 mb-8">1-5 of 44 reviews</h4>
										 <c:forEach var="book_review" items="${ReviewList}">
                                            <ul class="list-unstyled mb-8">
                                                <li class="mb-4 pb-5 border-bottom">
                                                    <div class="d-flex align-items-center mb-3">
                                                        <h6 class="mb-0">제목없음</h6>
                                                        <div class="text-yellow-darker ml-3">
                                                            <small class="fas fa-star"></small>
                                                            <small class="fas fa-star"></small>
                                                            <small class="fas fa-star"></small>
                                                            <small class="fas fa-star"></small>
                                                            <small class="far fa-star"></small>
                                                        </div>
                                                    </div>
                                                  
                                                    <p class="mb-4 text-lh-md">${book_review.book_review_short}</p>
                                                    <div class="text-gray-600 mb-4">${book_review.book_review_writer}&nbsp;${book_review.book_review_date}</div>
                                                   
                                                    <c:if test="${loginId == book_review.book_review_writer}">
                                                    <ul class="nav">
                                                		<li>[<a href="javascript:replyEditForm(${book_review.book_review_no},'${book_review.book_review_short}')">수정</a>]</li>
                                                		<li>[<a href="javascript:book_review_delete(${book_review.book_review_no})">삭제</a>]</li>
                                                    </ul>
                                                   </c:if>
                                                   
                                                </li>                          
                                            </ul>
                                         </c:forEach>

                                            <h4 class="font-size-3 mb-4">Write a Review</h4>
                                            <form class="card" id="book_review_form" action="book_review" method="post"  onsubmit="return book_review_form()">
                                            <div class="js-form-message form-group mb-4">
	                                                
	                                                <textarea name="book_review_short" class="form-control rounded-0 p-4" rows="7" id="book_review_short" placeholder="What did you like or dislike? What should other shoppers know before buying?" required data-msg="Please enter your message." data-error-class="u-has-error" data-success-class="u-has-success" rows="1"></textarea>
	                                                <input type="hidden" name="book_isbn" value="${book_isbn}">
                                            </div>
                                            <div class="d-flex">
                                                <button type="submit" class="btn btn-dark btn-wide rounded-0 transition-3d-hover">Submit Review</button>
                                            </div>
                                            </form>
                                            <!-- End Mockup Block -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Tab Content -->
                        </div>
                    </div>
                </div>
                <!-- End Nav Classic -->
 
            </div>
        </main>
    </div>
    <!-- ====== END MAIN CONTENT ====== -->

   <%@ include file="../footer.jsp" %>
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/jquery-migrate.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/bootstrap-select.min.js"></script>
    <script src="resources/js/slick.min.js"></script>
    <script src="resources/js/jquery.zeynep.js"></script>
    <script src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>


    <!-- JS HS Components -->
    <script src="resources/js/hs.core.js"></script>
    <script src="resources/js/hs.unfold.js"></script>
    <script src="resources/js/hs.malihu-scrollbar.js"></script>
    <script src="resources/js//hs.header.js"></script>
    <script src="resources/js/hs.slick-carousel.js"></script>
    <script src="resources/js/hs.selectpicker.js"></script>
    <script src="resources/js/hs.show-animation.js"></script>
    
     <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="resources/assets/vendor/appear.js"></script>
    <script src="resources/assets/vendor/fancybox/jquery.fancybox.min.js"></script>
    <script src="resources/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
    

    <!-- JS HS Components -->
    <script src="resources/assets/js/components/hs.onscroll-animation.js"></script>
    <script src="resources/assets/js/components/hs.quantity-counter.js"></script>
    <script src="resources/assets/js/components/hs.scroll-nav.js"></script>
    
    <script>
    $(document).on('ready', function () {
        // initialization of unfold component
        $.HSCore.components.HSUnfold.init($('[data-unfold-target]'));

        // initialization of select picker
        $.HSCore.components.HSSelectPicker.init('.js-select');

        // initialization of slick carousel
        $.HSCore.components.HSSlickCarousel.init('.js-slick-carousel');

        // initialization of malihu scrollbar
        $.HSCore.components.HSMalihuScrollBar.init($('.js-scrollbar'));

        // initialization of popups
        $.HSCore.components.HSFancyBox.init('.js-fancybox');

        // initialization of quantity counter
        $.HSCore.components.HSQantityCounter.init('.js-quantity');

        // initialization of show animations
        $.HSCore.components.HSShowAnimation.init('.js-animation-link');

        // initialization of HSScrollNav component
        $.HSCore.components.HSScrollNav.init($('.js-scroll-nav'), {
          duration: 700
        });

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
</body>
</html>
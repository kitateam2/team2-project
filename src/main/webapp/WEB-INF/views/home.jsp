<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.png">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- CSS Bookworm Template -->
<link rel="stylesheet" href="resources/assets/css/theme.css">
   <link rel="stylesheet" href="resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="resources/assets/vendor/animate.css/animate.css">
    <link rel="stylesheet" href="resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/slick-carousel/slick/slick.css"/>
     <link rel="stylesheet" href="resources/assets/css/theme.css">
    <link rel="stylesheet" href="resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">


<!-- JS Global Compulsory -->
<script src="resources/assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="resources//assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
<script src="resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="resources/assets/vendor/bootstrap/bootstrap.min.js"></script>


<!-- JS Bookworm -->
<script src="resources/assets/js/hs.core.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
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
	var searchText = document.getElementById("bookName").value;
	location.href = 'list?searchText='+searchText;
}


</script>
</head>
<body>
<%@ include file="header.jsp" %>
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
    
    
    <!-- ====== MAIN CONTENT ====== -->
    <section class="space-bottom-3">
        <div class="bg-gray-200 space-2 space-lg-0 bg-img-hero" style="background-image: url(resource/assets/img/KakaoTalk_20220302_144747131.png);">
            <div class="container">
                <div class="js-slick-carousel u-slick"
                    data-pagi-classes="text-center u-slick__pagination position-absolute right-0 left-0 mb-n8 mb-lg-4 bottom-0">
                    <div class="js-slide">
                        <div class="hero row min-height-588 align-items-center">
                        
                        
                            <div style="position:relative; top:-50px;"class="col-lg-12 col-wd-12 mb-4 mb-lg-0">
                           
                                <img class="img-fluid" src="resources/img/KakaoTalk_20220302_144747131.png" alt="image-description">
                            </div>
                            
                            
                            
                            
                        </div>
                    </div>

                    <div class="js-slide">
                    
                        <div class="hero row min-height-588 align-items-center">
                            <div style="position:relative; top:-50px;"class="col-lg-12 col-wd-12 mb-4 mb-lg-0">
                              
                            </div>
                            <div style="position:relative; top:-50px; "class="col-lg-15 col-wd-12 mb-4 mb-lg-0">
                                <img class="img-fluid" src="resources/img/KakaoTalk_20220302_144859714.png" alt="image-description">
                            </div>
                        </div>
                    </div>

                    <div class="js-slide">
                        <div class="hero row min-height-588 align-items-center">
                      
                            <div class="col-lg-15 col-wd-12 mb-4 mb-lg-0">
                                <img class="img-fluid" src="resources/img/KakaoTalk_20220302_144747987.png" alt="image-description">
                            </div>
                        </div>
                    </div>

                    <div class="js-slide">
                        <div class="hero row min-height-588 align-items-center">
                            <div class="col-lg-7 col-wd-6 mb-4 mb-lg-0">
                            
                            </div>
                           <div style="position:relative; top:-50px; class="col-lg-15 col-wd-12 mb-4 mb-lg-0">
                                <img class="img-fluid" src="resources/img/KakaoTalk_20220302_144747348.png" alt="image-description">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="space-bottom-3">
        <div class="container">
            <header class="mb-5 d-md-flex justify-content-between align-items-center">
                <h2 class="font-size-7 mb-3 mb-md-0">Best Seller</h2>
                
            </header>

            <div class="js-slick-carousel products no-gutters border-top border-left border-right"
                data-pagi-classes="d-xl-none text-center position-absolute right-0 left-0 u-slick__pagination mt-4 mb-0"
                data-arrows-classes="d-none d-xl-block u-slick__arrow u-slick__arrow-centered--y"
                data-arrow-left-classes="fas fa-chevron-left u-slick__arrow-inner u-slick__arrow-inner--left ml-lg-n10"
                data-arrow-right-classes="fas fa-chevron-right u-slick__arrow-inner u-slick__arrow-inner--right mr-lg-n10"
                data-slides-show="5"
                data-responsive='[{
                   "breakpoint": 1500,
                   "settings": {
                     "slidesToShow": 4
                   }
                },{
                   "breakpoint": 1199,
                   "settings": {
                     "slidesToShow": 3
                   }
                },{
                   "breakpoint": 992,
                   "settings": {
                     "slidesToShow": 2
                   }
                }, {
                   "breakpoint": 768,
                   "settings": {
                     "slidesToShow": 1
                   }
                }, {
                   "breakpoint": 554,
                   "settings": {
                     "slidesToShow": 1
                   }
                }]'>
                <!-- 반복 시작 -->
			<c:forEach var="book" items="${insert_best}" varStatus="status">  
                <div class="product">
                    <div class="product__inner overflow-hidden p-3 p-md-4d875">
                    	
                        <div class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
                            <div class="woocommerce-loop-product__thumbnail">
                               <a href="read?book_isbn=${book.book_isbn}" class="d-block"><img src="download?filename=${book.book_image}"></a>
                            </div>
                            <div class="woocommerce-loop-product__body product__body pt-3 bg-white">
                                <div class="text-uppercase font-size-1 mb-1 text-truncate"></div>
                                <h2 class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark"><a href="read?book_isbn=${book.book_isbn}">${book.book_title}</a></h2>
                                <div class="font-size-2  mb-1 text-truncate">저자: ${book.book_author}</div>
                                <div class="price d-flex align-items-center font-weight-medium font-size-3">
                                    <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"></span><fmt:formatNumber value="${book.book_price}" pattern="###,###" />원</span>
                                </div>
                            </div>
                            <div class="product__hover d-flex align-items-center" value="${book.book_isbn};">
                                <a href="#" class="text-uppercase text-dark h-dark font-weight-medium mr-auto" onclick="bt1Click('${book.book_isbn}');">
                                    <span class="product__add-to-cart">ADD TO CART</span>
                                    <input type="hidden" id="book_isbn_param${status.count}" value="${book.book_isbn}">
                                    <span class="product__add-to-cart-icon font-size-4"><i class="flaticon-icon-126515"></i></span>
                                </a>
                               <a href="#" class="h-p-bg btn btn-outline-primary border-0" data-toggle="tooltip" data-placement="right" title="" data-original-title="ADD TO WISHLIST" onclick="bt2Click(${book.book_isbn});">
                                            <i class="fa fa-heart fa"></i>
                               </a>
                            </div>
                        </div>
                          
                    </div>
                </div>
			</c:forEach>
            <!-- 반복 끝 -->

               

                

                

                
                


            </div>
        </div>
    </section>
    <section class="space-bottom-3">
        <header class="mb-4 container">
            <h2 class="font-size-7 text-center">Featured</h2>
        </header>
        <div class="container">
            <ul class="nav justify-content-md-center nav-gray-700 mb-5 flex-nowrap flex-md-wrap overflow-auto overflow-md-visible" id="featuredBooks" role="tablist">
                <li class="nav-item mx-5 mb-1 flex-shrink-0 flex-md-shrink-1">
                    <a class="nav-link px-0 active" id="featured-tab" data-toggle="tab" href="#featured" role="tab" aria-controls="featured" aria-selected="true">신간 도서</a>
                </li>
                <li class="nav-item mx-5 mb-1 flex-shrink-0 flex-md-shrink-1">
                    <a class="nav-link px-0" id="onsale-tab" data-toggle="tab" href="#onsale" role="tab" aria-controls="onsale" aria-selected="false">고객 리뷰순</a>
                </li>
              
            </ul>
            <div class="tab-content" id="featuredBooksContent">
                <div class="tab-pane fade show active" id="featured" role="tabpanel" aria-labelledby="featured-tab">
                    <ul class="products list-unstyled row no-gutters row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-wd-6 border-top border-left my-0">
                        
                        <!-- 반복 시작 -->
						<c:forEach var="book" items="${insert_date}" varStatus="status">  
                        
                        <li class="product col">
                            <div class="product__inner overflow-hidden p-3 p-md-4d875">
                                <div class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
                                    <div class="woocommerce-loop-product__thumbnail">
                                        <a href="read?book_isbn=${book.book_isbn}" class="d-block"><img src="download?filename=${book.book_image}"></a>
                                    </div>
                                    <div class="woocommerce-loop-product__body product__body pt-3 bg-white">
                                        <div class="text-uppercase font-size-1 mb-1 text-truncate"></div>
                                        <h2 class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark"><a href="read?book_isbn=${book.book_isbn}">${book.book_title}</a></h2>
                                        <div class="font-size-2  mb-1 text-truncate">저자: ${book.book_author}</div>
                                        <div class="price d-flex align-items-center font-weight-medium font-size-3">
                                            <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"><fmt:formatNumber value="${book.book_price}" pattern="###,###" /></span>원</span>
                                        </div>
                                    </div>
                                    <div class="product__hover d-flex align-items-center" value="${book.book_isbn}">
                                        <a href="#" onclick="bt1Click('${book.book_isbn}');" class="text-uppercase text-dark h-dark font-weight-medium mr-auto" data-toggle="tooltip" data-placement="right" title="ADD TO CART">
                                            <span class="product__add-to-cart">ADD TO CART</span>
                                            <input type="hidden" id="book_isbn_param${status.count}" value="${book.book_isbn}">
                                            <span class="product__add-to-cart-icon font-size-4"><i class="flaticon-icon-126515"></i></span>
                                        </a>
                            				<a href="#" class="h-p-bg btn btn-outline-primary border-0" data-toggle="tooltip" data-placement="right" title="" data-original-title="ADD TO WISHLIST" onclick="bt2Click(${book.book_isbn});">
                                            <i class="fa fa-heart fa"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        </c:forEach>        
						<!-- 반복 끝 -->
                        
                    </ul>
                </div>
                
                <div class="tab-pane fade" id="onsale" role="tabpanel" aria-labelledby="onsale-tab">
                    <ul class="products list-unstyled row no-gutters row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-wd-6 border-top border-left my-0">
                        
                        <!-- 반복 시작 -->
						<c:forEach var="book" items="${insert_reward}" varStatus="status"> 
                        
                        <li class="product col">
                            <div class="product__inner overflow-hidden p-3 p-md-4d875">
                                <div class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
                                    <div class="woocommerce-loop-product__thumbnail">
                                        <a href="read?book_isbn=${book.book_isbn}" class="d-block"><img src="download?filename=${book.book_image}"></a>
                                    </div>
                                    <div class="woocommerce-loop-product__body product__body pt-3 bg-white">
                                        <div class="text-uppercase font-size-1 mb-1 text-truncate"></div>
                                        <h2 class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark"><a href="read?book_isbn=${book.book_isbn}">${book.book_title}</a></h2>
                                        <div class="font-size-2  mb-1 text-truncate">저자: ${book.book_author}</div>
                                        <div class="price d-flex align-items-center font-weight-medium font-size-3">
                                            <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"><fmt:formatNumber value="${book.book_price}" pattern="###,###" /></span>원</span>
                                        </div>
                                    </div>
                                    <div class="product__hover d-flex align-items-center" value="${book.book_isbn}">
                                        <a href="#" onclick="bt1Click('${book.book_isbn}');" class="text-uppercase text-dark h-dark font-weight-medium mr-auto" data-toggle="tooltip" data-placement="right" title="ADD TO CART">
                                            <span class="product__add-to-cart">ADD TO CART</span>
                                            <input type="hidden" id="book_isbn_param${status.count}" value="${book.book_isbn}">
                                            <span class="product__add-to-cart-icon font-size-4"><i class="flaticon-icon-126515"></i></span>
                                        </a>
                            				<a href="#" class="h-p-bg btn btn-outline-primary border-0" data-toggle="tooltip" data-placement="right" title="" data-original-title="ADD TO WISHLIST" onclick="bt2Click(${book.book_isbn});">
                                            <i class="fa fa-heart fa"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        
                        </c:forEach>        
						<!-- 반복 끝 -->
                    </ul>
                </div>
                
            
            </div>
        </div>
    </section>
   
                
  

    <!-- ====== END MAIN CONTENT ====== -->
	<%@ include file="footer.jsp" %>
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
<%--     <c:forEach var="cart" items="${Cart_book1}">  
            <a href="#" onclick="bt1Click(${cart.book_isbn});" class="btn btn-primary">Add to Cart</a>
            </c:forEach> --%>

</body>



</html>

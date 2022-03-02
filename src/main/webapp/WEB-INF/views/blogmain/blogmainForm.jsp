<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Title -->
    <title>블로그 메인</title>

    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/assets/img/favicon.png">

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
<body>
<%@ include file="../header.jsp" %>
    <!-- ====== MAIN CONTENT ===== -->
    <main id="content">
        <div class="mb-5 mb-lg-8 pb-xl-1">
            <div class="mb-5 mb-lg-8 pb-xl-1">
                <div class="page-header border-bottom">
                    <div class="container">
                        <div class="d-md-flex justify-content-between align-items-center py-4">
                            <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg"><a href="/team2/blogmain">Blog Main</a>&nbsp;&nbsp;&nbsp;
                            <c:if test="${sessionScope.loginId != null}">
                            <a href="${pageContext.request.contextPath}/myblog/${sessionScope.loginId}">My Blog</a></c:if></h1>
                            <nav class="woocommerce-breadcrumb font-size-2">
                                <a href="/team2" class="h-primary">Home</a>
                                <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
                                <span>Blog Main</span>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row mb-5 mb-lg-9 pb-xl-1">
                    <div class="col-lg-4 col-xl-3">
                        <div id="SidebarAccordion">
                            <div id="Search" class="widget p-4 border">
                                <div id="Heading21">
                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
                                        data-toggle="collapse"
                                        data-target="#Collapse21"
                                        aria-expanded="true"
                                        aria-controls="Collapse21">

                                        <h3 class="title mb-0 font-weight-medium font-size-3">Search</h3>

                                        <svg class="minus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                        </svg>

                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                        </svg>
                                    </a>
                                </div>

                                <div id="Collapse21" class="mt-4 collapse show"
                                    aria-labelledby="Heading21"
                                    data-parent="#SidebarAccordion">
                                    <form class="form-inline my-2 my-xl-0 overflow-hidden" id="pagingForm" method="get" action="${pageContext.request.contextPath}/blogmain">
                                        <div class="input-group flex-nowrap w-100">
                                            <div class="input-group-prepend">
                                                <i class="glph-icon flaticon-loupe py-2d75 bg-white-100 border-white-100 text-dark pl-3 pr-0 rounded-0"></i>
                                            </div>
                                            <input type="hidden" name="page" id="page">
                                            <input class="form-control bg-white-100 py-2d75 height-4 border-white-100 rounded-0" type="search" placeholder="Search" aria-label="Search" name="searchText" value="${searchText}">
                                        </div>
                                        <input type="button" class="btn btn-outline-success my-2 my-sm-0 sr-only" onclick="pagingFormSubmit(1)" value="검색">
                                    </form>
                                </div>
                            </div>

                            <div id="PowerBlog" class="widget p-4 border">
                                <div id="Heading22">
                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
                                        data-toggle="collapse"
                                        data-target="#Collapse22"
                                        aria-expanded="false"
                                        aria-controls="Collapse22">

                                        <h3 class="title mb-0 font-weight-medium font-size-3">Power Blog</h3>

                                        <svg class="minus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                        </svg>

                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                        </svg>
                                    </a>
                                </div>								
                                <div id="Collapse22" class="mt-4 collapse"
                                    aria-labelledby="Heading22"
                                    data-parent="#SidebarAccordion"> 
                                    <c:forEach var="rank" items="${bloglist}" varStatus="status">                                   
                                        <a class="form-group d-flex align-items-center justify-content-between font-size-2 text-lh-md mb-3" href="${pageContext.request.contextPath}/myblog/${rank.follow_ed_id}">
                                            <span class="text-dark">${rank.follow_ed_id}</span>
                                            <small class="text-gray-600">${status.count}</small>
                                        </a> 
                                    </c:forEach>                                   
                                </div>                                
                            </div>

                            <div id="BestPost" class="widget p-4 border">
                                <div id="Heading23">
                                    <a class="d-flex align-items-center justify-content-between collapse-link text-dark" href="#"
                                        data-toggle="collapse"
                                        data-target="#Collapse23"
                                        aria-expanded="false"
                                        aria-controls="Collapse23">

                                        <h3 class="title font-weight-medium font-size-3 mb-0">Best Post</h3>

                                        <svg class="minus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                        </svg>

                                        <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                            <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                        </svg>
                                    </a>
                                </div>                                
                                <div id="Collapse23" class="mt-6 collapse"
                                    aria-labelledby="Heading23"
                                    data-parent="#SidebarAccordion">
                                    <c:forEach var="rank" items="${postlist}" varStatus="status">
                                        <a class="form-group d-flex align-items-center justify-content-between font-size-2 text-lh-md mb-3" href="${pageContext.request.contextPath}/myblog/${rank.user_id}/one_post?post_no=${rank.post_no}">
                                            <span class="text-dark">${rank.post_title}</span>
                                            <small class="text-gray-600">${status.count}</small>
                                        </a>  
                                    </c:forEach>                                      
                                </div>                                 
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-xl-9">
                        <div class="row row-cols-md-2">
                            
                            <c:forEach var="blog" items="${list}">
                            <div class="col">
                                <div class="mb-5">
                                    <a class="d-block mb-3" href="${pageContext.request.contextPath}/myblog/${blog.user_id}/one_post?post_no=${blog.post_no}">
                                        <img class="img-fluid" src="${pageContext.request.contextPath}/myblog/${blog.user_id}/show_file?post_no=${blog.post_no}" onerror="this.style.display='none'">
                                    </a>
                                    <div class="mb-2">
                                        <a class="font-size-2" href="${pageContext.request.contextPath}/myblog/${blog.user_id}">${blog.user_id}</a>
                                    </div>
                                    <h6 class="font-size-7 crop-text-2 font-weight-medium text-lh-1dot4">
                                        <a href="${pageContext.request.contextPath}/myblog/${blog.user_id}/one_post?post_no=${blog.post_no}">${blog.post_title}</a>
                                    </h6>
                                    <p class="font-size-2 text-secondary-gray-700">${blog.post_contents}</p>
                                    <div class="font-size-2 text-secondary-gray-700">
                                        <span>${blog.post_uploaddate}</span>
                                        <span class="ml-3">조회수: ${blog.post_hits}</span>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>
                <nav aria-label="Page navigation example">
                    <ul class="pagination pagination__custom justify-content-md-center flex-nowrap flex-md-wrap overflow-auto overflow-md-visble mb-0">
                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage - 1})">Previous</a></li>
                        
                        <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
                        	<c:if test="${counter == navi.currentPage}"><b></c:if>
                        		<li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${counter})">${counter}</a></li>
                        	<c:if test="${counter == navi.currentPage}"></b></c:if>
                        </c:forEach>
                                                
                        <li class="flex-shrink-0 flex-md-shrink-1 page-item"><a class="page-link" href="javascript:pagingFormSubmit(${navi.currentPage + 1})">Next</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </main>
    <!-- ====== END MAIN CONTENT ===== -->
<%@ include file="../footer.jsp" %>
    
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
    <!-- <script src="resources/assets/js/bookworm.js"></script> -->
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
        
        function pagingFormSubmit(currentPage) {
    		var form = document.getElementById('pagingForm');
    		var page = document.getElementById('page');    		
    		page.value = currentPage;    		
    		form.submit();
    		}
    </script>
</body>
</html>
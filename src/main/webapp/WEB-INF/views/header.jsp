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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/theme.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/animate.css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/slick-carousel/slick/slick.css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
   
<!-- JS Global Compulsory -->
<script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources//assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/bootstrap.min.js"></script>

<!-- JS Bookworm -->
<script src="${pageContext.request.contextPath}/resources/assets/js/hs.core.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 

</head>

<body>
<!-- 채팅/댓글 알림 div -->
<div id="socketAlert" class="alert alert-success" role="alert" style="display:none;"></div>
<!--===== HEADER CONTENT =====-->
    <header id="site-header" class="site-header__v1">
        <div class="topbar border-bottom d-none d-md-block">
            <div class="container-fluid px-2 px-md-5 px-xl-8d75">
                <div class="topbar__nav d-md-flex justify-content-between align-items-center">
                   
                  
        <c:if test="${sessionScope.loginId != null}">
				<a href="${pageContext.request.contextPath}/logout" style="color:black;position: relative; top: 3px; font-size:16px; left:1210px;">로그아웃</a>
				<a style="position: relative; top: 3px; font-size:16px; left:650px;">${sessionScope.loginId}님 환영합니다.</a>
				<a href="${pageContext.request.contextPath}/updatemember" style="color:black; position: relative; top: 3px; font-size:16px; right:-380px;">회원정보수정</a>
		
			</c:if>
                    <ul class="topbar__nav--right nav mr-md-n3" style="position:relative; left:1280px;">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/condition" class="nav-link link-black-100"><i class="fa fa-user-plus fa"></i></a></li>
                            <!-- Account Sidebar Toggle Button -->
                               <c:if test="${sessionScope.loginId == null}">
				
				
			<font-awesome-icon icon="fa-regular fa-user-pen" />
                            <a id="sidebarNavToggler" href="${pageContext.request.contextPath}/login" role="button" class="nav-link link-black-100">
                                
                                <i class="glph-icon flaticon-user"></i>
                            </a>
                            </c:if>
                            <!-- End Account Sidebar Toggle Button -->
                        </li>
                        <li class="nav-item">
                            <!-- Cart Sidebar Toggle Button -->
                          
                            <!-- End Cart Sidebar Toggle Button -->
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="masthead border-bottom position-relative" style="margin-bottom: -1px;">
            <div class="container-fluid px-3 px-md-5 px-xl-8d75 py-2 py-md-0">
                <div class="d-flex align-items-center position-relative flex-wrap">
                    <div class="offcanvas-toggler mr-4 mr-lg-8">
                        <a id="sidebarNavToggler2" href="javascript:;" role="button" class="cat-menu"
                        aria-controls="sidebarContent2"
                        aria-haspopup="true"
                        aria-expanded="false"
                        data-unfold-event="click"
                        data-unfold-hide-on-scroll="false"
                        data-unfold-target="#sidebarContent2"
                        data-unfold-type="css-animation"
                        data-unfold-overlay='{
                            "className": "u-sidebar-bg-overlay",
                            "background": "rgba(0, 0, 0, .7)",
                            "animationSpeed": 100
                        }'
                        data-unfold-animation-in="fadeInLeft"
                        data-unfold-animation-out="fadeOutLeft"
                        data-unfold-duration="100">
                         
                        </a>
                    </div>
                    <div class="site-branding pr-md-4">
                        <a href="/team2" class="d-block mb-1">
                        
                         <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="170px" height="30px">
                                <path fill-rule="evenodd" fill="rgb(25, 17, 11)"
                                d="M166.225,28.691 L165.065,15.398 L160.598,28.691 L158.229,28.691 L153.762,15.398 L152.590,28.691 L148.928,28.691 L150.405,11.052 L155.629,11.052 L159.389,22.124 L163.198,11.052 L168.422,11.052 L169.875,28.691 L166.225,28.691 ZM142.641,28.691 L138.051,20.928 L136.989,20.928 L136.989,28.691 L133.327,28.691 L133.327,11.052 L139.724,11.052 C140.692,11.052 141.546,11.189 142.287,11.461 C143.028,11.734 143.620,12.112 144.063,12.596 C144.507,13.081 144.840,13.636 145.064,14.263 C145.288,14.889 145.400,15.577 145.400,16.326 C145.400,17.506 145.078,18.472 144.436,19.225 C143.793,19.978 142.869,20.484 141.665,20.745 L146.975,28.691 L142.641,28.691 ZM141.896,16.204 C141.896,15.544 141.673,15.028 141.225,14.653 C140.777,14.279 140.086,14.092 139.150,14.092 L136.989,14.092 L136.989,18.303 L139.150,18.303 C140.981,18.303 141.896,17.603 141.896,16.204 ZM125.570,27.831 C124.206,28.567 122.666,28.936 120.949,28.936 C119.224,28.936 117.680,28.567 116.317,27.831 C114.953,27.094 113.881,26.034 113.100,24.651 C112.319,23.267 111.928,21.672 111.928,19.866 C111.928,18.051 112.319,16.454 113.100,15.074 C113.881,13.695 114.953,12.639 116.317,11.907 C117.680,11.174 119.224,10.808 120.949,10.808 C122.674,10.808 124.217,11.174 125.576,11.907 C126.935,12.639 128.005,13.695 128.786,15.074 C129.567,16.454 129.958,18.051 129.958,19.866 C129.958,21.672 129.567,23.267 128.786,24.651 C128.005,26.034 126.933,27.094 125.570,27.831 ZM124.807,15.715 C123.797,14.690 122.512,14.177 120.949,14.177 C119.387,14.177 118.101,14.690 117.092,15.715 C116.083,16.741 115.578,18.124 115.578,19.866 C115.578,21.616 116.083,23.005 117.092,24.034 C118.101,25.064 119.387,25.579 120.949,25.579 C122.512,25.579 123.797,25.064 124.807,24.034 C125.816,23.005 126.320,21.616 126.320,19.866 C126.320,18.124 125.816,16.741 124.807,15.715 ZM66.872,28.691 L61.391,21.196 L60.097,21.196 L60.097,28.691 L56.435,28.691 L56.435,11.052 L60.097,11.052 L60.097,17.986 L61.342,17.986 L66.872,11.052 L71.340,11.052 L64.504,19.487 L71.547,28.691 L66.872,28.691 ZM48.677,27.831 C47.314,28.567 45.774,28.936 44.057,28.936 C42.332,28.936 40.788,28.567 39.425,27.831 C38.061,27.094 36.989,26.034 36.208,24.651 C35.427,23.267 35.036,21.672 35.036,19.866 C35.036,18.051 35.427,16.454 36.208,15.074 C36.989,13.695 38.061,12.639 39.425,11.907 C40.788,11.174 42.332,10.808 44.057,10.808 C45.782,10.808 47.324,11.174 48.684,11.907 C50.043,12.639 51.113,13.695 51.894,15.074 C52.675,16.454 53.066,18.051 53.066,19.866 C53.066,21.672 52.675,23.267 51.894,24.651 C51.113,26.034 50.040,27.094 48.677,27.831 ZM47.915,15.715 C46.905,14.690 45.620,14.177 44.057,14.177 C42.495,14.177 41.209,14.690 40.200,15.715 C39.191,16.741 38.686,18.124 38.686,19.866 C38.686,21.616 39.191,23.005 40.200,24.034 C41.209,25.064 42.495,25.579 44.057,25.579 C45.620,25.579 46.905,25.064 47.915,24.034 C48.924,23.005 49.428,21.616 49.428,19.866 C49.428,18.124 48.924,16.741 47.915,15.715 ZM28.487,27.831 C27.124,28.567 25.584,28.936 23.867,28.936 C22.141,28.936 20.597,28.567 19.234,27.831 C17.871,27.094 16.799,26.034 16.018,24.651 C15.236,23.267 14.846,21.672 14.846,19.866 C14.846,18.051 15.236,16.454 16.018,15.074 C16.799,13.695 17.871,12.639 19.234,11.907 C20.597,11.174 22.141,10.808 23.867,10.808 C25.592,10.808 27.134,11.174 28.493,11.907 C29.852,12.639 30.922,13.695 31.704,15.074 C32.485,16.454 32.875,18.051 32.875,19.866 C32.875,21.672 32.485,23.267 31.704,24.651 C30.922,26.034 29.850,27.094 28.487,27.831 ZM27.724,15.715 C26.715,14.690 25.429,14.177 23.867,14.177 C22.304,14.177 21.018,14.690 20.009,15.715 C19.000,16.741 18.496,18.124 18.496,19.866 C18.496,21.616 19.000,23.005 20.009,24.034 C21.018,25.064 22.304,25.579 23.867,25.579 C25.429,25.579 26.715,25.064 27.724,24.034 C28.733,23.005 29.238,21.616 29.238,19.866 C29.238,18.124 28.733,16.741 27.724,15.715 ZM11.672,27.367 C10.736,28.250 9.361,28.691 7.546,28.691 L0.283,28.691 L0.283,11.052 L5.996,11.052 C7.875,11.052 9.314,11.478 10.311,12.328 C11.308,13.178 11.806,14.365 11.806,15.886 C11.806,16.676 11.633,17.374 11.287,17.980 C10.941,18.586 10.431,19.052 9.755,19.377 C11.969,19.988 13.076,21.445 13.076,23.748 C13.076,25.278 12.608,26.484 11.672,27.367 ZM7.827,14.647 C7.420,14.277 6.821,14.092 6.032,14.092 L3.811,14.092 L3.811,18.242 L6.191,18.242 C6.940,18.242 7.501,18.047 7.875,17.656 C8.250,17.266 8.437,16.753 8.437,16.118 C8.437,15.508 8.233,15.018 7.827,14.647 ZM8.876,21.709 C8.445,21.278 7.749,21.062 6.789,21.062 L3.811,21.062 L3.811,25.554 L6.862,25.554 C7.782,25.554 8.455,25.347 8.883,24.932 C9.310,24.517 9.523,23.988 9.523,23.345 C9.523,22.686 9.308,22.140 8.876,21.709 Z" />
                                <path class="fill-primary" fill-rule="evenodd"
                                d="M105.996,23.499 C105.995,26.752 103.950,29.265 100.748,29.950 C100.713,29.958 100.681,29.983 100.647,30.000 C100.588,30.000 100.529,30.000 100.471,30.000 C100.467,28.585 100.460,27.171 100.466,25.756 C100.467,25.675 100.550,25.565 100.626,25.518 C101.352,25.068 101.714,24.425 101.711,23.571 C101.707,22.020 101.710,20.469 101.710,18.892 C103.133,18.892 104.546,18.892 105.996,18.892 C105.996,18.989 105.996,19.093 105.996,19.196 C105.996,20.630 105.997,22.065 105.996,23.499 ZM101.715,17.089 C101.715,15.990 101.683,14.917 101.724,13.847 C101.767,12.679 102.761,11.806 103.931,11.838 C105.060,11.869 105.978,12.794 105.993,13.940 C106.005,14.954 105.995,15.969 105.995,16.983 C105.995,17.011 105.987,17.040 105.980,17.089 C104.569,17.089 103.157,17.089 101.715,17.089 ZM96.421,29.234 C94.322,27.983 93.199,26.136 93.155,23.703 C93.108,21.138 93.145,18.571 93.146,16.005 C93.146,15.957 93.153,15.910 93.159,15.841 C94.572,15.841 95.976,15.841 97.426,15.841 C97.426,15.948 97.426,16.060 97.426,16.172 C97.426,18.602 97.430,21.031 97.423,23.461 C97.421,24.364 97.757,25.066 98.548,25.540 C98.629,25.589 98.688,25.740 98.689,25.844 C98.699,27.122 98.695,28.401 98.696,29.679 C98.696,29.786 98.703,29.893 98.707,30.000 C98.648,30.000 98.590,30.000 98.531,30.000 C97.799,29.823 97.075,29.624 96.421,29.234 ZM93.145,14.043 C93.145,13.935 93.145,13.823 93.145,13.711 C93.145,11.318 93.137,8.926 93.149,6.534 C93.154,5.625 92.818,4.928 92.023,4.460 C91.961,4.424 91.894,4.332 91.894,4.265 C91.886,2.850 91.888,1.436 91.888,0.000 C93.423,0.232 94.703,0.889 95.731,2.009 C96.833,3.209 97.413,4.630 97.421,6.261 C97.433,8.791 97.426,11.319 97.427,13.849 C97.427,13.906 97.421,13.964 97.416,14.043 C96.005,14.043 94.599,14.043 93.145,14.043 ZM89.588,4.782 C89.034,5.128 88.866,5.768 88.868,6.431 C88.875,8.061 88.870,9.692 88.869,11.322 C88.869,12.143 88.869,12.963 88.867,13.783 C88.867,13.869 88.857,13.954 88.851,14.051 C87.434,14.051 86.035,14.051 84.587,14.051 C84.587,13.958 84.587,13.866 84.587,13.774 C84.588,11.294 84.579,8.814 84.590,6.334 C84.605,3.158 86.853,0.543 90.000,0.018 C90.028,0.013 90.058,0.017 90.125,0.017 C90.125,0.639 90.125,1.243 90.125,1.848 C90.125,2.405 90.109,2.962 90.130,3.518 C90.149,4.032 90.126,4.447 89.588,4.782 ZM84.585,15.837 C86.015,15.837 87.420,15.837 88.868,15.837 C88.868,15.951 88.868,16.065 88.868,16.179 C88.868,18.608 88.849,21.039 88.873,23.468 C88.908,27.007 86.358,29.493 83.589,29.955 C83.552,29.961 83.518,29.985 83.482,30.000 C83.424,30.000 83.365,30.000 83.306,30.000 C83.310,28.634 83.319,27.268 83.313,25.902 C83.311,25.691 83.376,25.580 83.559,25.467 C84.268,25.031 84.587,24.371 84.587,23.549 C84.587,21.099 84.586,18.650 84.585,16.201 C84.585,16.085 84.585,15.970 84.585,15.837 ZM81.366,30.000 C80.875,29.844 80.360,29.740 79.897,29.524 C77.435,28.380 76.120,26.440 76.027,23.732 C75.974,22.192 76.017,20.649 76.016,19.107 C76.016,19.040 76.016,18.973 76.016,18.886 C77.447,18.886 78.859,18.886 80.303,18.886 C80.303,19.000 80.303,19.104 80.303,19.209 C80.303,20.663 80.308,22.117 80.302,23.571 C80.298,24.427 80.666,25.065 81.387,25.518 C81.463,25.566 81.547,25.675 81.547,25.756 C81.553,27.171 81.546,28.585 81.542,30.000 C81.484,30.000 81.425,30.000 81.366,30.000 ZM76.017,17.097 C76.017,16.540 76.017,15.997 76.017,15.453 C76.017,14.965 76.012,14.478 76.017,13.990 C76.030,12.831 76.911,11.892 78.032,11.838 C79.203,11.781 80.217,12.619 80.282,13.797 C80.341,14.885 80.294,15.978 80.294,17.097 C78.857,17.097 77.452,17.097 76.017,17.097 Z" />
                            </svg>
                            </a>
                    </div>
                    <div class="site-navigation mr-auto d-none d-xl-block">
                        <ul class="nav">
                            <li class="nav-item dropdown">
                                <a id="homeDropdownInvoker" href="/team2" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center">
                                    Home
                                </a>
                                
                           
                            
                            <li class="nav-item dropdown">
                                <a id="shopDropdownInvoker" href="${pageContext.request.contextPath}/cart" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center">
                                    Shop
                                </a>
                               
                            <li class="nav-item">
                                <a id="featuresDropdownInvoker" href="${pageContext.request.contextPath}/wish" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center"
                                    >
                                    wish
                                </a>
                                <div id="featuresDropdownMenu" class="p-0 dropdown-unfold dropdown-menu megamenu font-size-2 rounded-0 border-gray-900" aria-labelledby="featuresDropdownInvoker" style="width:1100px;">
                                    <div class="row no-gutters">
                                        <div class="col-8 px-1">
                                            <div class="px-5 py-2 pb-5">
                                                <div class="row">
                                                  
                                                    <div class="col-3">
                                                       
                                                    </div>
                                                    <div class="col-3">
                                                    
                                                    </div>
                                                    <div class="col-3">
                                                    
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4 bg-gray-200">
                                            <div class="banner px-8 py-5">
                                                <div class="banner__body">
                                                    <h3 class="banner_text m-0">
                                                        <span class="d-block mb-1 font-size-7 font-weight-regular">Deals in </span>
                                                        <span class="d-block mb-2 font-size-10 text-primary font-weight-bold">Books</span>
                                                    </h3>
                                                    <!-- <a href="#" class="d-block link-black-100 mb-6">Shop Now</a> -->
                                                    <div class="banner__image">
                                                        <img src="https://placehold.it/280x210" class="img-fluid" alt="image-description">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a id="blogDropdownInvoker" href="${pageContext.request.contextPath}/blogmain" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center">
                                    Blog
                                </a>
                            </li>
                             <c:if test="${sessionScope.loginId != null}">
                            <li class="nav-item dropdown">
                                <a id="pagesDropdownInvoker" href="${pageContext.request.contextPath}/myblog/${sessionScope.loginId}" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center">
                                    Myblog
                                </a>

                            </li>
                            </c:if>
                        </ul>
                    </div>

                    <ul class="d-md-none nav mr-md-n3 ml-auto">
                        <li class="nav-item">
                            <!-- Account Sidebar Toggle Button - Mobile -->
                            <a id="sidebarNavToggler9" href="javascript:;" role="button" class="px-2 nav-link link-black-100"
                                aria-controls="sidebarContent9"
                                aria-haspopup="true"
                                aria-expanded="false"
                                data-unfold-event="click"
                                data-unfold-hide-on-scroll="false"
                                data-unfold-target="#sidebarContent9"
                                data-unfold-type="css-animation"
                                data-unfold-overlay='{
                                    "className": "u-sidebar-bg-overlay",
                                    "background": "rgba(0, 0, 0, .7)",
                                    "animationSpeed": 500
                                }'
                                data-unfold-animation-in="fadeInRight"
                                data-unfold-animation-out="fadeOutRight"
                                data-unfold-duration="500">
                                <i class="glph-icon flaticon-user"></i>
                            </a>
                            <!-- End Account Sidebar Toggle Button - Mobile -->
                        </li>
                    </ul>

                    <div class="site-search ml-xl-0 ml-md-auto w-r-100 my-2 my-xl-0">
                        <form class="form-inline" id="bookName" method="get" action="list">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <i class="glph-icon flaticon-loupe input-group-text py-2d75 bg-white-100 border-white-100"></i>
                                </div>
                                <input type="hidden" name="page" id="page" />
                                <input class="form-control bg-white-100 min-width-380 py-2d75 height-4 border-white-100" type="text" placeholder="검색어 입력 ..." aria-label="Search" name="searchText" value="${searchText}" onkeypress="if(event.keyCode == 13){ bookPage(); }">
                            </div>
                            <button class="btn btn-outline-success my-2 my-sm-0 sr-only" type="submit" id="search" onclick="javascript: pagingFormSubmit(1); bookPage();" value="검색">Search</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/slick-carousel/slick/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/multilevel-sliding-mobile-menu/dist/jquery.zeynep.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>


    <!-- JS HS Components -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/hs.core.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/components/hs.unfold.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/components/hs.malihu-scrollbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/components/hs.header.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/components/hs.slick-carousel.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/components/hs.selectpicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/components/hs.show-animation.js"></script>

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
</body>
</html>
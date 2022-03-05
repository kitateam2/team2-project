<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=, initial-scale=1.0">
    <title>condition</title>
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
<style>

.input-div{
    vertical-align: middle;
 }
</style>
<head>
<script type="text/javascript">
function chk(){
 var req = document.form.req.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num==1){
  document.form.submit();
 }else{
  alert("약관에 동의하셔야 합니다.");
 }
}
function nochk(){
 alert("동의하지 않으면 가입하실 수 없습니다");
location.href="../index.jsp";} 

function chk(){
	 var req2 = document.form.req2.checked;
	 var num = 0;
	 if(req2 == true){
	  num = 1;
	 }
	 if(num==1){
	  document.form.submit();
	 }else{
	  alert("동의하셔야 합니다.");
	 }
	}
	function nochk(){
	 alert("동의하지 않으면 가입하실 수 없습니다");
	location.href="/team2";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 창</title>
</head>
<body>
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
                                <a id="shopDropdownInvoker" href="cart" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center">
                                    Shop
                                </a>
                               
                            <li class="nav-item">
                                <a id="featuresDropdownInvoker" href="wish" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center"
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
                                                    <a href="#" class="d-block link-black-100 mb-6">Shop Now</a>
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
                                <a id="blogDropdownInvoker" href="blogmain" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center">
                                    Blog
                                </a>
                            </li>
                             <c:if test="${sessionScope.loginId != null}">
                            <li class="nav-item dropdown">
                                <a id="pagesDropdownInvoker" href="myblog/${sessionScope.loginId}" class="dropdown-toggle nav-link link-black-100 mx-4 px-0 py-5 font-weight-medium d-flex align-items-center">
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
<form action="join" name="form" method="get">
 <table width="1400" height="650">
  
   <td width="100%" height="50%" align="center">
   <p align="center"></p>
  <br><br><br>
   <h1>회원가입 약관동의</h1>
   
   

  <textarea
     rows="10" cols="80" style="padding-left:30;padding-right:10;padding-bottom:30; padding-top:30;">
     제1조 (목적)
본 약관은 BookWorm㈜(이하 회사라 한다)와 BookWorm 계열사가 제공하는 온라인상의 인터넷 서비스(이하 서비스라 하며, 접속 가능한 유·무선 단말기의 종류와는 상관없이 이용 가능한 회사가 제공하는 모든 서비스를 의미합니다)를 이용함에 있어서 회사와 이용자의 권리, 의무, 책임 사항 및 서비스 이용절차 등에 관한 사항을 규정함을 목적으로 합니다.

※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」

제2조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

1. 회사란 BookWorm(주)를 의미하며, BookWorm(주)가 재화 또는 용역을 이용자에게 제공하기 위하여 운영하는 컴퓨터 등 정보통신설비(인터넷, 전화 등)를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 매장을 말하며 아울러 오프라인 매장과 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
2. 이용자란 매장에 방문하거나 사이트에 접속하여 이 약관에 따라 회사가 제공하는 정보 및 기타 서비스를 제공받는 회원 및 비회원을 말합니다.
3. 회원이라 함은 BookWorm북클럽 서비스 혜택적용을 위해 회사에 개인정보를 제공하여 회원등록을 한 자로서, 계속적으로 회사가 제공하는 서비스를 이용할 수 있는 자를 말하며 아래와 같이 구분될 수 있습니다.
① 일반회원 : 상품구매 및 구매와 관련하여 제공되는 서비스를 이용할 수 있는 만 14세 이상의 일반회원
② 어린이회원 : 보호자의 동의를 얻어 가입한 만 14세 미만의 회원
③ 법인회원 : 사업자 정보로 가입한 회원
④ 해외거주회원 : 해외거주 주소로 가입한 회원
4. BookWorm북클럽 서비스란 당사와 BookWorm 계열사 및 제휴사가 회원에게 제공하는 회원등급 산정, 마일리지 및 통합포인트 적립, 사용, 할인, 이벤트 참여 등의 전반적인 고객 서비스 프로그램을 말하며 구체적인 내용은 당사와 BookWorm문고 계열사 또는 제휴사와의 관계 및 당사 정책에 의해 달라질 수 있습니다.
5. BookWorm 계열사란 당사와 BookWorm북클럽 서비스 운영과 관련하여 위탁 운영 계약을 맺고 교보북클럽 서비스를 동시 제공하는 회사를 말합니다.
6. 아이디(ID)라 함은 회원의 식별과 서비스이용을 위하여 회원이 정하고 회사가 승인하는 문자 또는 숫자의 조합을 의미합니다.
7. 비회원이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.
8. 간편가입회원이라 함은 회원가입시 실명인증을 받지 않고 필수정보만 입력하여 회사가 제공하는 서비스를 이용하는 자를 말합니다.
9. 비밀번호라 함은 이용자의 동일성 확인과 이용자의 권익 및 비밀보호를 위해 이용자 스스로가 설정하여 등록한 문자, 숫자, 특수문자의 조합을 의미합니다.
10. 디지털상품이라 함은 동영상, eBook, e러닝, 음원과 같이 VOD, 스트리밍, 다운로드 등의 형태로 제공되는 무배송 상품을 말합니다.
11. 게시물이라 함은 이용자가 서비스를 이용함에 있어 서비스 상에 게시한 부호·문자·음성·음향·화상·동영상 등 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
12. 본 조에 정의되지 않은 용어는 일반적인 상관례에 따릅니다.
     
     </textarea><br>

   <br>
   <input type="checkbox" name="req"> 동의합니다
   </td>
   
   <tr>
   <td width="100%" height="50%" align="center">
   <p align="left">
   </p>
   <br>
   <textarea
     rows="10" cols="80" style="padding-left:30;padding-right:10;padding-bottom:30; padding-top:30;">
     1. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
2. 회원은 반드시 회원 본인의 식별이 가능한 인증정보 및 개인정보를 제공하여야만 서비스를 이용할 수 있습니다. 본인인증을 통해 등록되지 않은 사용자는 서비스의 제한을 받을 수 있으며, 일체의 권리를 주장할 수 없습니다.
3. 회원가입은 반드시 실명 또는 실명인증으로 해야 합니다. 실명으로 가입하지 않은 회원에 대해 회사는 실명확인 조치를 할 수 있으며, 실명미인증 가입에 따른 서비스 제한에 대한 책임은 회원에게 있습니다.
4. 교보북클럽 가입 시 이용자의 동의하에 교보문고 및 교보문고 계열사의 매장, 온라인 상의 인터넷 서비스 회원으로 동시에 가입되며, 하나의 통합 ID로 편리하고 안전하게 이용하실 수 있습니다.
5. 회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당되지 않는 한 회원으로 등록합니다.
① 가입신청자가 본 약관 제13조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제13조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 한합니다.
② 신청, 등록 내용에 허위, 기재누락, 오기가 있는 경우
③ 만 14세 미만의 자가 신청하였을 경우 (단, 법정대리인의 동의가 있는 경우에는 회원가입이 가능)
④ 이미 가입된 회원과 이름 및 CI(본인확인기관의 개인식별정보), DI(중복가입 확인정보)가 동일한 경우
⑤ 이 약관에 위배되거나 부당한 이용 신청임이 확인되는 경우
⑥ 회사의 판매 이용약관의 적용을 받는 자가 해당 약관을 위반한 경우
⑦ 기타 회원으로 등록하는 것이 회사의 기술상 현저히 지장이 있다고 판단되는 경우
6. 회원 가입계약의 성립시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.
7. 가입 신청자가 회사에 회원으로 가입하더라도 로그인하지 않은 상태에서 주문하는 경우는 회원주문이 아니라 비회원주문으로 인정합니다.
8. 회원은 제23조에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 등 기타 방법으로 그 변경사항을 알려야 합니다. 이러한 변경사항의 미 통보로 인해 발생하는 손해는 회원에게 그 책임이 있습니다.
제9조 (어린이 회원의 가입에 대한 특칙)
1. 만 14세 미만의 자의 개인정보의 수집절차는 회사의 개인정보처리방침 또는 회원 약관에 따릅니다.
2. 회사는 부모 등 법정대리인의 동의에 대한 확인 절차를 거치지 않은 만 14세 미만의 자에 대해서는 가입을 거절 또는 취소할 수 있습니다.
제10조 (이용자의 ID 및 비밀번호에 대한 의무)
1. ID와 비밀번호에 관한 관리책임은 이용자에게 있으며, 이용자의 고의, 과실로 타인이 사용하게 되어 일어날 수 있는 금전적 손실 등 각종 손해에 대한 책임은 이용자 본인에게 있습니다.
2. 이용자는 자신의 ID 및 비밀번호, 회원번호, 회원카드는 본인이 직접 사용하여야 하며 제3자에게 이용하게 해서는 안됩니다.
3. 이용자의 주소, 전화번호, 이메일 등이 변경되었을 경우에는 사전에 통지하거나 변경해야 하며 변경하지 않아서 발생하는 사고에 대한 책임은 회원 본인에게 있습니다.
4. 이용자가 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.
제11조 (이용자의 의무)
1. 이용자는 다음 행위를 하여서는 안됩니다.
① 개인정보의 입력시 허위내용을 등록(변경의 경우 포함)
② 회사에 게시된 정보를 임의로 변경
③ 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
④ 회사 기타 제3자의 저작권 등 지적재산권에 대한 침해
⑤ 회사 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
⑥ 외설 또는 폭력적인 메시지 화상 음성 기타 공서양속에 반하는 정보를 화면에 공개 또는 게시하는 행위
⑦ 불특정 다수의 자를 대상으로 회사의 서비스를 이용하여 영리목적으로 활동하는 행위
⑧ 사실관계를 왜곡하는 정보제공 행위 등 기타 회사가 부적절하다고 판단하는 행위
⑨ 타인의 정보 도용
2. 이용자는 서비스를 이용함에 있어 아래의 행위를 하여서는 안되며, 해당 행위를 하는 경우에는 서비스 혜택을 지급받지 못하거나 부정한 방법의 결과로 지급받은 금액에 대해서 즉시 반납해야 합니다.
① 구매자가 악의적인 이용(반복주문 뒤 취소와 같은 부정적립 행위)
② 여러 회원 ID를 이용해 부정 적립하는 경우
제12조 (회원카드)
1. 회원으로 등록하신 분께는 교보문고 북클럽 회원카드를 제공해 드립니다.
2. 인터넷 혹은 기타경로로 가입한 회원은 회원카드를 따로 발급하지 않으며, 매장 방문 후 북클럽 안내데스크에서 발급신청 및 수령하실 수 있습니다.
3. 회원카드는 회사매장을 방문하여 도서 구매시 반드시 제시하며, 또는 통신으로 구매시 반드시 회원번호를 통보하여 구매실적이 체크될 수 있도록 해야 합니다. 그렇지 않은 경우에는 회원 실적으로 인정하지 아니합니다.
4. 회원카드를 분실하였을 경우에는 당사로 즉시 연락을 해야 하며, 신고를 하지 않아 발생하는 불이익은 회원 본인에게 책임이 있습니다.
5. 회원카드 재발급 수수료는 회사가 정한 기준에 따르며, 각 매장의 북클럽 안내데스크에서 재발급해 드립니다.
제13조 (회원탈퇴 및 자격 상실)
1. 회원은 회사에 언제든지 탈퇴를 요청할 수 있으며 회사는 즉시 회원탈퇴 요청을 처리합니다.
다만 재화등의 거래가 완료되지 아니한 경우에는 거래를 완료하여야 하며 거래를 철회하거나 취소하는 경우에는 그로 인한 불이익은 회원이 부담하여야 하고, 회원의 회사에 대한 채무(마이너스 예치금, 마이너스 포인트 등 포함)의 이행이 완료되지 아니한 경우에는 완료될 때까지 회원탈퇴가 제한될 수 있습니다.
2. 회원은 정보제공에 동의한 이후에도 회사가 제휴한 사이트에 회원정보를 제공하는 것을 원하지 않을 경우 언제라도 동의철회를 요청할 수 있습니다.
3. 회원이 다음의 각호에 해당되는 경우 회사는 회원에 대하여 일정한 서비스의 이용을 제한하거나 일정기간 회원의 자격을 정지시킬 수 있습니다.
① 가입 시에 허위 내용을 등록하거나 제8조의 신청거부 사유가 있었음이 밝혀진 경우.
② 회사를 이용하여 구입한 재화·용역 등의 대금, 기타 회사 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
③ 타인의 ID와 비밀번호 또는 그 개인정보를 도용한 경우
④ 사이트의 화면에서 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
⑤ 회사를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
⑥ 기타 다음과 같은 행위 등을 반복하여 회사의 건전한 운영을 해하거나 회사의 업무서비스 운영을 고의로 방해하는 행위를 하는 경우
- 회사의 운영에 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 회사의 명예를 실추시키거나 회사의 신뢰성을 해하는 경우
- 회사의 이용과정에서 회사의 직원에게 폭언 또는 음란한 언행을 하여 업무환경을 심각히 해하는 경우
- 회사의 이용과정에서 이유 없는 잦은 연락이나 소란 또는 협박, 인과관계가 입증되지 않는 피해에 대한 보상(적립금, 현금, 상품 등) 요구 등으로 업무를 방해하는 경우
- 회사를 통해 구입한 재화 또는 용역에 특별한 하자가 없는데도 불구하고 일부 사용 후 상습적으로 전부 또는 일부를 반품하는 등 업무를 방해하는 경우
⑦ 다른 사람의 회사 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
⑧ 회원이 부정적립, 부정사용 등 통합포인트(구. 마일리지) 및 북클럽 회원카드를 부정한 방법 또는 목적으로 이용한 경우
- 부정적립 : 회원이 실제로 상품이나 서비스를 구매하지 않았음에도 불구하고 당해 회원에게 통합포인트가 적립된 경우를 말합니다. 그러나 시스템의 오류 등 회원의 귀책사유에 의하지 않고 통합포인트가 적립된 경우나 상품이나 서비스를 실제로 구매한 당사자의 동의가 있어 구매 당사자 대신 다른 회원에게 통합포인트를 적립하는 경우는 이에 제외됩니다.
- 부정적립된 통합포인트는 회원 자격 상실 통보와 함께 동시 소멸하고 이에 대하여 회원은 어떠한 권리도 주장할 수 없습니다. 또한 부정적립 포인트로 상품이나 서비스를 구매하는 등의 부당이득이 발생한 경우 회원 당사자 또는 부정적립 동조자가 당사 또는 제휴사에 대한 민·형사상 책임을 지며, 그로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.
4. 회사가 회원 자격을 제한·정지시킨 후, 동일한 행위를 2회 이상 반복되거나 30일 이내에 그 사유를 시정하지 아니하는 경우 회사는 회원자격을 상실시킬 수 있습니다.
5. 회사가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
     </textarea><br><br>
   <input type="checkbox" name="req2"> 동의합니다<br>
   </td>
  </tr>
  <tr>
   <td align="center" valign="top"><br>
    <input type="button" value="동의" onclick="chk()"/>&nbsp;&nbsp;&nbsp;
    <input type="button" value="동의하지 않습니다" onclick="nochk()"/>
   </td>
   
  </tr>
 </table>
</form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>document.getElementsByTagName("html")[0].className += " js";</script>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link href="resources/css/header.css" rel="stylesheet"/>
  <link rel="stylesheet" href="resources/css/faq.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="resources/assets/vendor/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/animate.css/animate.min.css">
    <link rel="stylesheet" href="resources/assets/vendor/hs-megamenu/src/hs.megamenu.css">
    <link rel="stylesheet" href="resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="resources/assets/vendor/fancybox/jquery.fancybox.css">
    <link rel="stylesheet" href="resources/assets/vendor/slick-carousel/slick/slick.css">
    <link rel="stylesheet" href="resources/assets/documentation/assets/vendor/jquery-ui/themes/base/jquery-ui.min.css">
    <link rel="stylesheet" href="resources/assets/documentation/assets/vendor/prism/prism.css">

    <!-- JS Front -->
    <link rel="stylesheet" href="resources/assets/vendor/animate.css/animate.css">


        <!-- CSS MyTravel Template -->
        <link rel="stylesheet" href="resources/assets/css/theme.css">

        <!-- CSS MyTravel Doc -->
        <link rel="stylesheet" href="resources/assets/documentation/assets/css/starter.css">
  <title>자주 묻는 질문</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<!-- Account Sidebar Navigation - Mobile -->
<aside id="sidebarContent9" class="u-sidebar u-sidebar__lg" aria-labelledby="sidebarNavToggler9">
    <div class="u-sidebar__scroller">
        <div class="u-sidebar__container">
            <div class="u-header-sidebar__footer-offset">
                <!-- Toggle Button -->
                <div class="d-flex align-items-center position-absolute top-0 right-0 z-index-2 mt-5 mr-md-6 mr-4">
                    <button type="button" class="close ml-auto"
                        aria-controls="sidebarContent9"
                        aria-haspopup="true"
                        aria-expanded="false"
                        data-unfold-event="click"
                        data-unfold-hide-on-scroll="false"
                        data-unfold-target="#sidebarContent9"
                        data-unfold-type="css-animation"
                        data-unfold-animation-in="fadeInRight"
                        data-unfold-animation-out="fadeOutRight"
                        data-unfold-duration="500">
                        <span aria-hidden="true">Close <i class="fas fa-times ml-2"></i></span>
                    </button>
                </div>
                <!-- End Toggle Button -->

                <!-- Content -->
                <div class="js-scrollbar u-sidebar__body">
                    <div class="u-sidebar__content u-header-sidebar__content">
                        <form class="">
                            <!-- Login -->
                            <div id="login1" data-target-group="idForm1">
                                <!-- Title -->
                                <header class="border-bottom px-4 px-md-6 py-4">
                                    <h2 class="font-size-3 mb-0 d-flex align-items-center"><i class="flaticon-user mr-3 font-size-5"></i>Account</h2>
                                </header>
                                <!-- End Title -->

                                <div class="p-4 p-md-6">
                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinEmailLabel9" class="form-label" for="signinEmail9">Username or email *</label>
                                            <input type="email" class="form-control rounded-0 height-4 px-4" name="email" id="signinEmail9" placeholder="creativelayers088@gmail.com" aria-label="creativelayers088@gmail.com" aria-describedby="signinEmailLabel9" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinPasswordLabel9" class="form-label" for="signinPassword9">Password *</label>
                                            <input type="password" class="form-control rounded-0 height-4 px-4" name="password" id="signinPassword9" placeholder="" aria-label="" aria-describedby="signinPasswordLabel9" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <div class="d-flex justify-content-between mb-5 align-items-center">
                                        <!-- Checkbox -->
                                        <div class="js-form-message">
                                            <div class="custom-control custom-checkbox d-flex align-items-center text-muted">
                                                <input type="checkbox" class="custom-control-input" id="termsCheckbox1" name="termsCheckbox1" required>
                                                <label class="custom-control-label" for="termsCheckbox1">
                                                    <span class="font-size-2 text-secondary-gray-700">
                                                        Remember me
                                                    </span>
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End Checkbox -->

                                        <a class="js-animation-link text-dark font-size-2 t-d-u link-muted font-weight-medium" href="javascript:;"
                                        data-target="#forgotPassword1"
                                        data-link-group="idForm1"
                                        data-animation-in="fadeIn">Forgot Password?</a>
                                    </div>

                                    <div class="mb-4d75">
                                        <button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Sign In</button>
                                    </div>

                                    <div class="mb-2">
                                        <a href="javascript:;" class="js-animation-link btn btn-block py-3 rounded-0 btn-outline-dark font-weight-medium"
                                        data-target="#signup1"
                                        data-link-group="idForm1"
                                        data-animation-in="fadeIn">Create Account</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Signup -->
                            <div id="signup1" style="display: none; opacity: 0;" data-target-group="idForm1">
                                <!-- Title -->
                                <header class="border-bottom px-4 px-md-6 py-4">
                                    <h2 class="font-size-3 mb-0 d-flex align-items-center"><i class="flaticon-resume mr-3 font-size-5"></i>Create Account</h2>
                                </header>
                                <!-- End Title -->

                                <div class="p-4 p-md-6">
                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinEmailLabel11" class="form-label" for="signinEmail11">Email *</label>
                                            <input type="email" class="form-control rounded-0 height-4 px-4" name="email" id="signinEmail11" placeholder="creativelayers088@gmail.com" aria-label="creativelayers088@gmail.com" aria-describedby="signinEmailLabel11" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinPasswordLabel11" class="form-label" for="signinPassword11">Password *</label>
                                            <input type="password" class="form-control rounded-0 height-4 px-4" name="password" id="signinPassword11" placeholder="" aria-label="" aria-describedby="signinPasswordLabel11" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signupConfirmPasswordLabel9" class="form-label" for="signupConfirmPassword9">Confirm Password *</label>
                                            <input type="password" class="form-control rounded-0 height-4 px-4" name="confirmPassword" id="signupConfirmPassword9" placeholder="" aria-label="" aria-describedby="signupConfirmPasswordLabel9" required>
                                        </div>
                                    </div>
                                    <!-- End Input -->

                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Create Account</button>
                                    </div>

                                    <div class="text-center mb-4">
                                        <span class="small text-muted">Already have an account?</span>
                                        <a class="js-animation-link small" href="javascript:;"
                                            data-target="#login1"
                                            data-link-group="idForm1"
                                            data-animation-in="fadeIn">Login
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Signup -->

                            <!-- Forgot Password -->
                            <div id="forgotPassword1" style="display: none; opacity: 0;" data-target-group="idForm1">
                                <!-- Title -->
                                <header class="border-bottom px-4 px-md-6 py-4">
                                    <h2 class="font-size-3 mb-0 d-flex align-items-center"><i class="flaticon-question mr-3 font-size-5"></i>Forgot Password?</h2>
                                </header>
                                <!-- End Title -->

                                <div class="p-4 p-md-6">
                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinEmailLabel33" class="form-label" for="signinEmail33">Email *</label>
                                            <input type="email" class="form-control rounded-0 height-4 px-4" name="email" id="signinEmail33" placeholder="creativelayers088@gmail.com" aria-label="creativelayers088@gmail.com" aria-describedby="signinEmailLabel33" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Recover Password</button>
                                    </div>

                                    <div class="text-center mb-4">
                                        <span class="small text-muted">Remember your password?</span>
                                        <a class="js-animation-link small" href="javascript:;"
                                            data-target="#login1"
                                            data-link-group="idForm1"
                                            data-animation-in="fadeIn">Login
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Forgot Password -->
                        </form>
                    </div>
                </div>
                <!-- End Content -->
            </div>
        </div>
    </div>
</aside>
<!-- End Account Sidebar Navigation - Mobile -->

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

                <!-- Content -->
                <div class="js-scrollbar u-sidebar__body">
                    <div class="u-sidebar__content u-header-sidebar__content">
                        <form class="">
                            <!-- Login -->
                            <div id="login" data-target-group="idForm">
                                <!-- Title -->
                                <header class="border-bottom px-4 px-md-6 py-4">
                                    <h2 class="font-size-3 mb-0 d-flex align-items-center"><i class="flaticon-user mr-3 font-size-5"></i>Account</h2>
                                </header>
                                <!-- End Title -->

                                <div class="p-4 p-md-6">
                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinEmailLabel" class="form-label" for="signinEmail">Username or email *</label>
                                            <input type="email" class="form-control rounded-0 height-4 px-4" name="email" id="signinEmail" placeholder="creativelayers088@gmail.com" aria-label="creativelayers088@gmail.com" aria-describedby="signinEmailLabel" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinPasswordLabel" class="form-label" for="signinPassword">Password *</label>
                                            <input type="password" class="form-control rounded-0 height-4 px-4" name="password" id="signinPassword" placeholder="" aria-label="" aria-describedby="signinPasswordLabel" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <div class="d-flex justify-content-between mb-5 align-items-center">
                                        <!-- Checkbox -->
                                        <div class="js-form-message">
                                            <div class="custom-control custom-checkbox d-flex align-items-center text-muted">
                                                <input type="checkbox" class="custom-control-input" id="termsCheckbox" name="termsCheckbox" required>
                                                <label class="custom-control-label" for="termsCheckbox">
                                                    <span class="font-size-2 text-secondary-gray-700">
                                                        Remember me
                                                    </span>
                                                </label>
                                            </div>
                                        </div>
                                        <!-- End Checkbox -->

                                        <a class="js-animation-link text-dark font-size-2 t-d-u link-muted font-weight-medium" href="javascript:;"
                                        data-target="#forgotPassword"
                                        data-link-group="idForm"
                                        data-animation-in="fadeIn">Forgot Password?</a>
                                    </div>

                                    <div class="mb-4d75">
                                        <button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Sign In</button>
                                    </div>

                                    <div class="mb-2">
                                        <a href="javascript:;" class="js-animation-link btn btn-block py-3 rounded-0 btn-outline-dark font-weight-medium"
                                        data-target="#signup"
                                        data-link-group="idForm"
                                        data-animation-in="fadeIn">Create Account</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Signup -->
                            <div id="signup" style="display: none; opacity: 0;" data-target-group="idForm">
                                <!-- Title -->
                                <header class="border-bottom px-4 px-md-6 py-4">
                                    <h2 class="font-size-3 mb-0 d-flex align-items-center"><i class="flaticon-resume mr-3 font-size-5"></i>Create Account</h2>
                                </header>
                                <!-- End Title -->

                                <div class="p-4 p-md-6">
                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinEmailLabel1" class="form-label" for="signinEmail1">Email *</label>
                                            <input type="email" class="form-control rounded-0 height-4 px-4" name="email" id="signinEmail1" placeholder="creativelayers088@gmail.com" aria-label="creativelayers088@gmail.com" aria-describedby="signinEmailLabel1" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinPasswordLabel1" class="form-label" for="signinPassword1">Password *</label>
                                            <input type="password" class="form-control rounded-0 height-4 px-4" name="password" id="signinPassword1" placeholder="" aria-label="" aria-describedby="signinPasswordLabel1" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signupConfirmPasswordLabel" class="form-label" for="signupConfirmPassword">Confirm Password *</label>
                                            <input type="password" class="form-control rounded-0 height-4 px-4" name="confirmPassword" id="signupConfirmPassword" placeholder="" aria-label="" aria-describedby="signupConfirmPasswordLabel" required>
                                        </div>
                                    </div>
                                    <!-- End Input -->

                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Create Account</button>
                                    </div>

                                    <div class="text-center mb-4">
                                        <span class="small text-muted">Already have an account?</span>
                                        <a class="js-animation-link small" href="javascript:;"
                                            data-target="#login"
                                            data-link-group="idForm"
                                            data-animation-in="fadeIn">Login
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Signup -->

                            <!-- Forgot Password -->
                            <div id="forgotPassword" style="display: none; opacity: 0;" data-target-group="idForm">
                                <!-- Title -->
                                <header class="border-bottom px-4 px-md-6 py-4">
                                    <h2 class="font-size-3 mb-0 d-flex align-items-center"><i class="flaticon-question mr-3 font-size-5"></i>Forgot Password?</h2>
                                </header>
                                <!-- End Title -->

                                <div class="p-4 p-md-6">
                                    <!-- Form Group -->
                                    <div class="form-group mb-4">
                                        <div class="js-form-message js-focus-state">
                                            <label id="signinEmailLabel3" class="form-label" for="signinEmail3">Email *</label>
                                            <input type="email" class="form-control rounded-0 height-4 px-4" name="email" id="signinEmail3" placeholder="creativelayers088@gmail.com" aria-label="creativelayers088@gmail.com" aria-describedby="signinEmailLabel3" required>
                                        </div>
                                    </div>
                                    <!-- End Form Group -->

                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-block py-3 rounded-0 btn-dark">Recover Password</button>
                                    </div>

                                    <div class="text-center mb-4">
                                        <span class="small text-muted">Remember your password?</span>
                                        <a class="js-animation-link small" href="javascript:;"
                                            data-target="#login"
                                            data-link-group="idForm"
                                            data-animation-in="fadeIn">Login
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Forgot Password -->
                        </form>
                    </div>
                </div>
                <!-- End Content -->
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

                        <div class="px-4 py-5 px-md-6 border-bottom">
                            <div class="media">
                                <a href="#" class="d-block"><img src="https://placehold.it/100x153" class="img-fluid" alt="image-description"></a>
                                <div class="media-body ml-4d875">
                                    <div class="text-primary text-uppercase font-size-1 mb-1 text-truncate"><a href="#">Hard Cover</a></div>
                                    <h2 class="woocommerce-loop-product__title h6 text-lh-md mb-1 text-height-2 crop-text-2">
                                        <a href="#" class="text-dark">The Ride of a Lifetime: Lessons Learned  from 15 Years as CEO</a>
                                    </h2>
                                    <div class="font-size-2 mb-1 text-truncate"><a href="#" class="text-gray-700">Robert Iger</a></div>
                                    <div class="price d-flex align-items-center font-weight-medium font-size-3">
                                        <span class="woocommerce-Price-amount amount">1 x <span class="woocommerce-Price-currencySymbol">$</span>125.30</span>
                                    </div>
                                </div>
                                <div class="mt-3 ml-3">
                                    <a href="#" class="text-dark"><i class="fas fa-times"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="px-4 py-5 px-md-6 border-bottom">
                            <div class="media">
                                <a href="#" class="d-block"><img src="https://placehold.it/100x153" class="img-fluid" alt="image-description"></a>
                                <div class="media-body ml-4d875">
                                    <div class="text-primary text-uppercase font-size-1 mb-1 text-truncate"><a href="#">Hard Cover</a></div>
                                    <h2 class="woocommerce-loop-product__title h6 text-lh-md mb-1 text-height-2 crop-text-2">
                                        <a href="#" class="text-dark">The Rural Diaries: Love, Livestock, and  Big Life Lessons Down</a>
                                    </h2>
                                    <div class="font-size-2 mb-1 text-truncate"><a href="#" class="text-gray-700">Hillary Burton</a></div>
                                    <div class="price d-flex align-items-center font-weight-medium font-size-3">
                                        <span class="woocommerce-Price-amount amount">2 x <span class="woocommerce-Price-currencySymbol">$</span>200</span>
                                    </div>
                                </div>
                                <div class="mt-3 ml-3">
                                    <a href="#" class="text-dark"><i class="fas fa-times"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="px-4 py-5 px-md-6 border-bottom">
                            <div class="media">
                                <a href="#" class="d-block"><img src="https://placehold.it/100x153" class="img-fluid" alt="image-description"></a>
                                <div class="media-body ml-4d875">
                                    <div class="text-primary text-uppercase font-size-1 mb-1 text-truncate"><a href="#">Paperback</a></div>
                                    <h2 class="woocommerce-loop-product__title h6 text-lh-md mb-1 text-height-2 crop-text-2">
                                        <a href="#" class="text-dark">Russians Among Us: Sleeper Cells,  Ghost Stories, and the Hunt.</a>
                                    </h2>
                                    <div class="font-size-2 mb-1 text-truncate"><a href="#" class="text-gray-700">Gordon Corera</a></div>
                                    <div class="price d-flex align-items-center font-weight-medium font-size-3">
                                        <span class="woocommerce-Price-amount amount">6 x <span class="woocommerce-Price-currencySymbol">$</span>100</span>
                                    </div>
                                </div>
                                <div class="mt-3 ml-3">
                                    <a href="#" class="text-dark"><i class="fas fa-times"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="px-4 py-5 px-md-6 d-flex justify-content-between align-items-center font-size-3">
                            <h4 class="mb-0 font-size-3">Subtotal:</h4>
                            <div class="font-weight-medium">$750.00</div>
                        </div>

                        <div class="px-4 mb-8 px-md-6">
                            <button type="submit" class="btn btn-block py-4 rounded-0 btn-outline-dark mb-4">View Cart</button>
                            <button type="submit" class="btn btn-block py-4 rounded-0 btn-dark">Checkout</button>
                        </div>
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
                                        <a href="#" data-submenu="biography">Biographies & Memoirs</a>

                                        <div id="biography" class="submenu">
                                            <div class="submenu-header" data-submenu-close="biography">
                                                <a href="#">Biographies & Memoirs</a>
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

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="children">Children's Books</a>

                                        <div id="children" class="submenu">
                                            <div class="submenu-header" data-submenu-close="children">
                                                <a href="#">Children's Books</a>
                                            </div>

                                            <ul>
                                                <li class="has-submenu">
                                                    <a href="#" data-submenu="electronics">Electronics</a>

                                                    <div id="electronics" class="submenu js-scrollbar">
                                                        <div class="submenu-header" data-submenu-close="electronics">
                                                            <a href="#">Electronics</a>
                                                        </div>

                                                        <ul class="">
                                                            <li>
                                                                <a href="#">Camera & Photo</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Home Audio</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Tv & Video</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Computers & Accessories</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Car & Vehicle Electronics</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Portable Audio & Video</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Headphones</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Accessories & Supplies</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Video Projectors</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Office Electronics</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Wearable Technology</a>
                                                            </li>

                                                            <li>
                                                                <a href="#">Service Plans</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>

                                                <li>
                                                    <a href="#">Books</a>
                                                </li>

                                                <li>
                                                    <a href="#">Video Games</a>
                                                </li>

                                                <li>
                                                    <a href="#">Computers</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="computers">Computers & Technology</a>

                                        <div id="computers" class="submenu">
                                            <div class="submenu-header" data-submenu-close="computers">
                                                <a href="#">Computers & Technology</a>
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

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="sciencemath">Education & Teaching</a>

                                        <div id="sciencemath" class="submenu">
                                            <div class="submenu-header" data-submenu-close="sciencemath">
                                                <a href="#">Education & Teaching</a>
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

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="health">Health, Fitness & Dieting</a>

                                        <div id="health" class="submenu">
                                            <div class="submenu-header" data-submenu-close="health">
                                                <a href="#">Health, Fitness & Dieting</a>
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

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="history">History</a>

                                        <div id="history" class="submenu">
                                            <div class="submenu-header" data-submenu-close="history">
                                                <a href="#">History</a>
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

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="romance">Romance</a>

                                        <div id="romance" class="submenu">
                                            <div class="submenu-header" data-submenu-close="romance">
                                                <a href="#">Romance</a>
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

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="sports">Sports & Outdoors</a>

                                        <div id="sports" class="submenu">
                                            <div class="submenu-header" data-submenu-close="sports">
                                                <a href="#">Sports & Outdoors</a>
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

                                    <li class="has-submenu">
                                        <a href="#" data-submenu="travel">Travel</a>

                                        <div id="travel" class="submenu">
                                            <div class="submenu-header" data-submenu-close="travel">
                                                <a href="#">Travel</a>
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
	

<section class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">
	<ul class="cd-faq__categories">
		<li><a class="cd-faq__category cd-faq__category-selected truncate" href="#basics">기본</a></li>
		<li><a class="cd-faq__category truncate" href="#account">계정</a></li>
		<li><a class="cd-faq__category truncate" href="#payments">결제</a></li>
		<li><a class="cd-faq__category truncate" href="#privacy">구매</a></li>
		<li><a class="cd-faq__category truncate" href="#delivery">블로그</a></li>
		<li><a class="cd-faq__category truncate" href="admin">관리자 전용</a></li>
		
	</ul> <!-- cd-faq__categories -->

	<div class="cd-faq__items">
		<ul id="basics" class="cd-faq__group">
			<li class="cd-faq__title"><h2>기본</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>회원 가입은 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>1</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>로그인은 어떻게 하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>2</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>관리자와의 채팅으로 연결해주세요</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <!-- <a href="chatView">전체채팅</a><br> -->
            <a href="chatadmin?roomid1=admin,${sessionScope.loginId}">관리자 1:1문의</a><br>
            
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->


		<ul id="account" class="cd-faq__group">
			<li class="cd-faq__title"><h2>계정</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>비밀번호는 어떻게 바꾸나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>1</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>계정을 삭제하고 싶어요</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>2</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>회원 정보는 어떻게 수정하나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>3</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>비밀번호를 잊어버렸어요. 어떻게 찾을 수 있나요?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>4</p>
            </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="payments" class="cd-faq__group">
			<li class="cd-faq__title"><h2>결제</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I have an invoice for my subscription?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why did my credit card or PayPal payment fail?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur accusantium dolorem vel, ad, nostrum natus eos, nemo placeat quos nisi architecto rem dolorum amet consectetur molestiae reprehenderit cum harum commodi beatae necessitatibus. Mollitia a nostrum enim earum minima doloribus illum autem, provident vero et, aspernatur quae sunt illo dolorem. Corporis blanditiis, unde, neque, adipisci debitis quas ullam accusantium repudiandae eum nostrum quis! Velit esse harum qui, modi ratione debitis alias laboriosam minus eaque, quod, itaque labore illo totam aut quia fuga nemo. Perferendis ipsa laborum atque assumenda tempore aspernatur a eos harum non id commodi excepturi quaerat ullam, explicabo, incidunt ipsam, accusantium quo magni ut! Ratione, magnam. Delectus nesciunt impedit praesentium sed, aliquam architecto dolores quae, distinctio consectetur obcaecati esse, consequuntur vel sit quis blanditiis possimus dolorum. Eaque architecto doloremque aliquid quae cumque, vitae perferendis enim, iure fugiat, soluta aut!</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why does my bank statement show multiple charges for one upgrade?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="privacy" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Privacy</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I specify my own private key?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>My files are missing! How do I get them back?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I access my account data?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus magni vero deserunt enim et quia in aliquam, rem tempore voluptas illo nisi veritatis quas quod placeat ipsa! Error qui harum accusamus incidunt at libero ipsum, suscipit dolorum esse explicabo in eius voluptates quidem voluptatem inventore amet eaque deserunt veniam dignissimos excepturi? Dolore, quo amet nostrum autem nemo. Sit nam assumenda, corporis ea sunt distinctio nostrum doloribus alias, beatae nesciunt dolore saepe consequuntur minima eveniet porro dolor officiis maiores ab obcaecati officia enim aliquam. Itaque fuga molestiae hic accusantium atque corporis quia id sequi enim vero? Hic aperiam sint facilis aliquam quia, accusamus tenetur earum totam enim est, error. Iusto, reiciendis necessitatibus molestias. Voluptatibus eos explicabo repellat nesciunt nam vero minima.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I control if other search engines can link to my profile?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->

		<ul id="delivery" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Delivery</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>What should I do if my order hasn't been delivered yet?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I find your international delivery information?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Who takes care of shipping?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do returns or refunds work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do I use shipping profiles?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How does your UK Next Day Delivery service work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How does your Next Day Delivery service work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>When will my order arrive?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>When will my order ship?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> <!-- cd-faq__content -->
			</li>
		</ul> <!-- cd-faq__group -->
	</div> <!-- cd-faq__items -->

	<a href="#0" class="cd-faq__close-panel text-replace">Close</a>
  
  <div class="cd-faq__overlay" aria-hidden="true"></div>
</section> <!-- cd-faq -->
<%@ include file="../footer.jsp" %>
<script src="resources/js/faqutil.js"></script> <!-- util functions included in the CodyHouse framework -->
	<script src="resources/js/faqmain.js"></script> 

<!-- JS Global Compulsory -->
        <script src="resources/assets/vendor/jquery/dist/jquery.min.js"></script>
        <script src="resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
        <script src="resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
        <script src="resources/assets/vendor/bootstrap/bootstrap.min.js"></script>

        <!-- JS Implementing Plugins -->
        <script src="resources/assets/vendor/appear.js"></script>
        <script src="resources/assets/vendor/hs-megamenu/src/hs.megamenu.js"></script>
        <script src="resources/assets/vendor/fancybox/jquery.fancybox.min.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/jquery-ui.core.min.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/ui/widgets/menu.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/ui/widgets/mouse.js"></script>
        <script src="resources/assets/documentation/assets/vendor/jquery-ui/ui/widgets/autocomplete.js"></script>
        <script src="resources/assets/documentation/assets/vendor/prism/prism.js"></script>
        <script src="resources/assets/vendor/slick-carousel/slick/slick.js"></script>

        <!-- JS Bookworm -->
        <script src="resources/assets/js/hs.core.js"></script>
        <script src="resources/assets/js/components/hs.header.js"></script>
        <script src="resources/assets/js/components/hs.unfold.js"></script>
        <script src="resources/assets/js/components/hs.fancybox.js"></script>
        <script src="resources/assets/js/components/hs.slick-carousel.js"></script>
        <script src="resources/assets/documentation/assets/js/components/hs.autocomplete-local-search.js"></script>
        <script src="resources/assets/js/components/hs.malihu-scrollbar.js"></script>
        <script src="resources/assets/js/components/hs.selectpicker.js"></script>
        <script src="resources/assets/js/components/hs.show-animation.js"></script>

        <!-- JS Plugins Init. -->
        <script>

            $(document).on('ready', function () {

                // initialization of header
                $.HSCore.components.HSHeader.init($('#header'));

                // initialization of unfold component
                $.HSCore.components.HSUnfold.init($('[data-unfold-target]'));

                

                // initialization of slick carousel
                $.HSCore.components.HSSlickCarousel.init('.js-slick-carousel');

                // initialization of go to
                

                // initialization of autocomplet
                $.HSCore.components.HSLocalSearchAutocomplete.init('.js-hs-docs-search');

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
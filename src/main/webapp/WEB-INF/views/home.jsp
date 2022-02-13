<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link href="resources/css/header.css" rel="stylesheet"/>
	<link href="resources/css/slide.css" rel="stylesheet"/>
	<body>
    <div class="container">
	
<header id="container">
<div id="nav-bar">
	<div id="nav-belt">
		<div class="nav-left">
			<div id="nav-logo">
				<a href="/">LOGO</a>
			</div>
		</div>
		<div class="nav-fill">
			<div id="nav-search">
				<form id="nav-search-bar-form">
					<div class="nav-left">
						<a href="">ALL</a>
					</div>
					<div class="nav-fill">
						<input type="text">
					</div>
					<div class="nav-right">
						<button type="submit">Search</button>
					</div>
					
				</form>
			</div>
		</div>
		<div class="nav-right">
			<div id="nav-tools">
				<c:if test="${sessionScope.loginId == null}">
				<a href="join">sign up</a>
				<a href="login">Log in</a>
				</c:if>
				<a href="logout">Log out</a>
				<a href="cart">Cart</a>
			</div>
		</div>
	</div>
	<div id="nav-main">
	</div>
</div>
</header>
</div>

<c:if test="${sessionScope.loginId != null}">
		<h3>${sessionScope.loginId}님 환영합니다.</h3>
<b>
<a href="myblog" style="color:red;">개인 블로그</a>
<a href="myblog/main" style="color:red;">개인 블로그</a><br>
<a href="blogmain" style="color:red;">블로그 메인</a>
<a href="bookInfo" style="color:red;">책 상세정보</a><br>
<a href="customerservice" style="color:red;">고객센터</a>
<a href="bookInfo" style="color:red;">책 상세정보</a><br>
</c:if>
</b>

<div class="card-body">

<div class="container">
<div class="slider-container">
  <div class="slider">
    <div class="slides">
      <div id="slides__1" class="slide">
        <span class="slide__text">1</span>
        <a class="slide__prev" href="#slides__4" title="Next"></a>
        <a class="slide__next" href="#slides__2" title="Next"></a>
      </div>
      <div id="slides__2" class="slide">
        <span class="slide__text">2</span>
        <a class="slide__prev" href="#slides__1" title="Prev"></a>
        <a class="slide__next" href="#slides__3" title="Next"></a>
      </div>
      <div id="slides__3" class="slide">
        <span class="slide__text">3</span>
        <a class="slide__prev" href="#slides__2" title="Prev"></a>
        <a class="slide__next" href="#slides__4" title="Next"></a>
      </div>
      <div id="slides__4" class="slide">
        <span class="slide__text">4</span>
        <a class="slide__prev" href="#slides__3" title="Prev"></a>
        <a class="slide__next" href="#slides__1" title="Prev"></a>
      </div>
    </div>
    <div class="slider__nav">
      <a class="slider__navlink" href="#slides__1"></a>
      <a class="slider__navlink" href="#slides__2"></a>
      <a class="slider__navlink" href="#slides__3"></a>
      <a class="slider__navlink" href="#slides__4"></a>
    </div>
  </div>
</div>

</div> 
<div class="card-footer">Footer</div>
</div>

</body>
</html>

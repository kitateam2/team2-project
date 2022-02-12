<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<link href="resources/css/slide.css" rel="stylesheet"/>
	<link href="resources/css/header.css" rel="stylesheet"/>
	<header id="container">
<div id="nav-bar">
	<div id="nav-belt">
		<div class="nav-left">
			<div id="nav-logo">
				<a href="home">book</a>
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
				<a href="condition">condition</a>
				</c:if>
				<a href="logout">Log out</a>
				<a href="cart">Cart</a>
			</div>
		</div>
	</div>
		
	</div>
</div>



<c:if test="${sessionScope.loginId != null}">
		<h2>${sessionScope.loginId}님 환영합니다.</h2>

<a href="myblog">개인 블로그</a>
<a href="myblog/main">개인 블로그</a>
<a href="blogmain">블로그 메인</a>
<a href="bookinfo">책 상세정보</a>
<a href="customerservice">고객센터</a>
</c:if>
</header>
	
</head>

<body>

<main>
<div class="container">
	
	<input type="radio" id="i1" name="images" checked />
	<input type="radio" id="i2" name="images" />
	<input type="radio" id="i3" name="images" />
	<input type="radio" id="i4" name="images" />
	<input type="radio" id="i5" name="images" />	
	
	<div class="slide_img" id="one">			
			
			<img src="http://www.bhmpics.com/wallpapers/little_pony_art-800x480.jpg">
			
				<label class="prev" for="i5"><span>&#x2039;</span></label>
				<label class="next" for="i2"><span>&#x203a;</span></label>	
		
	</div>
	
	<div class="slide_img" id="two">
		
			<img src="https://preview.ibb.co/e5OShF/cropped_800_480_111290.jpg " >
			
				<label class="prev" for="i1"><span>&#x2039;</span></label>
				<label class="next" for="i3"><span>&#x203a;</span></label>
		
	</div>
			
	<div class="slide_img" id="three">
			<img src="http://wallpaperswide.com/download/up_house-wallpaper-1280x800.jpg">	
			
				<label class="prev" for="i2"><span>&#x2039;</span></label>
				<label class="next" for="i4"><span>&#x203a;</span></label>
	</div>

	<div class="slide_img" id="four">
			<img src="http://wallpaperswide.com/download/big_hero_6_baymax-wallpaper-1152x720.jpg">	
			
				<label class="prev" for="i3"><span>&#x2039;</span></label>
				<label class="next" for="i5"><span>&#x203a;</span></label>
	</div>

	<div class="slide_img" id="five">
			<img src="http://www.wallpapereast.com/static/images/toys-wallpaper-hd-16339-17046-hd-wallpapers.jpg">	
			
				<label class="prev" for="i4"><span>&#x2039;</span></label>
				<label class="next" for="i1"><span>&#x203a;</span></label>

	</div>

	<div id="nav_slide">
		<label for="i1" class="dots" id="dot1"></label>
		<label for="i2" class="dots" id="dot2"></label>
		<label for="i3" class="dots" id="dot3"></label>
		<label for="i4" class="dots" id="dot4"></label>
		<label for="i5" class="dots" id="dot5"></label>
	</div>
		
</div>

</main>


  <div class="footer">
    <p>
      <span>풋터입니다</span>
    </p>
  </div>




</body>
</html>

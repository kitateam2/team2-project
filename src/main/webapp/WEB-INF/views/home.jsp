<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<<<<<<< HEAD
=======
	<link href="resources/css/slide.css" rel="stylesheet"/>
	<link href="resources/css/header.css" rel="stylesheet"/>
>>>>>>> my
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
<<<<<<< HEAD
=======
				<a href="condition">condition</a>
>>>>>>> my
				</c:if>
				<a href="logout">Log out</a>
				<a href="cart">Cart</a>
			</div>
		</div>
	</div>
		
	</div>
</div>
<<<<<<< HEAD
</header>
</head>
<style>
:root {
	--main-header-bg: #232f3e;
	--second-header-bg: #131921;
	--main-border: #ff9000;
	--main-border-shadow: #febd69;
	--main-text: #f3a847;
	--second-text: white;
	--main-search-opt: #cdcdcd;
	--second-search-opt: #f3f3f3;
	--border-radius: 0.2rem;
	background: white;
}
a {
	text-decoration: none;
	color: black;
}
header {
	background: var(--main-header-bg);
	height: 5rem;
	font-size: 1rem;
	display: flex;
}

#nav-bar {
	display: flex;
	flex-flow: column nowrap;
	flex: 1;
}

#nav-belt {
	display: flex;
	height: 3.5rem;
	width: 100%;
	background: var(--second-header-bg);
}

#nav-belt > .nav-left {
	box-sizing: border-box;
	display: flex;
}

#nav-logo {
	box-sizing: border-box;
	display: flex;
	padding: 0.5rem 0 0.5rem 0.5rem;
}

#nav-logo > a {
	box-sizing: content-box;
	display: flex;
	align-items: center;
	padding: 0 0.5rem 0 0.5rem;
	margin: 0.1rem;
}

#nav-logo > a:hover {
	border: 0.1rem solid var(--main-border);
	border-radius: var(--border-radius);
	margin: 0;
	color: var(--main-text);
	box-shadow: 0rem 0rem 0.3rem var(--main-border-shadow);
}

#nav-belt > .nav-fill {
	box-sizing: border-box;
	display: flex;
	flex: 1 1 auto;
}

#nav-search {
	box-sizing: border-box;
	width: auto;
	display: flex;
	flex: 1 1 auto;
	padding: 0.5rem 0.5rem 0.5rem 0.5rem;
	overflow: hidden;
}

#nav-search-bar-form {
	box-sizing: border-box;
	display: flex;
	flex: 1 1 auto;
	border-radius: var(--border-radius);
	overflow: hidden;
}

#nav-search-bar-form:focus-within {
	box-sizing: border-box;
	border: 0.2rem solid var(--main-border);
	margin: 0 -0.2rem 0 -0.2rem;
	box-shadow: 0rem 0rem 0.3rem var(--main-border-shadow);
}

#nav-search-bar-form .nav-left {
	box-sizing: border-box;
	display: flex;
	background: var(--second-search-opt);
	align-items: center;
}

#nav-search-bar-form .nav-left a {
	display: flex;
	color: black;
	padding: 0 0.5rem 0 0.5rem;
	flex: 1 1 auto;
	width: 100%;
	height: 100%;
	align-items: center;
}

#nav-search-bar-form .nav-left a:hover {
	background: var(--main-search-opt);
}

#nav-search-bar-form .nav-fill {
	box-sizing: border-box;
	display: flex;
	flex: 1 1 auto;
	overflow-x: hidden;
	overflow-y: hidden;
	background: white;
	border-left: 0.1rem solid var(--main-search-opt);
	border-right: 0.1rem solid var(--main-text);
}

#nav-search-bar-form .nav-fill input {
	box-sizing: border-box;
	flex: 1 1 auto;
	padding: 0;
	font-size: 1rem;
	text-indent: 0.5rem;
	border: 0;
}

#nav-search-bar-form .nav-fill > input:focus {
	outline: none;
}

#nav-search-bar-form .nav-right {
	box-sizing: border-box;
	display: flex;
	background: var(--main-border-shadow);
	align-items: center;
}

#nav-search-bar-form .nav-right > button {
	display: flex;
	flex: 1 1 auto;
	align-items: center;
	border: 0;
	background: var(--main-border-shadow);
	width: 100%;
	height: 100%;
	padding: 0 0.5rem 0 0.5rem;
	cursor: pointer;
}

#nav-search-bar-form .nav-right > button:hover {
	background: var(--main-text);
}

#nav-belt > .nav-right {
	box-sizing: border-box;
	display: flex;
}

#nav-tools {
	display: flex;
	flex: 1 1 auto;
	padding: 0.5rem 0.5rem 0.5rem 0;
}

#nav-tools > a {
	box-sizing: border-box;
	display: flex;
	flex: 1 1 auto;
	align-items: center;
	padding: 0 0.5rem 0 0.5rem;
	margin: 0.1rem;
}

#nav-tools > a:hover {
	border: 0.1rem solid var(--main-border);
	border-radius: var(--border-radius);
	margin: 0;
	color: var(--main-text);
	box-shadow: 0rem 0rem 0.3rem var(--main-border-shadow);
}

h2 {
float: right;
}

</style>
<body>


<h1>
	Hello world!  
</h1>

<a href="myblog/main">개인 블로그</a> 로그인 하지 않은 상태에서도 개인블로그 내에서 잘 되는지 확인하려고 만든 임시 링크 입니다.
<hr>
<a href="bookInfo">책 상세정보</a> 로그인 하지 않은 상태에서도 검색 잘 되는지 확인하려고 만든 임시 링크 입니다.


<c:if test="${sessionScope.loginId != null}">
		<h2>${sessionScope.loginId}님 환영합니다.</h2>

<a href="myblog">개인 블로그</a>
<a href="myblog/main">개인 블로그</a>
<a href="blogmain">블로그 메인</a>
<a href="bookInfo">책 상세정보</a>
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
